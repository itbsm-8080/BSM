unit ufrmBrowsePesanan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCxBrowse, Menus, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FMTBcd, Provider, SqlExpr, ImgList,
  ComCtrls, StdCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels;

type
  TfrmBrowsePesanan = class(TfrmCxBrowse)
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowsePesanan: TfrmBrowsePesanan;

implementation
   uses ufrmPesanan,Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowsePesanan.btnRefreshClick(Sender: TObject);
begin
  Self.SQLMaster := 'select so_nomor Nomor,so_tanggal Tanggal ,so_Memo Memo ,cus_nama  Supplier,if(so_isclosed=0,"Belum","Sudah") Closed, '
                  + ' so_amount Total,so_taxamount Ppn,sls_nama Salesman'
                  + ' from tso_hdr'
                  + ' inner join tcustomer on cus_kode=so_cus_kode'
                  + ' inner join tso_dtl on sod_so_nomor=so_nomor'
                  + ' inner join tsalesman on sls_kode=so_sls_kode '
                  + ' where so_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
                  + ' group by so_nomor ,so_tanggal ,so_memo ,cus_nama ';

  Self.SQLDetail := 'select so_nomor Nomor,brg_kode Kode , brg_nama Nama,sod_brg_satuan Satuan,sod_qty Jumlah,sod_harga Harga,sod_discpr Disc,'
                    + ' (sod_harga*sod_qty*(100-sod_discpr)/100) Nilai,'
                    + ' sod_qty_kirim Terkirim'
                    + ' from tso_dtl'
                    + ' inner join tso_hdr on sod_so_nomor =so_nomor'
                    + ' inner join tbarang on sod_brg_kode=brg_kode'
                    + ' where so_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime) ;
 Self.MasterKeyField := 'Nomor';
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=100;
    cxGrdMaster.Columns[2].Width :=200;
    cxGrdMaster.Columns[3].Width :=200;
    cxGrdMaster.Columns[4].Width :=80;
    cxGrdMaster.Columns[5].Width :=80;
    cxGrdMaster.Columns[6].Width :=70;
    cxGrdMaster.Columns[6].Width :=100;

    cxGrdDetail.Columns[2].Width :=200;
    cxGrdDetail.Columns[3].Width :=80;

end;

procedure TfrmBrowsePesanan.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowsePesanan.cxButton2Click(Sender: TObject);
var
  frmPesanan: TfrmPesanan;
begin
  inherited;
    if ActiveMDIChild.Caption <> 'Pesanan Barang' then
   begin
      frmPesanan  := frmmenu.ShowForm(TfrmPesanan) as TfrmPesanan;
      frmPesanan.edtNomor.Text := frmPesanan.getmaxkode;
   end;
   frmPesanan.Show;
end;

procedure TfrmBrowsePesanan.cxButton1Click(Sender: TObject);
var
  frmPesanan: TfrmPesanan;
begin
  inherited;
  If CDSMaster.FieldByname('Nomor').IsNull then exit;
  if ActiveMDIChild.Caption <> 'Pesanan Barang' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmPesanan  := frmmenu.ShowForm(TfrmPesanan) as TfrmPesanan;
      frmPesanan.ID := CDSMaster.FieldByname('Nomor').AsString;
      frmPesanan.FLAGEDIT := True;
      frmPesanan.edtnOMOR.Text := CDSMaster.FieldByname('Nomor').AsString;
      frmPesanan.loaddataALL(CDSMaster.FieldByname('Nomor').AsString);

   end;
   frmPesanan.Show;
end;

procedure TfrmBrowsePesanan.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmBrowsePesanan.cxButton3Click(Sender: TObject);
begin
  inherited;
//  frmPesanan.doslipPO(CDSMaster.FieldByname('Nomor').AsString);
end;

end.
