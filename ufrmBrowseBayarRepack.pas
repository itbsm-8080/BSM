unit ufrmBrowseBayarRepack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCxBrowse, Menus, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FMTBcd, Provider, SqlExpr, ImgList,
  ComCtrls, StdCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels;

type
  TfrmBrowseBayarRepack = class(TfrmCxBrowse)
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
  frmBrowseBayarRepack: TfrmBrowseBayarRepack;

implementation
   uses ufrmBayarRepack,Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowseBayarRepack.btnRefreshClick(Sender: TObject);
begin
  Self.SQLMaster := ' select barep_nomor Nomor,barep_tanggal Tanggal,barep_keterangan Keterangan,barep_nilai Nilai'
                  + ' from tbayarrepack_hdr '
                  + ' where '
                  + ' barep_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime) ;

  Self.SQLDetail := 'select barepd_barep_nomor Nomor,barepd_korh_nomor Nomor_Produksi, barepd_qty Jumlah,barepd_qty*barepd_tarif Nilai from tbayarrepack_hdr'
                    + ' inner join tbayarrepack_dtl on barep_nomor=barepd_barep_nomor'
                    + ' where '
                    + ' barep_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
                    + ' order by barep_nomor';
 Self.MasterKeyField := 'Nomor';
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=100;
    cxGrdMaster.Columns[2].Width :=200;
    cxGrdMaster.Columns[3].Width :=100;

    cxGrdDetail.Columns[2].Width :=200;
    cxGrdDetail.Columns[3].Width :=80;
//    cxGrdMaster.Columns[4].Summary.FooterKind:=skSum;
//    cxGrdMaster.Columns[4].Summary.FooterFormat:='###,###,###,###';

end;

procedure TfrmBrowseBayarRepack.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowseBayarRepack.cxButton2Click(Sender: TObject);
var
  frmBayarRepack: TfrmBayarRepack;
begin
  inherited;
    if ActiveMDIChild.Caption <> 'Bayar Repack' then
   begin
      frmBayarRepack  := frmmenu.ShowForm(TfrmBayarRepack) as TfrmBayarRepack;
      if frmBayarRepack.FLAGEDIT = false then 
      frmBayarRepack.edtNomor.Text := frmBayarRepack.getmaxkode;
   end;
   frmBayarRepack.Show;
end;

procedure TfrmBrowseBayarRepack.cxButton1Click(Sender: TObject);
var
  frmBayarRepack: TfrmBayarRepack;
begin
  inherited;
  If CDSMaster.FieldByname('Nomor').IsNull then exit;
  if ActiveMDIChild.Caption <> 'Pembayaran Lain lain' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmBayarRepack  := frmmenu.ShowForm(TfrmBayarRepack) as TfrmBayarRepack;
      frmBayarRepack.ID := CDSMaster.FieldByname('Nomor').AsString;
      frmBayarRepack.FLAGEDIT := True;
      frmBayarRepack.edtnOMOR.Text := CDSMaster.FieldByname('Nomor').AsString;
      frmBayarRepack.loaddataALL(CDSMaster.FieldByname('Nomor').AsString);
      if CDSMaster.FieldByname('IsClosed').AsString = 'Sudah' then
      begin
        ShowMessage('Transaksi ini sudah tutup Periode,Tidak dapat di edit');
        frmBayarRepack.cxButton2.Enabled :=False;
        frmBayarRepack.cxButton1.Enabled :=False;
      end;
   end;
   frmBayarRepack.Show;
end;

procedure TfrmBrowseBayarRepack.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmBrowseBayarRepack.cxButton3Click(Sender: TObject);
begin
  inherited;
  frmBayarRepack.doslipmutasi(CDSMaster.FieldByname('Nomor').AsString);
end;

end.
