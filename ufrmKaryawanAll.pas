unit ufrmKaryawanAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, AdvEdBtn, MyAccess;

type
  TfrmKaryawanAll = class(TForm)
    AdvPanel1: TAdvPanel;
    Label2: TLabel;
    edtKode: TAdvEdit;
    Label3: TLabel;
    edtNama: TAdvEdit;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    AdvPanel2: TAdvPanel;
    lbljudul: TLabel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    chkaktif: TCheckBox;
    edtcicilan: TAdvEdit;
    edtsimpanan: TAdvEdit;
    edtkdunit: TAdvEditBtn;
    edtnamaunit: TAdvEdit;
    procedure refreshdata;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure loaddata(akode:string) ;
    procedure simpandata;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function getmaxkode:string;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure edtKodeExit(Sender: TObject);
    procedure edtkdunitClickBtn(Sender: TObject);

  private
    FFLAGEDIT: Boolean;
    FID: string;


    { Private declarations }
  public
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;
    { Public declarations }
  end;

var
  frmKaryawanAll: TfrmKaryawanAll;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib, DB;

{$R *.dfm}

procedure TfrmKaryawanAll.refreshdata;
begin
  FID:='';
//  edtKode.Enabled := False;
//  edtKode.Text := getmaxkode;
  edtNama.Clear;
  edtNama.SetFocus;
end;
procedure TfrmKaryawanAll.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F8 then
  begin
      Release;
  end;


  if Key= VK_F10 then
  begin
    try
      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;
      
      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('Gagal Simpan');
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);
  end;
end;

procedure TfrmKaryawanAll.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmKaryawanAll.loaddata(akode:string) ;
var
  s: string;
  tsql : TmyQuery;
begin
  s:= 'select * from tkaryawanall left join tunit on id=kar_id_unit where kar_nik = ' + Quot(akode) ;
tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    if not Eof then
    begin
      FLAGEDIT := True;
      edtKode.Enabled := False;
      edtNama.Text := fieldbyname('kar_nama').AsString;
      edtcicilan.Text := formatfloat('###,###,##0',fieldbyname('kar_cicilanterakhir').asfloat);
      edtsimpanan.Text := formatfloat('###,###,##0',fieldbyname('kar_defaultsimpanan').asfloat);
      edtnamaunit.Text := fieldbyname('nama').AsString;
      edtkdunit.Text := fieldbyname('kar_id_unit').AsString;
      if fieldbyname('kar_isaktif').AsString='Y' then
         chkaktif.Checked := true
      else
        chkaktif.Checked := false;
        
      FID :=fieldbyname('kar_nik').Asstring;
    end
    else
     FLAGEDIT := False;

  finally
    Free;
  end;
end;

end;


procedure TfrmKaryawanAll.simpandata;
var
  s:string;
  astatus:String;
begin
  if chkaktif.Checked then
     astatus :='Y'
  else
     astatus :='N';
if FLAGEDIT then
  s:='update tkaryawanall set '
    + ' kar_nama = ' + Quot(edtNama.Text)+','
    + ' kar_id_unit = ' + Quot(edtkdunit.Text)+','
    + ' kar_isaktif = ' + Quot(astatus)+','
    + ' kar_cicilanterakhir = ' + StringReplace(edtcicilan.Text,',','',[rfReplaceAll])+','
    + ' kar_defaultsimpanan = ' + StringReplace(edtsimpanan.Text,',','',[rfReplaceAll])
    + ' where kar_nik = ' + quot(FID) + ';'
else
begin
// edtKode.Text := getmaxkode;
  s :=  ' insert into tkaryawanall '
             + ' (kar_nik,kar_nama,kar_id_unit,kar_isaktif,kar_cicilanterakhir,kar_defaultsimpanan) '
             + ' values ( '
             + Quot(edtKode.Text) + ','
             + Quot(edtNama.Text) +' ,'
             + Quot(edtkdunit.Text) +','
             + Quot(astatus) + ','
             + StringReplace(edtcicilan.Text,',','',[rfReplaceAll]) + ','
             + StringReplace(edtsimpanan.Text,',','',[rfReplaceAll])
             + ');';
end;
  // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);

end;


procedure TfrmKaryawanAll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmKaryawanAll.getmaxkode:string;
var
  s:string;
begin
  s:='select max(jc_kode) from tjeniscustomer';
  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= '1'
      else
         result:= IntToStr(fields[0].AsInteger+1);

    finally
      free;
    end;
  end;
end;

procedure TfrmKaryawanAll.cxButton1Click(Sender: TObject);
begin
    try
      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('Gagal Simpan');
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);
end;

procedure TfrmKaryawanAll.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmKaryawanAll.cxButton2Click(Sender: TObject);
begin
   try
      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('Gagal Simpan');
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);
    Release;
end;

procedure TfrmKaryawanAll.edtKodeExit(Sender: TObject);
begin
loaddata(edtKode.Text);
end;

procedure TfrmKaryawanAll.edtkdunitClickBtn(Sender: TObject);
begin
    sqlbantuan := 'select id,nama from tunit ';

  Application.CreateForm(Tfrmbantuan,frmbantuan);
  frmBantuan.SQLMaster := SQLbantuan;
  frmBantuan.ShowModal;
  if varglobal <> '' then
   begin


      edtkdunit.Text := varglobal;
      edtnamaunit.Text := varglobal1;



  end;

end;

end.
