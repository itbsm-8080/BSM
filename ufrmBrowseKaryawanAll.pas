unit ufrmBrowseKaryawanAll;

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
  TfrmBrowseKaryawanAll = class(TfrmCxBrowse)
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseKaryawanAll: TfrmBrowseKaryawanAll;

implementation
   uses ufrmKaryawanAll,Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowseKaryawanAll.btnRefreshClick(Sender: TObject);
begin
  Self.SQLMaster := 'SELECT kar_nik Kode,kar_nama Nama,nama Unit ,kar_cicilanterakhir Cicilan, kar_defaultsimpanan SimpananWajib,kar_isaktif Aktif ,'
  + ' (SELECT ifnull(SUM(jurd_debet-jurd_kredit),0) FROM tjurnalitem  WHERE jurd_kar_nik=kar_nik AND jurd_rek_kode="14.017")  Piutang,'
  + ' (SELECT ifnull(SUM(jurd_kredit-jurd_debet),0) FROM tjurnalitem  WHERE jurd_kar_nik=kar_nik AND jurd_rek_kode="19.014") Simpanan'
+ ' FROM tkaryawanall INNER JOIN tunit on kar_id_unit=id';
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=200;
    cxGrdMaster.Columns[2].Width :=100;
    cxGrdMaster.Columns[3].Width :=100;
    cxGrdMaster.Columns[4].Width :=100;
    cxGrdMaster.Columns[5].Width :=100;
    cxGrdMaster.Columns[6].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[6].Summary.FooterFormat:='###,###,###,###';
    cxGrdMaster.Columns[4].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[4].Summary.FooterFormat:='###,###,###,###';
        cxGrdMaster.Columns[3].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[3].Summary.FooterFormat:='###,###,###,###';
        cxGrdMaster.Columns[7].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[7].Summary.FooterFormat:='###,###,###,###';
end;

procedure TfrmBrowseKaryawanAll.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowseKaryawanAll.cxButton2Click(Sender: TObject);
var
  frmkaryawanall: Tfrmkaryawanall;
begin
  inherited;
    if ActiveMDIChild.Caption <> 'Master Karyawan' then
   begin
      frmkaryawanall  := frmmenu.ShowForm(Tfrmkaryawanall) as Tfrmkaryawanall;
//      frmkaryawanall.edtKode.Text := frmkaryawanall.getmaxkode;
//      frmkaryawanall.edtKode.Enabled :=false;
      frmkaryawanall.edtkode.setfocus;
   end;
   frmkaryawanall.Show;
end;

procedure TfrmBrowseKaryawanAll.cxButton1Click(Sender: TObject);
var
  frmjeniscustomer: Tfrmkaryawanall;
begin
  inherited;
  If CDSMaster.FieldByname('KODE').IsNull then exit;
  if ActiveMDIChild.Caption <> 'Master Jenis Customer' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmjeniscustomer  := frmmenu.ShowForm(Tfrmkaryawanall) as Tfrmkaryawanall;
      frmjeniscustomer.ID := CDSMaster.FieldByname('KODE').AsString;
      frmjeniscustomer.FLAGEDIT := True;
      frmjeniscustomer.edtKode.Text := CDSMaster.FieldByname('KODE').AsString;
      frmjeniscustomer.loaddata(CDSMaster.FieldByname('KODE').AsString);
      frmjeniscustomer.edtKode.Enabled := False;
      frmjeniscustomer.edtnama.setfocus;
   end;
   frmjeniscustomer.Show;
end;

procedure TfrmBrowseKaryawanAll.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmBrowseKaryawanAll.cxButton4Click(Sender: TObject);
var
  s:string;
begin
  inherited;
     try
       if not cekdelete(frmMenu.KDUSER,'frmkaryawanall') then
      begin
         MessageDlg('Anda tidak berhak Menghapus di Modul ini',mtWarning, [mbOK],0);
         Exit;
      End;
      if MessageDlg('Yakin ingin hapus ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;
       s:='delete from tjeniscustomer '
        + ' where jc_kode = ' + quot(CDSMaster.FieldByname('KODE').AsString) + ';' ;
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
