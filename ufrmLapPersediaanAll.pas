unit ufrmLapPersediaanAll;

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
  TfrmLapPersediaanAll = class(TfrmCxBrowse)
    cxButton5: TcxButton;
    SaveDialog1: TSaveDialog;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapPersediaanAll: TfrmLapPersediaanAll;

implementation
   uses ufrmbarang,Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmLapPersediaanAll.btnRefreshClick(Sender: TObject);
begin

  Self.SQLMaster := ' select Cabang,brg_kode Kode ,brg_nama Nama,brg_satuan Satuan,Stok,IN_Terakhir,AvgSales,stok/Avgsales TOR'
                  + ' from StokAll ';

//  Self.SQLMaster := 'select brg_kode Kode ,brg_nama Nama,brg_satuan Satuan,ktg_nama Kategori,'
//  + ' gr_nama Tipe,brg_hrgjual HargaJual,brg_Stok Stok '
//  + ' from tbarang '
//  + ' inner join tkategori on ktg_kode=brg_ktg_kode'
//  + ' inner join tgroup on gr_kode=brg_gr_kode';



   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=80;
    cxGrdMaster.Columns[1].Width :=80;
    cxGrdMaster.Columns[2].Width :=150;
    cxGrdMaster.Columns[3].Width :=100;
    cxGrdMaster.Columns[4].Width :=100;
    cxGrdMaster.Columns[5].Width :=100;

end;

procedure TfrmLapPersediaanAll.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
//  btnRefreshClick(Self);
end;

procedure TfrmLapPersediaanAll.cxButton2Click(Sender: TObject);
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

procedure TfrmLapPersediaanAll.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmLapPersediaanAll.cxButton4Click(Sender: TObject);
var
  s:string;
begin
  inherited;
     try
       if not cekdelete(frmMenu.KDUSER,'frmBarang') then
      begin
         MessageDlg('Anda tidak berhak Menghapus di Modul ini',mtWarning, [mbOK],0);
         Exit;
      End;
      if MessageDlg('Yakin ingin hapus ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;
       s:='delete from tbarang '
        + ' where brg_kode = ' + quot(CDSMaster.FieldByname('KODE').AsString) + ';' ;
      // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);


      CDSMaster.Delete;
   except
     MessageDlg('Gagal Hapus',mtError, [mbOK],0);
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);

end;

end.
