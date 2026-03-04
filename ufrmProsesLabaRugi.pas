unit ufrmProsesLabaRugi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,  AdvGrid, ComCtrls, StdCtrls, AdvEdit, ExtCtrls,
  AdvPanel, AdvCGrid, BaseGrid,SqlExpr, DBAdvGrd, DB, DBClient, Provider,
  FMTBcd, RAWPrinter, StrUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxSpinEdit, cxCalendar, Menus, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxButtonEdit, cxCurrencyEdit,ExcelXP,ComObj,
  AdvCombo,DateUtils, cxPC, MyAccess;

type
  TfrmProsesLabaRugi = class(TForm)
    AdvPanel1: TAdvPanel;
    lbljudul: TLabel;
    AdvPanel2: TAdvPanel;
    AdvPanel3: TAdvPanel;
    Label3: TLabel;
    Label5: TLabel;
    RAWPrinter1: TRAWPrinter;
    AdvPanel4: TAdvPanel;
    cxButton8: TcxButton;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    PopupMenu1: TPopupMenu;
    HapusRecord1: TMenuItem;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    cbbBulan: TAdvComboBox;
    edtTahun: TComboBox;
    Button2: TButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGrid: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    clNo: TcxGridDBColumn;
    clSKU: TcxGridDBColumn;
    clNama: TcxGridDBColumn;
    clGapok: TcxGridDBColumn;
    clCabang: TcxGridDBColumn;
    cxGrdDetail: TcxGridDBTableView;
    lvMaster: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxlabarugi: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    MainMenu1: TMainMenu;
    cxGrid2: TcxGrid;
    cxbiaya: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxButton7: TcxButton;
    SaveDialog1: TSaveDialog;
    cxbiayaColumn1: TcxGridDBColumn;
    Label1: TLabel;
    cxExtLookupCabang: TcxExtLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure refreshdata;
    procedure simpandata;
    procedure dosliP(anomor : string );
    function GetCDS: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure insertketampungan(anomor:string);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);

    procedure initgrid;
    procedure HapusRecord1Click(Sender: TObject);
    procedure clNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cxLookupGudangAsalPropertiesEditValueChanged(
      Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function GetCDS1: TClientDataSet;
    function GetCDS2: TClientDataSet;
    procedure labarugi;
    procedure loaddataall;
    procedure prosessolo;
    procedure prosesjogja;
    procedure prosespersediaanpusat;
    procedure prosespersediaansolo;
    procedure prosespersediaanjogja;
    procedure prosespembelian;
    procedure prosessample;
    function getbiayakirim(abulan : integer ; atahun : string) : Double ;
    procedure cxButton7Click(Sender: TObject);
    private
     buttonSelected  : integer;
     FID : STRING;
     FCDSSKU : TClientDataset;
     FCDSGudang: TClientDataset;
    FCDSPabrik: TClientDataset;
        FFLAGEDIT: Boolean;
     xtotal : Double;
         function GetCDSGudang: TClientDataset;
    function GetCDSPabrik: TClientDataset;

      { Private declarations }
     protected
    FCDS: TClientDataSet;
    FCDS1: TClientDataSet;
    FCDS2: TClientDataSet;
  public
      property CDS: TClientDataSet read GetCDS write FCDS;
    property CDS1: TClientDataSet read GetCDS1 write FCDS1;
    property CDS2: TClientDataSet read GetCDS2 write FCDS2;
          property CDSSKU: TClientDataSet read FCDSSKU write FCDSSKU;
       property CDSGudang: TClientDataset read GetCDSGudang write FCDSGudang;
    property CDSPabrik: TClientDataset read GetCDSPabrik write FCDSPabrik;
          property ID: string read FID write FID;
            property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    { Public declarations }
  end;

var
  frmProsesLabaRugi: TfrmProsesLabaRugi;

implementation

uses MAIN,uModuleConnection,uFrmbantuan,Ulib,uReport,cxgridExportlink;

{$R *.dfm}

procedure TfrmProsesLabaRugi.Button1Click(Sender: TObject);
var
 anomor , s,ss:string;
 tsql:TmyQuery;
begin
//// proses jurnal biaya promosi total per cabang
//   s:= 'select '
//    + ' sum((Fp_biayapr*((fp_amount-fp_taxamount-ifnull((select sum(retj_amount) from tretj_hdr  where retj_fp_nomor = fp_nomor),0) ))/100) + fp_biayarp) '
//    + ' from bsmcabang.tfp_hdr '
//    + ' where month(fp_tanggal)= '+ IntToStr(cbbBulan.ItemIndex+1)
//    + ' and year(fp_tanggal)='+ edtTahun.Text ;
//   tsql :=xOpenQuery(s,frmMenu.conn);
//   with tsql do
//   begin
//
//      anomor :='01.BP'+edtTahun.Text+IntToStr(cbbBulan.ItemIndex+1)+'001';
//      ss:='delete from tjurnalitem where jurd_jur_no = '+ Quot(anomor)+';';
//      xExecQuery(ss,frmMenu.conn);
//      ss:='delete from tjurnal where jur_no = '+ Quot(anomor)+';';
//      xExecQuery(ss,frmMenu.conn);
//      ss:='insert into tjurnal (jur_tanggal,jur_tipetransaksi,jur_no,jur_keterangan,date_create,user_create) values ('
//        + Quot(edtTahun.Text+'/'+IntToStr(cbbBulan.ItemIndex+1)+'/1') + ','
//        + quot('Biaya Promosi') + ','
//        + quot(anomor) + ','
//        + quot('Biaya Promosi') + ','
//        + quotd(Date) +','
//        + Quot('admin')+');';
//      xExecQuery(ss,frmMenu.conn);
//      ss:='insert into tjurnalitem (jurd_jur_no,jurd_rek_kode,jurd_debet,jurd_kredit,jurd_nourut,jurd_cc_kode) values ('
//        + Quot(anomor) + ','
//        + Quot('24.004') + ','
//        + FloatToStr(Fields[0].asfloat) + ',0,1,"D0002");';
//      xExecQuery(ss,frmMenu.conn);
//           ss:='insert into tjurnalitem (jurd_jur_no,jurd_rek_kode,jurd_debet,jurd_kredit,jurd_nourut) values ('
//        + Quot(anomor) + ','
//        + Quot('19.008') + ',0,'
//        + FloatToStr(Fields[0].asfloat) + ',1);';
//      xExecQuery(ss,frmMenu.conn);
//
//   end;
//// proses jurnal biaya promosi total per cabang
//   s:= 'select '
//    + ' sum((Fp_biayapr*((fp_amount-fp_taxamount-ifnull((select sum(retj_amount) from tretj_hdr  where retj_fp_nomor = fp_nomor),0) ))/100) + fp_biayarp) '
//    + ' from bsmcabang2.tfp_hdr '
//    + ' where month(fp_tanggal)= '+ IntToStr(cbbBulan.ItemIndex+1)
//    + ' and year(fp_tanggal)='+ edtTahun.Text ;
//   tsql :=xOpenQuery(s,frmMenu.conn);
//   with tsql do
//   begin
//      anomor :='02.BP'+edtTahun.Text+IntToStr(cbbBulan.ItemIndex+1)+'001';
//      ss:='delete from tjurnalitem where jurd_jur_no = '+ Quot(anomor)+';';
//      xExecQuery(ss,frmMenu.conn);
//      ss:='delete from tjurnal where jur_no = '+ Quot(anomor)+';';
//      xExecQuery(ss,frmMenu.conn);
//      ss:='insert into tjurnal (jur_tanggal,jur_tipetransaksi,jur_no,jur_keterangan,date_create,user_create) values ('
//        + Quot(edtTahun.Text+'/'+IntToStr(cbbBulan.ItemIndex+1)+'/1') + ','
//        + quot('Biaya Promosi') + ','
//        + quot(anomor) + ','
//        + quot('Biaya Promosi') + ','
//        + quotd(Date) +','
//        + Quot('admin')+');';
//      xExecQuery(ss,frmMenu.conn);
//      ss:='insert into tjurnalitem (jurd_jur_no,jurd_rek_kode,jurd_debet,jurd_kredit,jurd_nourut,jurd_cc_kode) values ('
//        + Quot(anomor) + ','
//        + Quot('24.004') + ','
//        + FloatToStr(Fields[0].asfloat) + ',0,1,"D0003");';
//      xExecQuery(ss,frmMenu.conn);
//           ss:='insert into tjurnalitem (jurd_jur_no,jurd_rek_kode,jurd_debet,jurd_kredit,jurd_nourut) values ('
//        + Quot(anomor) + ','
//        + Quot('19.008') + ',0,'
//        + FloatToStr(Fields[0].asfloat) + ',1);';
//      xExecQuery(ss,frmMenu.conn);
//
//   end;

loaddataall;
simpandata;
Button2Click(self);
end;

procedure TfrmProsesLabaRugi.FormShow(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmProsesLabaRugi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TfrmProsesLabaRugi.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     SelectNext(ActiveControl,True,True);
end;

procedure TfrmProsesLabaRugi.refreshdata;
begin
  FID:='';
  FLAGEDIT :=False;
  edttahun.text :=  FormatDateTime('yyyy',Date);
  initgrid;
end;

procedure TfrmProsesLabaRugi.simpandata;
var
  s:string;
  i:integer;
  tt : TStrings;
  anomor : string;

begin
    s:='delete from tlabarugi where lr_periode='+ IntToStr(cbbBulan.ItemIndex+1)
  + ' and lr_tahun = '+ edtTahun.Text
  +';';
  // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);

   tt := TStringList.Create;
   CDS.First;
    i:=1;
  while not CDS.Eof do
  begin
    S:='insert into tlabarugi (lr_periode,lr_tahun,lr_kode,lr_nama,lr_nilai,lr_cabang) values ('
      + IntToStr(cbbBulan.ItemIndex+1)   +','
      + edtTahun.Text +','
      + Quot(CDS.FieldByName('kode').AsString) +','
      + Quot(CDS.FieldByName('nama').AsString) +','
      + FloatToStr(cVarToFloat(CDS.FieldByName('nilai').AsFloat))+','
      + Quot(CDS.FieldByName('cabang').AsString)
      + ');';
    tt.Append(s);
    CDS.Next;
    Inc(i);
  end;
  tt.SaveToFile('d:\aaaa.txt');
     try
        for i:=0 to tt.Count -1 do
        begin
            // xExecQuery(tt[i],frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, tt[i]);
        end;
      finally
        tt.Free;
      end;


end;
procedure TfrmProsesLabaRugi.doslip(anomor : string );
var
  s: string ;
  ftsreport : TTSReport;
begin
  insertketampungan(anomor);
  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'koreksi';

          s:= ' select '
       + ' *'
       + ' from tkor_hdr a '
       + ' inner join tampung e on e.nomor =a.korh_nomor '
       + ' left join  tkor_dtl b on korh_nomor=kord_korh_nomor and e.tam_nama=b.kord_brg_kode and e.expired=b.kord_expired'
       + ' left join tbarang c on b.kord_brg_kode=c.brg_kode '
       + ' LEFT join tgudang d on gdg_kode=korh_gdg_kode'
       + ' where '
       + ' a.korh_nomor=' + quot(anomor);
    ftsreport.AddSQL(s);
    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;


procedure TfrmProsesLabaRugi.insertketampungan(anomor:String);
var
  s:string;
  tsql : TmyQuery;
  a,i,x:integer;
  tt : TStrings;
begin
  a:=14;
  s:='delete from tampung ';
  // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);
  // xCommit(frmMenu.conn);
  s := 'select kord_BRG_kode,kord_expired from tkor_dtl where kord_korh_nomor =' + Quot(anomor) ;
  tsql := xOpenQuery(s,frmMenu.conn) ;
  x:=0;
  tt:=TStringList.Create;

    with tsql do
    begin
      try
       while not Eof do
       begin
         x:=x+1;
          s :=   'insert  into tampung '
                  + '(nomor,tam_nama,expired'
                  + ')values ('
                  + Quot(anomor) + ','
                  + Quot(Fields[0].Asstring)+','
                  + quotd(Fields[1].AsDateTime)
                  + ');';
          tt.Append(s);
        Next
       end;
       finally
          free;
      end;
    end;


  for i := x to a do
   begin


        s :='insert  into tampung '
            + '(nomor,tam_nama'
            + ')values ('
            + Quot(anomor) + ','
            + Quot('-')
            + ');';
        tt.Append(s);

   end;
   try
    for i:=0 to tt.Count -1 do
    begin
        // xExecQuery(tt[i],frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, tt[i]);
    end;
  finally
    tt.Free;
  end;
    // xCommit(frmMenu.conn);

end;

procedure TfrmProsesLabaRugi.FormCreate(Sender: TObject);
begin
  with TcxExtLookupHelper(cxExtLookupCabang.Properties) do
    LoadFromCDS(CDSPabrik, 'Kode','Nama',['Kode'],Self);

  TcxDBGridHelper(cxGrdMain).LoadFromCDS(CDS, False, False);
  TcxDBGridHelper(cxlabarugi).LoadFromCDS(CDS2, False, False);
  TcxDBGridHelper(cxbiaya).LoadFromCDS(CDS1, False, False);
//     initViewSKU;
end;

function TfrmProsesLabaRugi.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'No', ftInteger, False);
    zAddField(FCDS, 'kode', ftString, False,255);
    zAddField(FCDS, 'Nama', ftString, False,100);
    zAddField(FCDS, 'nilai', ftFloat, False);
    zAddField(FCDS, 'cabang', ftString, False,10);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmProsesLabaRugi.GetCDSGudang: TClientDataset;
var s:String;
begin
  If not Assigned(FCDSGudang) then
  begin
    S := 'select gdg_nama as Gudang, gdg_kode Kode '
        +' from tgudang';


    FCDSGudang := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDSGudang;
end;



procedure TfrmProsesLabaRugi.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmProsesLabaRugi.cxButton2Click(Sender: TObject);
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

procedure TfrmProsesLabaRugi.cxButton1Click(Sender: TObject);
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


procedure TfrmProsesLabaRugi.initgrid;
begin
  CDS.EmptyDataSet;
  CDS.Append;
  CDS.Post;
end;



procedure TfrmProsesLabaRugi.HapusRecord1Click(Sender: TObject);
begin
 If CDS.Eof then exit;
  CDS.Delete;
  If CDS.Eof then initgrid;
end;

procedure TfrmProsesLabaRugi.clNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  If Assigned(ARecord) then
  begin
    AText := Inttostr(ARecord.Index+1);
  end;
end;

procedure TfrmProsesLabaRugi.cxLookupGudangAsalPropertiesEditValueChanged(
  Sender: TObject);
begin
//initViewSKU;
end;

procedure TfrmProsesLabaRugi.Button2Click(Sender: TObject);
var
  s:string;
  tsql :TmyQuery;
begin
  s := ' select lr_kode ,lr_nama ,lr_nilai,lr_cabang  from tlabarugi '
     + ' inner join tkomponenlabarugi on lr_kode=klr_kode '
     + ' where '
     + ' lr_periode = ' + IntToStr(cbbBulan.ItemIndex+1)
     + ' and lr_tahun = ' + edtTahun.Text
     + ' order by klr_idkelompok,lr_kode '
     + ';';
    tsql := xOpenQuery(s,frmMenu.conn) ;
   try
       with  tsql do
       begin
         CDS.EmptyDataSet;
         while  not Eof do
         begin
                CDS.Append;
                CDS.FieldByName('kode').AsString := Fieldbyname('lr_kode').AsString;
                CDS.FieldByName('Nama').AsString := Fieldbyname('lr_nama').AsString;
                CDS.FieldByName('nilai').asfloat  := Fieldbyname('lr_nilai').asfloat;
                CDS.FieldByName('cabang').AsString := Fieldbyname('lr_cabang').AsString;
                CDS.Post;
                next;
         end ;
      end;
   finally
     tsql.Free;
   end;
      labarugi;

   s := ' select rek_nama nama,sum(jurd_debet-jurd_kredit) nilai,cc_nama costcenter from tjurnal inner join tjurnalitem on '
      + ' jur_no=jurd_jur_no '
      + ' inner join trekening on rek_kode=jurd_rek_kode '
      + ' left join tcostcenter on cc_kode=jurd_cc_kode '
      + ' where rek_kode <> "23.043" and rek_kol_id in (12,13) and month(jur_tanggal)= '+ IntToStr(cbbBulan.ItemIndex+1)
      + ' and year(jur_tanggal)='+ edtTahun.Text
      + ' group by rek_nama,cc_nama' ;

   tsql := xOpenQuery(s,frmMenu.conn) ;
   try
       with  tsql do
       begin
         CDS1.EmptyDataSet;
         while  not Eof do
         begin
                CDS1.Append;
                CDS1.FieldByName('Nama').AsString := Fieldbyname('nama').AsString;
                CDS1.FieldByName('nilai').asfloat  := Fieldbyname('nilai').asfloat;
                CDS1.FieldByName('costcenter').AsString := Fieldbyname('costcenter').AsString;

                CDS1.Post;
                next;
         end ;
      end;
   finally
     tsql.Free;
   end;
end;

function TfrmProsesLabaRugi.GetCDS1: TClientDataSet;
begin
  If not Assigned(FCDS1) then
  begin
    FCDS1 := TClientDataSet.Create(Self);
    zAddField(FCDS1, 'No', ftInteger, False);
    zAddField(FCDS1, 'Nama', ftString, False,100);
    zAddField(FCDS1, 'nilai', ftFloat, False);
    zAddField(FCDS1, 'costcenter', ftString, False,100);

    FCDS1.CreateDataSet;
  end;
  Result := FCDS1;
end;

function TfrmProsesLabaRugi.GetCDS2: TClientDataSet;
begin
  If not Assigned(FCDS2) then
  begin
    FCDS2 := TClientDataSet.Create(Self);
    zAddField(FCDS2, 'No', ftInteger, False);
    zAddField(FCDS2, 'Nama', ftString, False,100);
    zAddField(FCDS2, 'nilai', ftFloat, False);
    FCDS2.CreateDataSet;
  end;
  Result := FCDS2;
end;

procedure TfrmProsesLabaRugi.labarugi;
var
  s:string;
  tsql :TmyQuery;
  TSAMPLE,TJUAL,TPOTONGAN,TRETUR,TAKHIR,TAWAL,TPEMBELIAN,TSIAP : DOUBLE;
begin
  s := 'select llr_nama nama , sum(ifnull(lr_nilai,0)) nilai , llr_kode kode from tlaporanlr left join tkomponenlabarugi on llr_kode=klr_idkelompok '
      + ' left join tlabarugi on lr_kode=klr_kode'
      + ' and lr_periode= ' + IntToStr(cbbBulan.ItemIndex+1)
      + ' and lr_tahun= ' + edtTahun.Text
      + ' group by llr_nama '
      + ' order by llr_no '
      + ';';
    tsql := xOpenQuery(s,frmMenu.conn) ;
   try

       with  tsql do
       begin
             TJUAL:= 0;
             TPOTONGAN:=0;
             TRETUR := 0;
             TAWAL := 0;
             TPEMBELIAN:=0;
             TSIAP := 0;
             TAKHIR := 0;
             TSAMPLE := 0;
             CDS2.EmptyDataSet;
            while  not Eof do
             begin
                    IF FieldByName('Kode').asinteger = 1 then
                       tjual := tjual +Fieldbyname('nilai').asfloat;
                    IF FieldByName('Kode').asinteger IN [2,3] then
                       tpotongan := tpotongan + Fieldbyname('nilai').asfloat;
                    iF FieldByName('Kode').asinteger IN [4] then
                       tsample := tsample + Fieldbyname('nilai').asfloat;
                    IF FieldByName('Kode').asinteger IN [5] then
                       tretur := tretur + Fieldbyname('nilai').asfloat;
                    IF FieldByName('Kode').asinteger IN [6] then
                       TAWAL := TAWAL+ Fieldbyname('nilai').asfloat;
                    IF FieldByName('Kode').asinteger IN [7] then
                       TPEMBELIAN := TPEMBELIAN + Fieldbyname('nilai').asfloat;
                    IF FieldByName('Kode').asinteger IN [8] then
                       TPEMBELIAN := TPEMBELIAN + Fieldbyname('nilai').asfloat;
                    IF FieldByName('Kode').asinteger IN [9] then
                       TPEMBELIAN := TPEMBELIAN + Fieldbyname('nilai').asfloat;
                    IF FieldByName('Kode').asinteger IN [10] then
                       TPEMBELIAN := TPEMBELIAN + Fieldbyname('nilai').asfloat;
                    IF FieldByName('Kode').asinteger IN [11] then
                       TAKHIR := Fieldbyname('nilai').asfloat;


                    CDS2.Append;
                    CDS2.FieldByName('Nama').AsString := Fieldbyname('nama').AsString;
                    CDS2.FieldByName('nilai').asfloat  := Fieldbyname('nilai').asfloat;
                    CDS2.Post;
                   next;
            end ;
      end;
   finally
     tsql.Free;
   end;
  CDS2.First;
  while not CDS2.Eof do
  begin

    IF CDS2.fieldbyname('NAMA').asstring = 'PENJUALAN' then
    begin
      If CDS2.State <> dsEdit then CDS2.Edit;
       CDS2.fieldbyname('nilai').asfloat := tjual;

    end;
    IF CDS2.fieldbyname('NAMA').asstring = 'POTONGAN PENJUALAN' then
    begin
      If CDS2.State <> dsEdit then CDS2.Edit;
       CDS2.fieldbyname('nilai').asfloat := TPOTONGAN+TSAMPLE;
    end;
    IF CDS2.fieldbyname('NAMA').asstring = 'RETUR PENJUALAN' then
    begin
      If CDS2.State <> dsEdit then CDS2.Edit;
       CDS2.fieldbyname('nilai').asfloat := Tretur;
    end;
    IF CDS2.fieldbyname('NAMA').asstring = 'TOTAL PENJUALAN BERSIH' then
    begin
      If CDS2.State <> dsEdit then CDS2.Edit;
       CDS2.fieldbyname('nilai').asfloat := TJUAL-TPOTONGAN-Tretur-TSAMPLE;
    end;
    IF CDS2.fieldbyname('NAMA').asstring = 'PEMBELIAN' then
    begin
      If CDS2.State <> dsEdit then CDS2.Edit;
       CDS2.fieldbyname('nilai').asfloat := TPEMBELIAN;
    end;
    IF CDS2.fieldbyname('NAMA').asstring = 'BARANG SIAP DIJUAL' then
    begin
      If CDS2.State <> dsEdit then CDS2.Edit;
       CDS2.fieldbyname('nilai').asfloat := TAWAL + TPEMBELIAN;
    end;

    IF CDS2.fieldbyname('NAMA').asstring = 'HPP' then
    begin
      If CDS2.State <> dsEdit then CDS2.Edit;
       CDS2.fieldbyname('nilai').asfloat := (TAWAL + TPEMBELIAN)-TAKHIR;
    end;

    IF CDS2.fieldbyname('NAMA').asstring = 'LABA KOTOR' then
    begin
      If CDS2.State <> dsEdit then CDS2.Edit;
       CDS2.fieldbyname('nilai').asfloat := (TJUAL-TPOTONGAN-Tretur-TSAmple) - ((TAWAL + TPEMBELIAN)-TAKHIR);
    end;

   cds2.next;
  end;

end;


 procedure TfrmProsesLabaRugi.loaddataall;
var
  s: string ;
  tsql : TmyQuery;
  i:Integer;
begin

  s := ' select klr_kode kode,klr_nama nama,0 nilai,klr_cabang  from tkomponenlabarugi'
     + ';';

    tsql := xOpenQuery(s,frmMenu.conn) ;
   try

       with  tsql do
       begin
            flagedit := True;
            i:=1;
             CDS.EmptyDataSet;
            while  not Eof do
             begin
                    CDS.Append;
                    CDS.FieldByName('kode').AsString := Fieldbyname('kode').AsString;
                    CDS.FieldByName('Nama').AsString := Fieldbyname('nama').AsString;
                    CDS.FieldByName('nilai').asfloat  := Fieldbyname('nilai').asfloat;
                    CDS.FieldByName('cabang').AsString := Fieldbyname('klr_cabang').AsString;
                      CDS.Post;
                   i:=i+1;
                   next;
            end ;
      end;
   finally
     tsql.Free;
   end;
   prosessolo;
   prosesjogja;
   prosespersediaanpusat;
   prosespersediaansolo;
   prosespersediaanjogja;
   prosespembelian;
   prosessample;

end;

procedure TfrmProsesLabaRugi.prosessolo;
var
  s:string;
  tsql:TmyQuery;
begin
  // solo

  s:=' SELECT Tax, SUM(Bruto) Bruto, SUM(Disc)Disc, SUM(Disc_faktur) Disc_faktur, SUM(Dpp) Dpp, SUM(Pajak) Pajak, SUM(Total) Total, SUM(Biaya_Promosi) Biaya_Promosi, SUM(Kontrak) Kontrak, SUM(freight) Freight, '
 + ' SUM(Retur) Retur, SUM(Bayar_Cash) Bayar_Cash, SUM(Bayar_Transfer) Bayar_Transfer, SUM(Giro) Giro, SUM(Deposit) Deposit, '
 + ' SUM(koreksi_lr) Koreksi_LR, SUM(Hutang_Internal) Hutang_Internal, SUM(UM_Penjualan) UM_Penjualan, SUM(Ppn_keluaran) PPn_Keluaran, SUM(pph_22) PPh_22, SUM(Potongan) Potongan '
 + ' FROM bsmcabang.transaksi_harian A '
 + ' WHERE month(tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND year(tanggaL)= '+ edtTahun.Text
 + ' group by tax ' ;
tsql:= xOpenQuery(s,frmMenu.conn) ;
  with tsql do
  begin
    try
      while not eof do
      begin
       if FieldByName('tax').AsString = 'Non PPn' then
       begin
            CDS.Locate('kode','21.001.2',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('bruto').AsFloat;
            CDS.Locate('kode','21.006.2',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('disc').AsFloat;
            CDS.Locate('kode','21.004.2',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('kontrak').AsFloat+Fieldbyname('disc_faktur').AsFloat+Fieldbyname('potongan').AsFloat;
            CDS.Locate('kode','21.003.2',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('retur').AsFloat;


       end
       else
       begin
            CDS.Locate('kode','21.001.1',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('bruto').AsFloat;
            CDS.Locate('kode','21.006.1',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('disc').AsFloat;
            CDS.Locate('kode','21.004.1',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('kontrak').AsFloat+Fieldbyname('disc_faktur').AsFloat+Fieldbyname('potongan').AsFloat;
            CDS.Locate('kode','21.003.1',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('retur').AsFloat;

       end;
       next;
     end;
    finally
      free;
    end;
  end;

end;

procedure TfrmProsesLabaRugi.prosesjogja;
var
  s:string;
  tsql:TmyQuery;
begin
  // jogja

  s:=' SELECT Tax, SUM(Bruto) Bruto, SUM(Disc)Disc, SUM(Disc_faktur) Disc_faktur, SUM(Dpp) Dpp, SUM(Pajak) Pajak, SUM(Total) Total, SUM(Biaya_Promosi) Biaya_Promosi, SUM(Kontrak) Kontrak, SUM(freight) Freight, '
 + ' SUM(Retur) Retur, SUM(Bayar_Cash) Bayar_Cash, SUM(Bayar_Transfer) Bayar_Transfer, SUM(Giro) Giro, SUM(Deposit) Deposit, '
 + ' SUM(koreksi_lr) Koreksi_LR, SUM(Hutang_Internal) Hutang_Internal, SUM(UM_Penjualan) UM_Penjualan, SUM(Ppn_keluaran) PPn_Keluaran, SUM(pph_22) PPh_22, SUM(Potongan) Potongan '
 + ' FROM bsmcabang2.transaksi_harian A '
 + ' WHERE month(tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND year(tanggaL)= '+ edtTahun.Text
 + ' group by tax ' ;
tsql:= xOpenQuery(s,frmMenu.conn) ;
  with tsql do
  begin
    try
      while not eof do
      begin
       if FieldByName('tax').AsString = 'Non PPn' then
       begin
            CDS.Locate('kode','21.001.4',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('bruto').AsFloat;
            CDS.Locate('kode','21.006.4',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('disc').AsFloat;
            CDS.Locate('kode','21.004.4',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('kontrak').AsFloat+Fieldbyname('disc_faktur').AsFloat+Fieldbyname('potongan').AsFloat;
            CDS.Locate('kode','21.003.4',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('retur').AsFloat;


       end
       else
       begin
            CDS.Locate('kode','21.001.3',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('bruto').AsFloat;
            CDS.Locate('kode','21.006.3',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('disc').AsFloat;
            CDS.Locate('kode','21.004.3',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('kontrak').AsFloat+Fieldbyname('disc_faktur').AsFloat+Fieldbyname('potongan').AsFloat;
            CDS.Locate('kode','21.003.3',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('retur').AsFloat;

       end;
       next;
     end;
    finally
      free;
    end;
  end;

end;

procedure TfrmProsesLabaRugi.prosespersediaanpusat;
var
  s:string;
  tsql:TmyQuery;
  akhir,awal : TDateTime;
begin
    akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text));
    awal  :=StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text);


  // persediaan pusat

  s:='SELECT sum(IFNULL(hsaldoawal,0)) HAwal, sum(IFNULL(H_Beli,0)) H_Beli, sum(IFNULL(H_MTC_01,0)) H_MTC_01, sum(IFNULL(H_MTC_02,0)) H_MTC_02, sum(IFNULL(H_MTCI_01,0)) H_MTCI_01,'
+ ' sum(IFNULL(H_MTCI_02,0)) H_MTCI_02, sum(IFNULL(H_Ret,0)) H_Ret, sum(IFNULL(hsaldoawal,0)+ IFNULL(H_Beli,0)+ IFNULL(H_MTCI_02,0)+ IFNULL(H_MTCI_01,0)- IFNULL(H_MTC_02,0)- IFNULL(H_MTC_01,0)- IFNULL(H_Ret,0)) HAkhir'
+ ' FROM ('
+ ' SELECT brg_kode,brg_nama,ktg_nama kategori,brg_hrgbeli,'
+ ' brg_lastcost, ('
+ ' SELECT SUM(mst_stok_in-mst_stok_out)'
+ ' FROM tmasterstok'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal < '+quotd(awal)+') saldoawal, ('
+ ' SELECT SUM((mst_stok_in-mst_stok_out) *mst_hargabeli)'
+ ' FROM tmasterstok'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal < '+quotd(awal)+') Hsaldoawal, ('
+ ' SELECT SUM(mst_stok_out)'
+ ' FROM tmasterstok'
+ ' INNER JOIN tmutcab_hdr ON mutc_nomor=mst_noreferensi'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%MTC%" AND mutc_cbg_tujuan="01") qty_MTC_01, ('
+ ' SELECT SUM(mst_stok_out*mst_hargabeli)'
+ ' FROM tmasterstok'
+ ' INNER JOIN tmutcab_hdr ON mutc_nomor=mst_noreferensi'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%MTC%" AND mutc_cbg_tujuan="01") H_MTC_01, ('
+ ' SELECT SUM(mst_stok_out)'
+ ' FROM tmasterstok'
+ ' INNER JOIN tmutcab_hdr ON mutc_nomor=mst_noreferensi'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%MTC%" AND mutc_cbg_tujuan="02") qty_MTC_02, ('
+ ' SELECT SUM(mst_stok_out*mst_hargabeli)'
+ ' FROM tmasterstok'
+ ' INNER JOIN tmutcab_hdr ON mutc_nomor=mst_noreferensi'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%MTC%" AND mutc_cbg_tujuan="02") H_MTC_02, ('
+ ' SELECT SUM(mst_stok_out)'
+ ' FROM tmasterstok'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%RET%") qty_Ret, ('
+ ' SELECT SUM(mst_stok_out*mst_hargabeli)'
+ ' FROM tmasterstok'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%RET%") H_Ret, ('
+ ' SELECT SUM(mst_stok_in-mst_stok_out)'
+ ' FROM tmasterstok'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%RI%") qty_Beli, ('
+ ' SELECT SUM((mst_stok_in-mst_stok_out)*mst_hargabeli)'
+ ' FROM tmasterstok'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%RI%") H_Beli, ('
+ ' SELECT SUM(mst_stok_in)'
+ ' FROM tmasterstok'
+ ' INNER JOIN tmutcabIN_hdr ON mutcI_nomor=mst_noreferensi'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%MTCI%" AND mutci_cbg_asal="01") qty_MTCI_01, ('
+ ' SELECT SUM(mst_stok_in*mst_hargabeli)'
+ ' FROM tmasterstok'
+ ' INNER JOIN tmutcabin_hdr ON mutci_nomor=mst_noreferensi'
+ ' WHERE mst_brg_kode=A.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%MTCI%" AND mutcI_cbg_asal="01") H_MTCI_01, ('
+ ' SELECT SUM(mst_stok_in)'
+ ' FROM tmasterstok'
+ ' INNER JOIN tmutcabIN_hdr ON mutcI_nomor=mst_noreferensi'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%MTCI%" AND mutci_cbg_asal="02") qty_MTCI_02, ('
+ ' SELECT SUM(mst_stok_in*mst_hargabeli)'
+ ' FROM tmasterstok'
+ ' INNER JOIN tmutcabin_hdr ON mutci_nomor=mst_noreferensi'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+' AND mst_noreferensi LIKE "%MTCI%" AND mutcI_cbg_asal="02") H_MTCI_02, ('
+ ' SELECT SUM(mst_stok_in-mst_stok_out)'
+ ' FROM tmasterstok'
+ ' WHERE mst_brg_kode=a.brg_kode AND mst_tanggal <= '+quotd(akhir)+') akhir'
+ ' FROM tbarang a'
+ ' LEFT JOIN tkategori ON ktg_kode=brg_ktg_kode) final';


tsql:= xOpenQuery(s,frmMenu.conn) ;
  with tsql do
  begin
    try
      while not eof do
      begin
            CDS.Locate('kode','1',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('Hawal').AsFloat;
            CDS.Locate('kode','14',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('Hakhir').AsFloat;



       next;
     end;
    finally
      free;
    end;
  end;

end;

procedure TfrmProsesLabaRugi.prosespersediaansolo;
var
  s:string;
  tsql:TmyQuery;
  akhir,awal : TDateTime;
begin
    akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text));
    awal  :=StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text);


  // persediaan solo

  s:='select "awal" kode,SUM((mst_stok_in-mst_stok_out) *mst_hargabeli) nilai from bsmcabang.tmasterstok where mst_tanggal < '+QuotD(awal)
    + ' union'
    + ' select "akhir" kode,SUM((mst_stok_in-mst_stok_out) *mst_hargabeli) nilai from bsmcabang.tmasterstok where mst_tanggal <= '+QuotD(akhir);


tsql:= xOpenQuery(s,frmMenu.conn) ;
  with tsql do
  begin
    try
      while not eof do
      begin
        if FieldByName('kode').AsString = 'awal' then
        begin
            CDS.Locate('kode','1.1',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('nilai').AsFloat;
        end
        else
        begin
            CDS.Locate('kode','14.1',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('nilai').AsFloat;
        end;
            next;
     end;
    finally
      free;
    end;
  end;

end;

procedure TfrmProsesLabaRugi.prosespersediaanjogja;
var
  s:string;
  tsql:TmyQuery;
  akhir,awal : TDateTime;
begin
    akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text));
    awal  :=StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text);


  // persediaan solo

  s:='select "awal" kode,SUM((mst_stok_in-mst_stok_out) *mst_hargabeli) nilai from bsmcabang2.tmasterstok where mst_tanggal < '+QuotD(awal)
    + ' union'
    + ' select "akhir" kode,SUM((mst_stok_in-mst_stok_out) *mst_hargabeli) nilai from bsmcabang2.tmasterstok where mst_tanggal <= '+QuotD(akhir);


tsql:= xOpenQuery(s,frmMenu.conn) ;
  with tsql do
  begin
    try
      while not eof do
      begin
        if FieldByName('kode').AsString = 'awal' then
        begin
            CDS.Locate('kode','1.2',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('nilai').AsFloat;
        end
        else
        begin
            CDS.Locate('kode','14.2',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('nilai').AsFloat;
        end;
            next;
     end;
    finally
      free;
    end;
  end;

end;


procedure TfrmProsesLabaRugi.prosespembelian;
var
  s:string;
  tsql:TmyQuery;
begin


  s:=' SELECT Tax, SUM(Bruto) Bruto, SUM(Disc)Disc, SUM(Gross) Gross, SUM(disc_faktur) Disc_faktur,'
+ ' SUM(Dpp) Dpp, SUM(Pajak) Pajak, SUM(Total) Total, SUM(freight) Freight, SUM(Retur-Pajak_Retur) Retur_Net,'
+ ' SUM(Pajak_Retur) Pajak_Retur, SUM(Retur) Retur, SUM(kas) Bayar_Cash, SUM(transfer) Bayar_Transfer,'
+ ' SUM(UM) UM, SUM(Potongan) Potongan, SUM(internal) Internal, SUM(lainnya) Lainnya'
+ ' FROM transaksi_harian A'
+ ' INNER JOIN tsupplier ON sup_kode=supplier'
+ ' WHERE month(tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND year(tanggaL)= '+ edtTahun.Text
+ ' GROUP BY Tax' ;
tsql:= xOpenQuery(s,frmMenu.conn) ;
  with tsql do
  begin
    try
      while not eof do
      begin
       if FieldByName('tax').AsString = 'Non PPn' then
       begin
            CDS.Locate('kode','3',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('bruto').AsFloat;
            CDS.Locate('kode','5',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('DISC').AsFloat*-1;

            CDS.Locate('kode','7',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('DISC_FAKTUR').AsFloat*-1;
            CDS.Locate('kode','9',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('POTONGAN').AsFloat*-1;
            CDS.Locate('kode','11',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('FREIGHT').AsFloat+ getbiayakirim(cbbBulan.ItemIndex+1,edtTahun.text);

             CDS.Locate('kode','13',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('RETUR').AsFloat*-1;
       end
       else
       begin
            CDS.Locate('kode','2',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('bruto').AsFloat;
            CDS.Locate('kode','4',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('DISC').AsFloat*-1;

            CDS.Locate('kode','6',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('DISC_FAKTUR').AsFloat*-1;
            CDS.Locate('kode','8',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('POTONGAN').AsFloat*-1;
            CDS.Locate('kode','10',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('FREIGHT').AsFloat;
            CDS.Locate('kode','12',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('RETUR').AsFloat*-1;

       end;
       next;
     end;
    finally
      free;
    end;
  end;

end;



procedure TfrmProsesLabaRugi.prosessample;
var
  s:string;
  tsql:TmyQuery;
  akhir,awal : TDateTime;
begin

  // sample solo

  s:='select sum(jurd_debet) nilai from tjurnalitem  inner join tjurnal on jur_no=jurd_jur_no '
+ ' where jurd_rek_kode="23.040"  and '
+ ' month(jur_tanggal) = '+IntToStr(cbbBulan.ItemIndex+1)+' and '
+ ' year(jur_tanggal)='+edtTahun.Text+' and jur_no like '+ Quot('01%');


tsql:= xOpenQuery(s,frmMenu.conn) ;
  with tsql do
  begin
    try
      if  not eof then
      begin

            CDS.Locate('kode','23.040.1',[loCaseInsensitive]);
            If CDS.State <> dsEdit then CDS.Edit;
            cds.FieldByName('nilai').AsFloat :=Fieldbyname('nilai').AsFloat;
      end;
    finally
      free;
    end;
  end;

    // sample jogja

  s:='select sum(jurd_debet) nilai from tjurnalitem  inner join tjurnal on jur_no=jurd_jur_no '
+ ' where jurd_rek_kode="23.040"  and '
+ ' month(jur_tanggal) = '+IntToStr(cbbBulan.ItemIndex+1)+' and '
+ ' year(jur_tanggal)='+edtTahun.Text+' and jur_no like '+ Quot('02%');

tsql:= xOpenQuery(s,frmMenu.conn) ;
  with tsql do
  begin
    try
      if  not eof then
      begin
        CDS.Locate('kode','23.040.2',[loCaseInsensitive]);
        If CDS.State <> dsEdit then CDS.Edit;
        cds.FieldByName('nilai').AsFloat :=Fieldbyname('nilai').AsFloat;
      end;
    finally
      free;
    end;
  end;

end;

function TfrmProsesLabaRugi.getbiayakirim(abulan : integer ; atahun : string) : Double ;
var
  s: string;
  tsql2,tsql : TmyQuery;
begin
  Result := 0;
     s:= 'select sum(jurd_debet) from tjurnalitem inner join  tjurnal on jur_no=jurd_jur_no '
        + ' where jurd_rek_KODE = ' + Quot('23.043')
        + ' and month(jur_tanggal) = ' + IntToStr(abulan)
        + ' and year(jur_tanggal) = '+ atahun
        + '  and (jur_no like "KK%" OR JUR_NO Like "00%")'  ;
    tsql := xOpenQuery(s,frmMenu.conn) ;
    with tsql do
    begin
      try
        if not Eof then
          result := Fields[0].AsFloat ;
      finally
       tsql.Free;
      end;
    end;


end;




procedure TfrmProsesLabaRugi.cxButton7Click(Sender: TObject);
begin
     if SaveDialog1.Execute then
     begin
        ExportGridToExcel(SaveDialog1.FileName, cxGrid1);
     end;
     if SaveDialog1.Execute then
     begin
        ExportGridToExcel(SaveDialog1.FileName, cxGrid2);
     end;

end;

function TfrmProsesLabaRugi.GetCDSPabrik: TClientDataset;
var s:String;
begin
  If not Assigned(FCDSPabrik) then
  begin
    S := 'select cbg_nama as Nama, cbg_kode Kode'
        +' from tcabang';

    FCDSPabrik := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDSPabrik;
end;

end.
