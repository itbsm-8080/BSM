unit ufrmProsesAmbilJurnal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox,DBClient, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxSpinEdit,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, MemDS, DBAccess,
  MyAccess;

type
  TfrmProsesAmbilJurnal = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    AdvPanel2: TAdvPanel;
    lbljudul: TLabel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    Label5: TLabel;
    Label1: TLabel;
    startdate: TDateTimePicker;
    cxExtLookupCabang: TcxExtLookupComboBox;
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure simpandata;
    procedure FormShow(Sender: TObject);
    function cekintransit(anomorjurnal:string):Boolean;
    function GetCDSCabang: TClientDataset;
    procedure FormCreate(Sender: TObject);
    function getdatabase(akode:string):string;    
  private
    FCDScabang: TClientDataset;

    adatabase :string;
       protected
    { Private declarations }
  public
     property CDSCabang: TClientDataset read GetCDSCabang write FCDSCabang;
    { Public declarations }
  end;

var
  frmProsesAmbilJurnal: TfrmProsesAmbilJurnal;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure TfrmProsesAmbilJurnal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F8 then
  begin
      Release;
  end;


  if Key= VK_F10 then
  begin
    try
        if ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Yakin ingin Proses ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;

   except
     ShowMessage('Gagal Simpan');
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);
  end;
end;

procedure TfrmProsesAmbilJurnal.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;



procedure TfrmProsesAmbilJurnal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;


procedure TfrmProsesAmbilJurnal.cxButton1Click(Sender: TObject);
begin
    try
         if ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Yakin ingin Proses ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;

   except
      MessageDlg('Gagal Simpan',mtWarning, [mbOK],0);
     // xRollback(frmMenu.conn);
     Exit;
   end;
         MessageDlg('Proses selesai',mtWarning, [mbOK],0);
    // xCommit(frmMenu.conn);
end;

procedure TfrmProsesAmbilJurnal.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmProsesAmbilJurnal.cxButton2Click(Sender: TObject);
begin
   try
         if ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;

   except
     ShowMessage('Gagal Simpan');
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);
    Release;
end;

procedure TfrmProsesAmbilJurnal.simpandata;
var
  s:string;
  tsql:TmyQuery;

  tt:TStrings;
  i:integer;

begin
cShowWaitWindow('Proses ambil jurnal Keuangan');
//  if ComboBox1.ItemIndex = 0 then
//     adatabase:='bsmcabang.'
//  else if ComboBox1.ItemIndex = 1 then
//     adatabase := 'bsmcabang2.';

  adatabase := getdatabase(cxExtLookupCabang.EditValue)+'.';
//  if getdatabase(cxExtLookupCabang.EditValue) = 'bsm' then
//  begin
    MyConnection1.Server := '103.103.22.7';
    MyConnection1.Username := 'root';
    MyConnection1.Password := 'BsmCabang321??';
    MyConnection1.Database := getdatabase(cxExtLookupCabang.EditValue);
//  end
//  else
//  begin
//    MyConnection1.Server := '192.168.194.41';
//    MyConnection1.Username := 'admin';
//    MyConnection1.Database := getdatabase(cxExtLookupCabang.EditValue);
//  end;
  MyConnection1.Connected;

  s:='select * from ' + adatabase + 'tjurnal where '
  + ' jur_tipetransaksi in'
  + ' ("Penerimaan Relasi", "Pembayaran Lain", "Penerimaan Lain","Advance","Jurnal Umum","Pencairan Giro","biaya promosi") '
  + ' and ((date_create >= '+ quotd(startdate.date)+') OR (date_modified >= '+ quotd(startdate.date)+'))';
  MyQuery1.Close;
  MyQuery1.sql.Text :=s;
  MyQuery1.open;
  tt := TStringList.Create;

  with MyQuery1 do
  begin
    try
      while not eof do
      begin

        s:=' delete from bsm.tjurnal where jur_no = ' + Quot(FieldByName('jur_no').AsString)+';';
          tt.Append(s);
        s:=' delete from bsm.tjurnalitem where jurd_jur_no = ' + Quot(FieldByName('jur_no').AsString)+';';
          tt.Append(s);
        if not cekintransit(FieldByName('jur_no').AsString) then
        begin

          s:=' insert into bsm.tjurnal (jur_no,jur_tipetransaksi,jur_tanggal,jur_keterangan,date_create) values ('
            + Quot(fieldbyname('jur_no').AsString) + ','
            + Quot(fieldbyname('jur_tipetransaksi').AsString) + ','
            + quotd(fieldbyname('jur_tanggal').asdatetime) + ','
            + Quot(fieldbyname('jur_keterangan').AsString) + ','
            + Quotd(fieldbyname('date_create').AsDateTime) + ');';
          tt.Append(s);
          s:=' insert into bsm.tjurnalitem (jurd_jur_no,jurd_rek_kode,jurd_kredit,jurd_debet,jurd_nourut,jurd_cc_kode,jurd_keterangan,jurd_cus_kode,jurd_kar_nik,jurd_nopol,jurd_ekspedisi,jurd_kilometer ) '
          + ' select jurd_jur_no,jurd_rek_kode,jurd_kredit,jurd_debet,jurd_nourut,jurd_cc_kode,jurd_keterangan,jurd_cus_kode,jurd_kar_nik,jurd_nopol,jurd_ekspedisi,jurd_kilometer from '+adatabase+'tjurnalitem where jurd_jur_no='+ Quot(fieldbyname('jur_no').AsString);
          tt.Append(s);

        end;
        Next;
      end;
    finally
//      free;
    end;
  end;
//  tt.SaveToFile('d:\k.sql');
      try
        for i:=0 to tt.Count -1 do
        begin
            // xExecQuery(tt[i],frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, tt[i]);
        end;
      finally
        tt.Free;
        cCloseWaitWindow;
      end;

end;
procedure TfrmProsesAmbilJurnal.FormShow(Sender: TObject);
begin
startdate.Date :=Date;
end;

function TfrmProsesAmbilJurnal.cekintransit(anomorjurnal:string):Boolean;
var
  s:string;
  tsql:TmyQuery;
begin
  Result := False;
  s:='select * from '+ adatabase+'tjurnalitem where jurd_jur_no ='+ Quot(anomorjurnal)
   + ' and jurd_rek_kode in ("13.002","12.999")' ;
  tsql:= xOpenQuery(s,frmMenu.conn);
  with tsql do begin
    try
      if not Eof then
         Result :=True;
    finally
      free;
    end;
  end;
end;

function TfrmProsesAmbilJurnal.GetCDScabang: TClientDataset;
var s:String;
begin
  If not Assigned(FCDScabang) then
  begin
    S := 'select cbg_nama as Nama, cbg_kode Kode'
        +' from tcabang where cbg_aktif = 0';

    FCDScabang := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDScabang;
end;


procedure TfrmProsesAmbilJurnal.FormCreate(Sender: TObject);
begin
  with TcxExtLookupHelper(cxExtLookupCabang.Properties) do
    LoadFromCDS(CDSCabang, 'Kode','Nama',['Kode'],Self);
end;


function TfrmProsesAmbilJurnal.getdatabase(akode:string):string;
var
  s:string;
  tsql:TmyQuery;
begin
  Result := 'bsm';
  s:=' select cbg_database from tcabang where cbg_kode ='+ Quot(akode);


  tsql:= xOpenQuery(s,frmMenu.conn);
  with tsql do begin
    try
      if not Eof then
         Result :=Fields[0].AsString;
    finally
      free;
    end;
  end;

end;


end.
