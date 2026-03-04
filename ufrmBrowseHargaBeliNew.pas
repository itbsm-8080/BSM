unit ufrmBrowsehargabelinew;

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
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, DBAccess,
  MyAccess;

type
  TfrmBrowseHargaBeliNew = class(TfrmCxBrowse)
    cxButton5: TcxButton;
    MyConnection1: TMyConnection;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseHargaBeliNew: TfrmBrowseHargaBeliNew;

implementation
   uses ufrmbarang,Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowseHargaBeliNew.btnRefreshClick(Sender: TObject);
begin

  Self.SQLMaster := ' SELECT brg_kode Kode,brg_nama Nama,invd_harga Harga,invd_discpr Disc,'
              + ' inv_tanggal Tanggal,sup_nama Supplier FROM tinv_dtl INNER JOIN'
              + ' tinv_hdr ON inv_nomor=invd_inv_nomor'
              + ' INNER JOIN tbarang ON brg_kode=invd_brg_kode'
              + ' INNER JOIN tsupplier ON sup_kode=inv_sup_kode'
              + ' WHERE invd_otorisasi = 1'
              + ' and inv_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime);

   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=80;
    cxGrdMaster.Columns[1].Width :=200;
    cxGrdMaster.Columns[3].Width :=80;
    cxGrdMaster.Columns[5].Width :=200;


end;

procedure TfrmBrowseHargaBeliNew.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowseHargaBeliNew.cxButton2Click(Sender: TObject);
var
  frmBarang: TfrmBarang;
begin
  inherited;
    if ActiveMDIChild.Caption <> 'Master Barang' then
   begin
      frmBarang  := frmmenu.ShowForm(TfrmBarang) as TfrmBarang;
      frmBarang.edtKode.SetFocus;
      frmBarang.edtKode.Text := IntToStr(frmBarang.getmaxkode);
      frmBarang.cxLookupJenisGroup.EditValue := 1;
   end;
   frmBarang.Show;
end;

procedure TfrmBrowseHargaBeliNew.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmBrowseHargaBeliNew.cxButton5Click(Sender: TObject);
var
  s:string;
begin
  inherited;

  CDSMaster.First;
  while not CDSMaster.Eof do
  begin
    s:='insert ignore into bsm.thargabelinew (kode,nama,hna,disc,tanggal,sup_nama) values ('
     + Quot(CDSMaster.Fields[0].AsString) + ','
     + Quot(CDSMaster.Fields[1].AsString) + ','
     + floattostr(CDSMaster.Fields[2].AsFloat) + ','
     + floattostr(CDSMaster.Fields[3].AsFloat) + ','
     + Quotd(CDSMaster.Fields[4].AsDateTime) + ','
     + Quot(CDSMaster.Fields[5].AsString) + ');';
     MyConnection1.ExecSQL(s,[]);
    CDSMaster.Next;
  end;

    showmessage('Proses Berhasil')

end;

end.
