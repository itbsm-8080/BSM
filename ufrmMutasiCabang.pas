unit ufrmMutasiCabang;

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
  cxGridCustomView, cxGrid, cxButtonEdit, MyAccess, AdvEdBtn;

type
  TfrmMutasiCabang = class(TForm)
    AdvPanel1: TAdvPanel;
    lbljudul: TLabel;
    AdvPanel2: TAdvPanel;
    Label2: TLabel;
    Label4: TLabel;
    dttanggal: TDateTimePicker;
    AdvPanel3: TAdvPanel;
    Label3: TLabel;
    edtKeterangan: TAdvEdit;
    Label1: TLabel;
    Label5: TLabel;
    RAWPrinter1: TRAWPrinter;
    cxLookupCabangTujuan: TcxExtLookupComboBox;
    cxLookupCabangAsal: TcxExtLookupComboBox;
    edtNomor: TAdvEdit;
    AdvPanel4: TAdvPanel;
    cxButton8: TcxButton;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    PopupMenu1: TPopupMenu;
    HapusRecord1: TMenuItem;
    Label6: TLabel;
    cxLookupGudang: TcxExtLookupComboBox;
    Button1: TButton;
    chkPermintaan: TCheckBox;
    edtNomorPB: TAdvEditBtn;
    lbl1: TLabel;
    cxgrd2: TcxGrid;
    cxgrdbtblvw3: TcxGridDBTableView;
    cxgrdbclmn12: TcxGridDBColumn;
    cxgrdbclmn13: TcxGridDBColumn;
    cxgrdbclmn14: TcxGridDBColumn;
    cxgrdbclmn15: TcxGridDBColumn;
    cxgrdbclmn16: TcxGridDBColumn;
    cxgrdbclmn17: TcxGridDBColumn;
    cxgrdbclmn18: TcxGridDBColumn;
    cxgrdbclmn19: TcxGridDBColumn;
    cxgrdbclmn20: TcxGridDBColumn;
    cxgrdbclmn21: TcxGridDBColumn;
    cxgrdbclmn22: TcxGridDBColumn;
    cxgrdbtblvw4: TcxGridDBTableView;
    cxgrdlvl2: TcxGridLevel;
    advpnl1: TAdvPanel;
    lbl2: TLabel;
    cxGrid: TcxGrid;
    cxgrdbtblvwGrdMain: TcxGridDBTableView;
    cxgrdbclmnNo: TcxGridDBColumn;
    cxgrdbclmnNamaBarang: TcxGridDBColumn;
    cxgrdbclmnQTY: TcxGridDBColumn;
    cxgrdbclmnKurang: TcxGridDBColumn;
    cxgrdbclmnStok: TcxGridDBColumn;
    cxgrdbclmnSatuan: TcxGridDBColumn;
    cxgrdbclmnExpired: TcxGridDBColumn;
    cxgrdbclmnKeterangan: TcxGridDBColumn;
    cxgrdbclmnclharga: TcxGridDBColumn;
    cxgrdbclmnPenerimaan: TcxGridDBColumn;
    cxgrdbtblvwGrdDetail: TcxGridDBTableView;
    cxgrdlvlMaster: TcxGridLevel;
    advpnl2: TAdvPanel;
    cxgrd1: TcxGrid;
    cxgrdbtblvwcx2: TcxGridDBTableView;
    cxgrdbclmnGrdcxgrdbclmn1: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn2: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn3: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn4: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn5: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn6: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn7: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn8: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn9: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn10: TcxGridDBColumn;
    cxgrdbclmnGrdcxgrdbclmn11: TcxGridDBColumn;
    cxgrdbtblvw2: TcxGridDBTableView;
    cxgrdlvl1: TcxGridLevel;
    advpnl3: TAdvPanel;
    advpnl4: TAdvPanel;
    btn1: TcxButton;
    lbl3: TLabel;
    cxgrdbclmnSKU: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomorExit(Sender: TObject);
    procedure refreshdata;
    procedure simpandata;
    procedure loaddataall(akode, acabang : string);
    procedure doslipmutasi(anomor : string );
    function GetCDS: TClientDataSet;
    function GetCDS2: TClientDataSet;
    function GetCDS3: TClientDataSet;

    function getmaxkode:string;
    procedure FormCreate(Sender: TObject);
    procedure insertketampungan(anomor:String);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    function cekdata:Boolean;

    procedure initgrid;
    procedure HapusRecord1Click(Sender: TObject);
    procedure cxgrdbclmnNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cxLookupGudangAsalPropertiesEditValueChanged(
      Sender: TObject);
    procedure clQTYPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupGudangAsalPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure clSKUPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bantuansku;
    procedure clQTYPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure Button1Click(Sender: TObject);
    function getdatabase(akode:string):string;
    procedure chkPermintaanClick(Sender: TObject);
    function getdatabase2(akode:string):string;
    procedure btn1Click(Sender: TObject);
    procedure edtNomorPBClickBtn(Sender: TObject);
    procedure cxgrdbtblvwcx2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxgrdbclmn15PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    private
     buttonSelected  : integer;
     FID : STRING;
     FCDSSKU : TClientDataset;
     FCDSGudang: TClientDataset;
     FCDSCabang: TClientDataset;
        FFLAGEDIT: Boolean;
     xtotal : Double;
     adatabase :string;
     init: Boolean;
         function GetCDSGudang: TClientDataset;
         function GetCDSCabang: TClientDataset;

         procedure initViewSKU;

      { Private declarations }
     protected
    FCDS: TClientDataSet;
    FCDS2: TClientDataSet;
    FCDS3: TClientDataSet;
  public
      property CDS: TClientDataSet read GetCDS write FCDS;
      property CDS2: TClientDataSet read GetCDS2 write FCDS2;
      property CDS3: TClientDataSet read GetCDS3 write FCDS3;
          property CDSSKU: TClientDataSet read FCDSSKU write FCDSSKU;
       property CDSGudang: TClientDataset read GetCDSGudang write FCDSGudang;
        property CDSCabang: TClientDataset read GetCDSCabang write FCDSCabang;
          property ID: string read FID write FID;
            property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    { Public declarations }
  end;
 const

    NOMERATOR = 'MTC';

var
  frmMutasiCabang: TfrmMutasiCabang;

implementation

uses MAIN,uModuleConnection,uFrmbantuan,Ulib,uReport;

{$R *.dfm}

procedure TfrmMutasiCabang.FormShow(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmMutasiCabang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TfrmMutasiCabang.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     SelectNext(ActiveControl,True,True);
end;

procedure TfrmMutasiCabang.edtNomorExit(Sender: TObject);
begin
   edtNomor.Enabled := False;
   loaddataall(edtNomor.Text, cxLookupGudang.Text);
end;

procedure TfrmMutasiCabang.refreshdata;
begin
  FID:='';
  FLAGEDIT :=False;
  dttanggal.DateTime := Date;
  edtKeterangan.Clear;
  edtNomor.Text := getmaxkode;
   cxLookupCabangAsal.EditValue := frmMenu.KDCABANG;
   cxLookupCabangTujuan.EditValue := '';
   cxLookupGudang.EditValue := '';
   cxLookupCabangTujuan.SetFocus;
  initgrid;
end;

procedure TfrmMutasiCabang.simpandata;
var
  s:string;
  i:integer;
  tt : TStrings;
  anomor : string;
begin
   if flagedit then
   begin
   anomor := edtNomor.Text;
      s:= 'update tmutcab_hdr set  '
         + ' mutc_tanggal = ' + QuotD(dttanggal.DateTime)+','
         + ' mutc_keterangan = ' + Quot(edtKeterangan.Text) + ','
         + ' mutc_gdg_kode = ' + Quot(cxLookupGudang.EditValue)+','
         + ' mutc_cbg_asal = ' + Quot(cxLookupCabangAsal.EditValue)+','
         + ' mutc_cbg_tujuan = ' + Quot(cxLookupCabangTujuan.EditValue)+','
         + ' date_modified  = ' + QuotD(cGetServerTime,True) + ','
         + ' user_modified = ' + Quot(frmMenu.KDUSER)
         + ' where mutc_nomor = ' + Quot(edtNomor.Text) ;
   end
   else
   begin
     anomor := getmaxkode;
     edtNomor.Text := anomor;
      s:= ' insert into tmutcab_hdr '
         + '( mutc_nomor,mutc_tanggal,mutc_keterangan,mutc_cbg_asal,mutc_cbg_tujuan,mutc_gdg_kode,date_create,user_create) values ( '
         + Quot(anomor) + ','
         + Quotd(dttanggal.DateTime)+','
         + Quot(edtKeterangan.Text) + ','
         + Quot(cxLookupCabangAsal.EditValue)+','
         + Quot(cxLookupCabangTujuan.EditValue)+','
         + Quot(cxLookupGudang.EditValue) + ','
         + QuotD(cGetServerTime,True) + ','
         + Quot(frmMenu.KDUSER)+')';
   end;
   // xExecQuery(s,frmMenu.conn);
  EnsureConnected(frmMenu.conn);
  ExecSQLDirect(frmMenu.conn, s);
   tt := TStringList.Create;
   s:= ' delete from tmutcab_dtl '
      + ' where  mutcd_mutc_nomor =' + quot(FID) ;
   tt.Append(s);
   i:=1;
    CDS.First;
while not CDS.Eof do
  begin
   if (CDS.FieldByName('qty').AsInteger >  0) and (CDS.FieldByName('sku').AsInteger >  0) then
   begin
        s:='insert into tmutcab_dtl '
          + ' (mutcd_mutc_nomor,mutcd_brg_kode,mutcd_qty,mutcd_harga,mutcd_keterangan,mutcd_expired,mutcd_nourut,mutcd_pb_nomor) values ( '
          +  Quot(anomor) + ','
          +  IntToStr(CDS.FieldByName('SKU').AsInteger) + ','
          +  IntToStr(CDS.FieldByName('qty').AsInteger) + ','
          + FloatToStr(CDS.FieldByName('harga').AsFloat) + ','
          +  Quot(CDS.FieldByName('keterangan').Asstring) + ','
          + QuotD(CDS.FieldByName('expired').Asdatetime) +','
          +  IntToStr(i) +','
          +  Quot(CDS.FieldByName('no_penerimaan').Asstring)
          +');';
       tt.Append(s);
     end;
     CDS.next;
       Inc(i);
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
end;

procedure TfrmMutasiCabang.loaddataall(akode, acabang : string);
var
  s: string ;
  tsql : TmyQuery;
  i:Integer;
begin
  if akode = '' then
  begin
    flagedit := false;
    Exit ;
  end;

  adatabase := getdatabase2(acabang)+'.';

  s := ' select mutc_nomor,mutc_tanggal,mutc_keterangan,mutc_cbg_asal,gdg_nama,mutc_cbg_tujuan,'
     + ' mutcd_brg_kode,brg_nama,brg_satuan,mutcd_qty,mutcd_harga,mutcd_expired,mutc_gdg_kode,'
     + ' mutcd_keterangan,(SELECT coalesce(pbd_qty - pbd_qtyterima,0) FROM ' + adatabase+'tpermintaanbarang_dtl WHERE pbd_pb_nomor = mutcd_pb_nomor and pbd_brg_kode = mutcd_brg_kode) qty_kurang, '
     + ' mutcd_pb_nomor penerimaan, '
     + ' ( '
     + '   SELECT SUM(mst_stok_in - mst_stok_out) '
     + '    FROM tmasterstok '
     + '    WHERE mst_brg_kode = d.mutcd_brg_kode and mst_expired_date = mutcd_expired  '
     + '  ) AS stok '
     + ' from tmutcab_hdr a'
     + ' inner join tmutcab_dtl d on a.mutc_nomor=d.mutcd_mutc_nomor '
     + ' inner join tbarang b on d.mutcd_brg_kode = b.brg_kode '
     + ' left join tgudang on mutc_gdg_kode=gdg_kode '
     + ' where a.mutc_nomor = '+ Quot(akode);

    tsql := xOpenQuery(s,frmMenu.conn) ;
   try

       with  tsql do
       begin
         if not eof then
         begin
            flagedit := True;
            FID :=fieldbyname('mutc_nomor').AsString;
            edtNomor.Text   := fieldbyname('mutc_nomor').AsString;
            dttanggal.DateTime := fieldbyname('mutc_tanggal').AsDateTime;
           cxLookupCabangAsal.EditValue := fieldbyname('mutc_cbg_asal').AsString;
           cxLookupGudang.EditValue := fieldbyname('mutc_gdg_kode').AsString;
            edtketerangan.Text := fieldbyname('mutc_keterangan').AsString;
           cxLookupCabangTujuan.EditValue := fieldbyname('mutc_cbg_tujuan').AsString;
           if fieldbyname('penerimaan').AsString <> '' then chkPermintaan.Checked := True;
           edtNomorPB.Text := fieldbyname('penerimaan').AsString;


            i:=1;

             CDS.EmptyDataSet;
            while  not Eof do
             begin
                      CDS.Append;
                      CDS.FieldByName('no_penerimaan').AsString := fieldbyname('penerimaan').AsString;
                      CDS.FieldByName('SKU').AsInteger        := fieldbyname('mutcd_brg_kode').AsInteger;
                      CDS.fieldbyname('NamaBarang').AsString  := fieldbyname('brg_nama').AsString;
                      CDS.fieldbyname('satuan').AsString  := fieldbyname('brg_satuan').AsString;
                      CDS.FieldByName('QTY').AsInteger        := fieldbyname('mutcd_qty').AsInteger;
                      CDS.FieldByName('harga').AsFloat        := fieldbyname('mutcd_harga').AsFloat;
                      CDS.FieldByName('expired').AsDateTime := fieldbyname('mutcd_expired').AsDateTime;
                      CDS.FieldByName('keterangan').AsString  :=  fieldbyname('mutcd_keterangan').AsString;
                      CDS.FieldByName('kurang').AsInteger := fieldbyname('qty_kurang').AsInteger;
                      CDS.FieldByName('stok').AsInteger := fieldbyname('stok').AsInteger + fieldbyname('mutcd_qty').AsInteger;
                      CDS.Post;
                   i:=i+1;
                   next;
            end ;
        end
        else
        begin
          ShowMessage('Nomor Mutasi tidak di temukan');
          edtNomor.Enabled:= true;
          edtNomor.SetFocus;
        end;
      end;
   finally
     tsql.Free;
   end;
end;

procedure TfrmMutasiCabang.doslipmutasi(anomor : string );
var
  s: string ;
  ftsreport : TTSReport;
begin
  insertketampungan(anomor);
  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'mutasi';

          s:= ' select '
       + ' *,(select cbg_nama from tcabang where cbg_kode=a.mutc_cbg_asal) asal ,'
       + ' (select cbg_nama from tcabang where cbg_kode=a.mutc_cbg_tujuan) tujuan'
       + ' from tmutcab_hdr a '
       + ' inner join tampung e on e.nomor =a.mutc_nomor '
       + ' inner join tgudang z on z.gdg_kode=a.mutc_gdg_kode '
       + ' left join  tmutcab_dtl b on mutc_nomor=mutcd_mutc_nomor and e.tam_nama=b.mutcd_brg_kode and expired=mutcd_expired '
       + ' left join tbarang c on b.mutcd_brg_kode=c.brg_kode '
       + ' where '
       + ' a.mutc_nomor=' + quot(anomor);
    ftsreport.AddSQL(s);
    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;

procedure TfrmMutasiCabang.insertketampungan(anomor:string);
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
  s := 'select mutcd_BRG_kode,mutcd_expired from tmutcab_dtl where mutcd_mutc_nomor =' + Quot(anomor) ;
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
                  + quotd(fields[1].AsDateTime)
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

function TfrmMutasiCabang.getmaxkode:string;
var
  s:string;
begin
  s:='select max(right(mutc_nomor,4)) from tmutcab_hdr  where mutc_nomor like ' + quot(NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.%') ;

  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.'+RightStr(IntToStr(10000+1),4)
      else
         result:= NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.'+RightStr(IntToStr(10000+fields[0].AsInteger+1),4);

    finally
      free;
    end;
  end;
end;


procedure TfrmMutasiCabang.FormCreate(Sender: TObject);
begin
  init := False;
 with TcxExtLookupHelper(cxLookupCabangTujuan.Properties) do
    LoadFromCDS(CDSCabang, 'Kode','Cabang',['Kode'],Self);
  with TcxExtLookupHelper(cxLookupCabangAsal.Properties) do
    LoadFromCDS(CDSCabang, 'Kode','Cabang',['Kode'],Self);
   with TcxExtLookupHelper(cxLookupGudang.Properties) do
    LoadFromCDS(CDSGudang, 'Kode','Gudang',['Kode'],Self);
  TcxDBGridHelper(cxgrdbtblvwGrdMain).LoadFromCDS(CDS, False, False);
  TcxDBGridHelper(cxgrdbtblvwcx2).LoadFromCDS(CDS2, False, False);
  TcxDBGridHelper(cxgrdbtblvwcx2).LoadFromCDS(CDS2, False, False);
  TcxDBGridHelper(cxgrdbtblvw3).LoadFromCDS(CDS3, False, False);
//     initViewSKU;
end;

function TfrmMutasiCabang.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'No', ftInteger, False);
    zAddField(FCDS, 'SKU', ftString, False,255);
    zAddField(FCDS, 'NamaBarang', ftString, False,100);
    zAddField(FCDS, 'Satuan', ftString, False,10);
    zAddField(FCDS, 'QTY', ftInteger, False);
    zAddField(FCDS, 'kurang', ftInteger, False);
    zAddField(FCDS, 'stok', ftInteger, False);
    zAddField(FCDS, 'expired', ftDate, False,255);
    zAddField(FCDS, 'Keterangan', ftString, False,255);
    zAddField(FCDS, 'no_penerimaan', ftString, False,255);
    zAddField(FCDS, 'harga', ftFloat, False);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmMutasiCabang.GetCDS2: TClientDataSet;
begin
  If not Assigned(FCDS2) then
  begin
    FCDS2 := TClientDataSet.Create(Self);
    zAddField(FCDS2, 'No', ftInteger, False);
    zAddField(FCDS2, 'SKU', ftString, False,255);
    zAddField(FCDS2, 'NamaBarang', ftString, False,100);
    zAddField(FCDS2, 'Satuan', ftString, False,10);
    zAddField(FCDS2, 'QTY', ftInteger, False);
    zAddField(FCDS2, 'kurang', ftInteger, False);
    zAddField(FCDS2, 'stok', ftInteger, False);
    zAddField(FCDS2, 'expired', ftDate, False,255);
    zAddField(FCDS2, 'Keterangan', ftString, False,255);
    zAddField(FCDS2, 'no_penerimaan', ftString, False,255);
    zAddField(FCDS2, 'harga', ftFloat, False);
    FCDS2.CreateDataSet;
  end;
  Result := FCDS2;
end;

function TfrmMutasiCabang.GetCDS3: TClientDataSet;
begin
  If not Assigned(FCDS3) then
  begin
    FCDS3 := TClientDataSet.Create(Self);
    zAddField(FCDS3, 'No', ftInteger, False);
    zAddField(FCDS3, 'SKU', ftString, False,255);
    zAddField(FCDS3, 'NamaBarang', ftString, False,100);
    zAddField(FCDS3, 'Satuan', ftString, False,10);
    zAddField(FCDS3, 'QTY', ftInteger, False);
    zAddField(FCDS3, 'kurang', ftInteger, False);
    zAddField(FCDS3, 'stok', ftInteger, False);
    zAddField(FCDS3, 'expired', ftDate, False,255);
    zAddField(FCDS3, 'Keterangan', ftString, False,255);
    zAddField(FCDS3, 'no_penerimaan', ftString, False,255);
    zAddField(FCDS3, 'harga', ftFloat, False);
    FCDS3.CreateDataSet;
  end;
  Result := FCDS3;
end;

function TfrmMutasiCabang.GetCDSGudang: TClientDataset;
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

function TfrmMutasiCabang.GetCDSCabang: TClientDataset;
var s:String;
begin
  If not Assigned(FCDSCabang) then
  begin
    S := 'select cbg_nama as Cabang, cbg_kode Kode '
        +' from tcabang';


    FCDSCabang := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDSCabang;
end;

 procedure TfrmMutasiCabang.initViewSKU;
var
  S: string;
begin
  if Assigned(FCDSSKU) then FCDSSKU.Free;
  S := 'select brg_kode sku, brg_nama NamaBarang, brg_satuan Satuan,mst_expired_date expired,sum(mst_stok_in-mst_stok_out) stok from Tbarang '
  + ' inner join tmasterstok  on mst_brg_kode=brg_kode and mst_gdg_kode= '+ Quot(vartostr(cxLookupGudang.EditValue))
  + ' group by brg_kode , brg_nama , brg_satuan ,mst_expired_date ';

  FCDSSKU := TConextMain.cOpenCDS(S, nil);

  with TcxExtLookupHelper(cxgrdbclmnSKU.Properties) do
  begin
    LoadFromCDS(CDSSKU, 'SKU','SKU',['SKU'],Self);
    SetMultiPurposeLookup;
  end;

  with TcxExtLookupHelper(cxgrdbclmnNamaBarang.Properties) do
    LoadFromCDS(CDSSKU, 'SKU','NamaBarang',['SKU'],Self);

  with TcxExtLookupHelper(cxgrdbclmnSatuan.Properties) do
    LoadFromCDS(CDSSKU, 'SKU','Satuan',['SKU','NamaBarang','expired'],Self);
    
end;

procedure TfrmMutasiCabang.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmMutasiCabang.cxButton2Click(Sender: TObject);
begin
  try
      if cekTutupPeriode(dtTanggal.Date) then
      Exit;
      If not cekdata then exit;

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

procedure TfrmMutasiCabang.cxButton1Click(Sender: TObject);
begin
 try
      if cekTutupPeriode(dtTanggal.Date) then
      Exit;
 
      If not cekdata then exit;

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


function TfrmMutasiCabang.cekdata:Boolean;
var
  i:integer;
begin
  result:=true;
   i := 1;
   If cxLookupGudang.EditValue = '' then
    begin
      ShowMessage('Gudang belum di pilih');
      result:=false;
      Exit;
    end;
     If cxLookupCabangTujuan.EditValue = '' then
    begin
      ShowMessage('Cabang Tujuan belum di pilih');
      result:=false;
      Exit;
    end;
  CDS.First;
  While not CDS.Eof do
  begin



    If CDS.FieldByName('SKU').AsInteger = 0 then
    begin
      ShowMessage('SKU Baris : ' + inttostr(i) + ' Belum dipilih');
      result:=false;
      Exit;
    end;


    inc(i);
    CDS.Next;
  end;
end;



procedure TfrmMutasiCabang.initgrid;
begin
  init := True;
  try
  CDS.EmptyDataSet;
  CDS.Append;
  CDS.FieldByName('QTY').AsInteger    := 0;
  CDS.FIELDBYname('keterangan').asstring := '';
  CDS.Post;

  CDS2.EmptyDataSet;
  CDS2.Append;
  CDS2.FieldByName('QTY').AsInteger    := 0;
  CDS2.FIELDBYname('keterangan').asstring := '';
  CDS2.Post;

  CDS3.EmptyDataSet;
  CDS3.Append;
  CDS3.FieldByName('QTY').AsInteger    := 0;
  CDS3.FIELDBYname('keterangan').asstring := '';
  CDS3.Post;
   finally
    init := False;
  end;
end;

procedure TfrmMutasiCabang.HapusRecord1Click(Sender: TObject);
begin
 If CDS.Eof then exit;
  CDS.Delete;
  If CDS.Eof then initgrid;
end;

procedure TfrmMutasiCabang.cxgrdbclmnNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  If Assigned(ARecord) then
  begin
    AText := Inttostr(ARecord.Index+1);
  end;
end;

procedure TfrmMutasiCabang.cxLookupGudangAsalPropertiesEditValueChanged(
  Sender: TObject);
begin
//initViewSKU;
end;

procedure TfrmMutasiCabang.clQTYPropertiesEditValueChanged(
  Sender: TObject);
begin
// If CDS.State <> dsEdit then
//   CDS.Edit;
//  cxgrdbtblvwGrdMain.DataController.Post;

end;

procedure TfrmMutasiCabang.cxLookupGudangAsalPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
     if (cxLookupCabangTujuan.EditValue = cxLookupCabangAsal.EditValue) then
     begin
       Error:= true;
       ErrorText:= 'Cabang Asal tidak boleh sama dengan gudang Tujuan';
     end;
end;

procedure TfrmMutasiCabang.clSKUPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin

 bantuansku;

end;

procedure TfrmMutasiCabang.bantuansku;
var
  s, exdate, swhere:string;
  tsql:TmyQuery;
  i, Posisi:Integer;
   Nomor, SKU, Expired: string;
  QtyKurang, StokTersedia: Integer;
begin
    adatabase := getdatabase(cxLookupCabangTujuan.EditValue)+'.';

    swhere := '';
    if chkPermintaan.Checked then
      swhere := ' inner join '+adatabase+'tpermintaanbarang_dtl ON brg_kode = pbd_brg_kode and pbd_pb_nomor = ' + Quot(edtNomorPB.Text)
              + ' where pbd_qty > pbd_qtyterima';

    sqlbantuan := 'select brg_kode Sku, mst_expired_date Expired,brg_nama NamaBarang, brg_satuan Satuan,sum(mst_stok_in-mst_stok_out) stok from Tbarang '
                + ' inner join tmasterstok  on mst_brg_kode=brg_kode and mst_gdg_kode= '+ Quot(vartostr(cxLookupGudang.EditValue))
                + swhere
                + ' group by brg_kode , brg_nama , brg_satuan ,mst_expired_date  ';

  Application.CreateForm(Tfrmbantuan,frmbantuan);
  frmBantuan.SQLMaster := SQLbantuan;
  frmBantuan.ShowModal;
  exdate := varglobal1;

  if varglobal <> '' then
  begin
    if chkPermintaan.Checked then
    begin
      for i := 0 to cxgrdbtblvwGrdMain.DataController.RecordCount-1 do
      begin

        If (cVarToInt(cxgrdbtblvwGrdMain.DataController.Values[i, cxgrdbclmnSKU.Index]) = StrToInt(varglobal)) and (cxgrdbtblvwGrdMain.DataController.FocusedRecordIndex <> i)
         and (StrToDate(varglobal1)= cVarTodate(cxgrdbtblvwGrdMain.DataController.Values[i, cxgrdbclmnExpired.Index])) then
        begin

          ShowMessage('Sku dan expired ada yang sama dengan baris '+ IntToStr(i+1));
          CDS.Cancel;
          exit;
        end;
      end;

       If CDS.State <> dsEdit then
         CDS.Edit;


        CDS.FieldByName('sku').AsInteger := StrToInt(varglobal);
        CDS.FieldByName('expired').AsDateTime := strtodate(varglobal1);

        
      s := 'select pbd_pb_nomor Nomor, brg_kode Sku, brg_nama NamaBarang, mst_expired_date Expired, brg_satuan Satuan,sum(mst_stok_in-mst_stok_out) stok, '
       + ' (select ifnull(MST_HARGABELI,0) from tmasterstok where mst_brg_kode=a.brg_kode and mst_hargabeli > 1 '
       + ' and (mst_noreferensi like "RI%" or mst_noreferensi like "%KOR%") '
       + ' order by mst_tanggal desc LIMIT 1) hargabeli, (pbd_qty - pbd_qtyterima) QtyKurang '
       + ' FROM ' + adatabase + 'tpermintaanbarang_dtl '
       + ' INNER JOIN tbarang a ON brg_kode = pbd_brg_kode '
       + ' inner join tmasterstok  on mst_brg_kode=brg_kode and mst_gdg_kode= '+ Quot(vartostr(cxLookupGudang.EditValue))
       + ' where brg_kode = ' + Quot(varglobal)
       + ' and mst_expired_date = ' + QuotD(strtodate(varglobal1)) + ' and pbd_pb_nomor = ' + Quot(edtNomorPB.Text)
       + ' group by pbd_pb_nomor, brg_kode , brg_nama , brg_satuan ,mst_expired_date ';

      tsql := xOpenQuery(s,frmMenu.conn);
      with tsql do
      begin
        try
          if not Eof then
          begin
            CDS.FieldByName('no_penerimaan').AsString := Fields[0].AsString;
            CDS.FieldByName('NamaBarang').AsString := Fields[2].AsString;
            CDS.FieldByName('kurang').AsInteger := Fields[7].AsInteger;
            CDS.FieldByName('Satuan').AsString := Fields[4].AsString;
            CDS.FieldByName('harga').AsFloat := Fields[6].AsFloat;
          end
          else
            bantuansku;
          finally
            free;
        end;
      end;
    end
    else
    begin
      for i := 0 to cxgrdbtblvwGrdMain.DataController.RecordCount-1 do
      begin

        If (cVarToInt(cxgrdbtblvwGrdMain.DataController.Values[i, cxgrdbclmnSKU.Index]) = StrToInt(varglobal)) and (cxgrdbtblvwGrdMain.DataController.FocusedRecordIndex <> i)
         and (StrToDate(varglobal1)= cVarTodate(cxgrdbtblvwGrdMain.DataController.Values[i, cxgrdbclmnExpired.Index])) then
        begin

          ShowMessage('Sku dan expired ada yang sama dengan baris '+ IntToStr(i+1));
          CDS.Cancel;
          exit;
        end;
      end;

       If CDS.State <> dsEdit then
     CDS.Edit;


        CDS.FieldByName('sku').AsInteger := StrToInt(varglobal);
        CDS.FieldByName('expired').AsDateTime := strtodate(varglobal1);

    s:='select brg_kode Sku, mst_expired_date Expired,brg_nama NamaBarang, brg_satuan Satuan,sum(mst_stok_in-mst_stok_out) stok,'
    + ' (select ifnull(MST_HARGABELI,0) from tmasterstok where mst_brg_kode=a.brg_kode and mst_hargabeli > 1'
    + ' and (mst_noreferensi like "RI%" or mst_noreferensi like "%KOR%") '
    + ' order by mst_tanggal desc LIMIT 1) '
    + '  hargabeli from Tbarang a'
    + ' inner join tmasterstok  on mst_brg_kode=brg_kode and mst_gdg_kode= '+ Quot(vartostr(cxLookupGudang.EditValue))
    + ' where brg_kode = ' + Quot(CDS.Fieldbyname('sku').AsString)
    + ' and mst_expired_date = ' + QuotD(CDS.Fieldbyname('expired').AsDateTime)
    + ' group by brg_kode , brg_nama , brg_satuan ,mst_expired_date ';
      tsql := xOpenQuery(s,frmMenu.conn);
      with tsql do
      begin
        try
          if not Eof then
          begin
            CDS.FieldByName('NamaBarang').AsString := Fields[2].AsString;
            CDS.FieldByName('Satuan').AsString := Fields[3].AsString;
            CDS.FieldByName('harga').AsFloat := Fields[5].AsFloat;
          end
          else
            bantuansku;
          finally
            free;
        end;
      end;
    end;
  end;
end;

procedure TfrmMutasiCabang.clQTYPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  i:integer;
  aqtystok:integer;
  s:string;
  tsql:TmyQuery;
  SKU, Expired,Nomor: string;
  StokTersedia: Integer;
  TotalQtyInput: Integer;
  TotalPerNomor: Integer;
  SisaPermintaan: Integer;
  QtyInput: Integer;
  TempBookmark: string;
   CurrentRecNo: Integer;
begin
   QtyInput := cVarToInt(DisplayValue);
  
  // Validasi dasar
//  if QtyInput <= 0 then
//  begin
//    Error := True;
//    ErrorText := 'QTY harus lebih dari 0';
//    Exit;
//  end;

  {if chkPermintaan.Checked then
  begin

    SKU := CDS.FieldByName('sku').AsString;
    Expired := FormatDateTime('yyyy-mm-dd', CDS.FieldByName('expired').AsDateTime);
    Nomor := CDS.FieldByName('no_penerimaan').AsString;

    s := 'select sum(mst_stok_in-mst_stok_out) stok from Tbarang '
       + ' inner join tmasterstok on mst_brg_kode=brg_kode and mst_gdg_kode= '
       + Quot(vartostr(cxLookupGudang.EditValue))
       + ' where brg_kode = ' + Quot(CDS.Fieldbyname('sku').AsString)
       + ' and mst_expired_date = ' + QuotD(CDS.Fieldbyname('expired').AsDateTime);

    tsql := xOpenQuery(s, frmMenu.conn);
    try
      if not tsql.Eof then
        StokTersedia := tsql.Fields[0].AsInteger
      else
        StokTersedia := 0;
    finally
      tsql.Free;
    end;

    CurrentRecNo := CDS.RecNo;

    TotalQtyInput := 0;

    if not CDS.IsEmpty then
      TempBookmark := CDS.Bookmark;

    with CDS do
    begin
      DisableControls;
      try
        First;
        while not Eof do
        begin
          if (FieldByName('sku').AsString = SKU) and
             (FormatDateTime('yyyy-mm-dd', FieldByName('expired').AsDateTime) = Expired) then
          begin
            if RecNo = CurrentRecNo then
              TotalQtyInput := TotalQtyInput + QtyInput
            else
              TotalQtyInput := TotalQtyInput + FieldByName('QTY').AsInteger;
          end;
          Next;
        end;
      finally
        if TempBookmark <> '' then
          Bookmark := TempBookmark;
        EnableControls;
      end;
    end;

    if TotalQtyInput > StokTersedia then
    begin
      Error := True;
      ErrorText := 'qty untuk barang ini (' + IntToStr(TotalQtyInput) +
                   ') melebihi stok di gudang (' + IntToStr(StokTersedia) + ')';
      Exit;
    end;

     CurrentRecNo := CDS.RecNo;
  
  TotalPerNomor := 0;
  
  if not CDS.IsEmpty then
    TempBookmark := CDS.Bookmark;
  
  with CDS do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        if (FieldByName('no_penerimaan').AsString = Nomor) and 
           (FieldByName('sku').AsString = SKU) then
        begin
          if RecNo = CurrentRecNo then
            TotalPerNomor := TotalPerNomor + QtyInput
          else  // Baris lain
            TotalPerNomor := TotalPerNomor + FieldByName('QTY').AsInteger;
        end;
        Next;
      end;
    finally
      if TempBookmark <> '' then
        Bookmark := TempBookmark;
      EnableControls;
    end;
  end;

     SisaPermintaan := CDS.FieldByName('kurang').AsInteger;

    if TotalPerNomor > SisaPermintaan then
    begin
      Error := True;
      ErrorText := 'Total untuk nomor ' + Nomor + ' (' + IntToStr(TotalPerNomor) +
                   ') melebihi sisa permintaan (' + IntToStr(SisaPermintaan) + ')';
      Exit;
    end;

    if QtyInput > CDS.FieldByName('kurang').AsInteger then
    begin
      Error := True;
      ErrorText := 'QTY tidak boleh melebihi sisa permintaan (' + 
                   IntToStr(CDS.FieldByName('kurang').AsInteger) + ')';
      Exit;
    end;
  end
  else
  begin }
    // DI KOMEN KARENA, DATANYA HILANG. STOKNYA JADI GESEHH. SAMBIL BENERIN INI DIKOMEN DULU

    { aqtystok:=0;
    s:='select sum(mst_stok_in-mst_stok_out) stok from Tbarang '
    + ' inner join tmasterstok  on mst_brg_kode=brg_kode and mst_gdg_kode= '+ Quot(vartostr(cxLookupGudang.EditValue))
    + ' where brg_kode = ' + Quot(CDS.Fieldbyname('sku').AsString)
    + ' and mst_expired_date = ' + QuotD(CDS.Fieldbyname('expired').AsDateTime);

      tsql := xOpenQuery(s,frmMenu.conn);
      with tsql do
      begin
        try
          if not Eof then
            aqtystok := Fields[0].AsInteger;
        finally
            free;
        end;
      end;

      if cVarToInt(DisplayValue)> aqtyStok then
      begin
        error := true;
          ErrorText :='Qty melebihi Stok di Gudang';
          exit;
      end; }


//  end;

//  if not Error then
//  begin
//    if CDS.State = dsBrowse then
//      CDS.Edit;
//
//    CDS.FieldByName('QTY').AsInteger := QtyInput;
//
//    CDS.Post;
//
//    cxgrdbtblvwGrdMain.DataController.Refresh;
//  end;
end;

procedure TfrmMutasiCabang.Button1Click(Sender: TObject);
  var
    s:string;
    tsql:TmyQuery;
    i:Integer;
begin
    sqlbantuan := 'select bpb_nomor,bpb_tanggal,po_sup_kode,sup_nama from tbpb_hdr inner join tpo_hdr on'
      + ' bpb_po_nomor=po_nomor '
      + ' inner join  tsupplier on sup_kode=po_sup_kode'
      + ' where year(bpb_tanggal) > 2018';

  Application.CreateForm(Tfrmbantuan,frmbantuan);
  frmBantuan.SQLMaster := SQLbantuan;
  frmBantuan.ShowModal;
  if varglobal <> '' then
  begin
    edtKeterangan.Text := varglobal;
        s := 'select brg_kode Sku, mst_expired_date Expired,brg_nama NamaBarang, brg_satuan Satuan,sum(mst_stok_in-mst_stok_out) stok,mst_hargabeli hargabeli from Tbarang '
       + ' inner join tmasterstok  on mst_brg_kode=brg_kode and mst_noreferensi= '+ Quot(edtKeterangan.Text)
       + ' group by brg_kode , brg_nama , brg_satuan ,mst_expired_date ';
          tsql := xOpenQuery(s,frmMenu.conn);
         try
                with tsql do
                begin
                  cds.emptydataset;
                  while  not Eof do
                  begin
                            CDS.Append;
                            CDS.FieldByName('SKU').AsInteger        := fieldbyname('sku').AsInteger;
                            CDS.FieldByName('Namabarang').Asstring  := fieldbyname('namabarang').AsString;
                            CDS.FieldByName('satuan').AsString      := fieldbyname('satuan').Asstring;
                            CDS.FieldByName('QTY').AsInteger        := fieldbyname('stok').Asinteger;
                            CDS.FieldByName('expired').AsDateTime   := fieldbyname('expired').AsDateTime;
                            CDS.FieldByName('harga').AsFloat       :=  fieldbyname('hargabeli').asfloat;;

                            CDS.Post;
                            next;
                  end ;
                end;
          finally
            tsql.free;
          end;
         chkPermintaan.Checked := False;
  end;

end;

function TfrmMutasiCabang.getdatabase(akode:string):string;
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

function TfrmMutasiCabang.getdatabase2(akode:string):string;
var
  s:string;
  tsql:TmyQuery;
begin
  Result := 'bsm';
  s:=' select cbg_database from tcabang where cbg_nama ='+ Quot(akode);

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

procedure TfrmMutasiCabang.chkPermintaanClick(Sender: TObject);
begin
  if chkPermintaan.Checked then
  begin
    cxgrdbclmnPenerimaan.Visible := True;
    cxgrdbclmnKurang.Visible := True;
    cxgrdbclmnStok.Visible := True;
  end
  else
  begin
    cxgrdbclmnPenerimaan.Visible := False;
    cxgrdbclmnKurang.Visible := False;
    cxgrdbclmnStok.Visible := False;
  end;
end;

procedure TfrmMutasiCabang.btn1Click(Sender: TObject);
var
    s:string;
    tsql:TmyQuery;
    i:Integer;
begin
    CDS3.First;
  while not CDS3.Eof do
  begin
   if (CDS3.FieldByName('qty').AsInteger >  0) and (CDS3.FieldByName('sku').AsInteger >  0) then
   begin
     for i := 0 to cxgrdbtblvwGrdMain.DataController.RecordCount-1 do
      begin

        If (cVarToInt(cxgrdbtblvwGrdMain.DataController.Values[i, cxgrdbclmnSKU.Index]) = CDS3.FieldByName('SKU').AsInteger) and (cxgrdbtblvwGrdMain.DataController.FocusedRecordIndex <> i)
         and (CDS2.fieldbyname('Expired').AsDateTime = cVarTodate(cxgrdbtblvwGrdMain.DataController.Values[i, cxgrdbclmnExpired.Index])) then
        begin

          ShowMessage('Sku dan expired ada yang sama dengan baris '+ IntToStr(i+1));
          CDS.Cancel;
          exit;
        end;
      end;

     If CDS.State <> dsEdit then
         CDS.Edit;

         cds.Append;
         CDS.FieldByName('SKU').AsInteger := CDS3.FieldByName('SKU').AsInteger;
          CDS.FieldByName('NamaBarang').AsString := CDS3.FieldByName('NamaBarang').AsString;
          CDS.FieldByName('stok').AsInteger := CDS3.FieldByName('stok').AsInteger;
          CDS.FieldByName('qty').AsInteger := CDS3.FieldByName('QTY').AsInteger;
          CDS.FieldByName('kurang').AsInteger := CDS2.FieldByName('kurang').AsInteger;
          CDS.FieldByName('Satuan').AsString := CDS2.FieldByName('Satuan').AsString;
          CDS.FieldByName('expired').AsDateTime := CDS2.fieldbyname('Expired').AsDateTime;
          CDS.FieldByName('keterangan').AsString := CDS2.FieldByName('keterangan').AsString;
          CDS.FieldByName('harga').AsFloat := CDS2.FieldByName('harga').AsFloat;
          CDS.FieldByName('no_penerimaan').AsString := CDS2.FieldByName('no_penerimaan').AsString;
          CDS.Post;
     end;
     CDS3.next;
   end;

   if (CDS.RecordCount > 0) then
    begin
      CDS.First;
      if CDS.FieldByName('sku').IsNull or (CDS.FieldByName('sku').AsString = '') then
      begin
        CDS.Delete;
      end;
    end;
end;

procedure TfrmMutasiCabang.edtNomorPBClickBtn(Sender: TObject);
var
    s:string;
    tsql:TmyQuery;
    i:Integer;
begin
  adatabase := getdatabase(cxLookupCabangTujuan.EditValue)+'.';

  sqlbantuan := ' SELECT pb_nomor Nomor, pb_tanggal Tanggal, pb_memo Keterangan '
                 +' FROM '+adatabase+'tpermintaanbarang_hdr '
                 +' WHERE pb_isclosed = 0';

  Application.CreateForm(Tfrmbantuan,frmbantuan);
  frmBantuan.SQLMaster := SQLbantuan;
  frmBantuan.ShowModal;

  if varglobal <> '' then
  begin
    edtNomorPB.Text := varglobal;
//    edtKeterangan.Text := varglobal;
        s := ' SELECT * FROM ( '
           + '     SELECT a.brg_kode AS Sku, '
           + '            mst_expired_date AS Expired, '
           + '            brg_nama AS NamaBarang, '
           + '            brg_satuan AS Satuan, '
           + '            (pbd_qty - pbd_qtyterima) qtykurang, '
           + '            ( '
           + '                SELECT IFNULL(MST_HARGABELI,0) '
           + '                FROM tmasterstok '
           + '                WHERE mst_brg_kode = a.brg_kode '
           + '                  AND mst_hargabeli > 1 '
           + '                  AND (mst_noreferensi LIKE ''RI%'' '
           + '                       OR mst_noreferensi LIKE ''%KOR%'') '
           + '                ORDER BY mst_tanggal DESC '
           + '                LIMIT 1 '
           + '            ) AS hargabeli, '
//           + '            (SELECT sa.Stok from StokAll sa where sa.brg_kode = a.brg_kode) Stok, '
           + '            SUM(mst_stok_in - mst_stok_out) AS stok, '
           + '            ROW_NUMBER() OVER ( '
           + '                PARTITION BY brg_kode '
           + '                ORDER BY SUM(mst_stok_in - mst_stok_out) DESC '
           + '            ) AS rn '
           + '     FROM Tbarang a '
           + '     INNER JOIN tmasterstok ON mst_brg_kode = brg_kode '
           + '     AND mst_gdg_kode = ' + Quot(vartostr(cxLookupGudang.EditValue))
           + '     INNER JOIN ' + adatabase + 'tpermintaanbarang_dtl ON brg_kode = pbd_brg_kode '
           + '     AND pbd_pb_nomor = ' + Quot(varglobal)
           + '     WHERE pbd_qty > pbd_qtyterima '
           + '     GROUP BY brg_kode, brg_nama, brg_satuan, mst_expired_date '
           + ' ) x '
           + ' WHERE rn = 1 '
           + ' ORDER BY stok DESC ';
          tsql := xOpenQuery(s,frmMenu.conn);
         try
                with tsql do
                begin
                  CDS2.emptydataset;
                  while  not Eof do
                  begin
                            CDS2.Append;
                            CDS2.FieldByName('no_penerimaan').AsString := varglobal;
                            CDS2.FieldByName('sku').AsInteger := fieldbyname('sku').AsInteger;
                            CDS2.FieldByName('qty').AsInteger := 0;
                            CDS2.FieldByName('NamaBarang').AsString := fieldbyname('namabarang').AsString;
                            CDS2.FieldByName('kurang').AsInteger := fieldbyname('qtykurang').asinteger;
                            CDS2.FieldByName('Satuan').AsString := fieldbyname('satuan').Asstring;
                            CDS2.FieldByName('expired').AsDateTime := fieldbyname('expired').AsDateTime;
                            CDS2.FieldByName('harga').AsFloat := fieldbyname('hargabeli').asfloat;
                            CDS2.FieldByName('stok').AsInteger := fieldbyname('stok').asinteger;
                            CDS2.Post;
                            next;
                  end ;
                end;
          finally
            tsql.free;
          end;
          chkPermintaan.Checked := True;
  end;
end;

procedure TfrmMutasiCabang.cxgrdbtblvwcx2CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
    s:string;
    tsql:TmyQuery;
    i:Integer;
begin
  if cxgrdbtblvwcx2.DataController.FocusedRecordIndex >= 0 then
  begin
    lbl3.Caption := 'Stok '+ CDS2.FieldByName('NamaBarang').AsString;
//        ShowMessage(vartostr(cxLookupGudang.EditValue) + ' ' + CDS2.FieldByName('SKU').AsString);
        s := ' SELECT SUM(mst_stok_in - mst_stok_out) stok, mst_expired_date AS Expired '
           + ' FROM tbarang '
           + ' INNER JOIN tmasterstok ON mst_brg_kode = brg_kode '
           + ' AND mst_gdg_kode = ' + Quot(vartostr(cxLookupGudang.EditValue))
           + ' AND brg_kode = ' + Quot(CDS2.FieldByName('SKU').AsString)
           + ' GROUP BY mst_expired_date '
           + ' HAVING SUM(mst_stok_in - mst_stok_out) > 0 '
           + ' ORDER BY stok DESC';
          tsql := xOpenQuery(s,frmMenu.conn);
         try
          with tsql do
          begin
            CDS3.emptydataset;
            while not Eof do
            begin
                      CDS3.Append;
                      CDS3.FieldByName('SKU').AsInteger := CDS2.FieldByName('SKU').AsInteger;
                      CDS3.FieldByName('NamaBarang').AsString := CDS2.FieldByName('NamaBarang').AsString;
                      CDS3.FieldByName('stok').AsInteger := fieldbyname('stok').asinteger;
                      CDS3.FieldByName('qty').AsInteger := 0;
                      CDS3.FieldByName('kurang').AsInteger := CDS2.FieldByName('kurang').AsInteger;
                      CDS3.FieldByName('Satuan').AsString := CDS2.FieldByName('Satuan').AsString;
                      CDS3.FieldByName('expired').AsDateTime := fieldbyname('Expired').AsDateTime;
                      CDS3.FieldByName('keterangan').AsString := CDS2.FieldByName('keterangan').AsString;
                      CDS3.FieldByName('harga').AsFloat := CDS2.FieldByName('harga').AsFloat;
                      CDS3.FieldByName('no_penerimaan').AsString := CDS2.FieldByName('no_penerimaan').AsString;
                      CDS3.Post;
                      next;
            end ;
          end;
    finally
      tsql.free;
    end;
  end;
end;

procedure TfrmMutasiCabang.cxgrdbclmn15PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  i:integer;
  aqtystok:integer;
  s:string;
  tsql:TmyQuery;
  SKU, Expired,Nomor: string;
  StokTersedia: Integer;
  TotalQtyInput: Integer;
  TotalPerNomor: Integer;
  SisaPermintaan: Integer;
  QtyInput: Integer;
  TempBookmark: string;
   CurrentRecNo: Integer;
begin
QtyInput := cVarToInt(DisplayValue);
  
  // Validasi dasar
//  if QtyInput <= 0 then
//  begin
//    Error := True;
//    ErrorText := 'QTY harus lebih dari 0';
//    Exit;
//  end;

  if chkPermintaan.Checked then
  begin

    SKU := CDS3.FieldByName('sku').AsString;
    Expired := FormatDateTime('yyyy-mm-dd', CDS3.FieldByName('expired').AsDateTime);
    Nomor := CDS3.FieldByName('no_penerimaan').AsString;

    s := 'select sum(mst_stok_in-mst_stok_out) stok from Tbarang '
       + ' inner join tmasterstok on mst_brg_kode=brg_kode and mst_gdg_kode= '
       + Quot(vartostr(cxLookupGudang.EditValue))
       + ' where brg_kode = ' + Quot(CDS3.Fieldbyname('sku').AsString)
       + ' and mst_expired_date = ' + QuotD(CDS3.Fieldbyname('expired').AsDateTime);

    tsql := xOpenQuery(s, frmMenu.conn);
    try
      if not tsql.Eof then
        StokTersedia := tsql.Fields[0].AsInteger
      else
        StokTersedia := 0;
    finally
      tsql.Free;
    end;

    CurrentRecNo := CDS3.RecNo;

    TotalQtyInput := 0;

    if not CDS3.IsEmpty then
      TempBookmark := CDS3.Bookmark;

    with CDS3 do
    begin
      DisableControls;
      try
        First;
        while not Eof do
        begin
          if (FieldByName('sku').AsString = SKU) and
             (FormatDateTime('yyyy-mm-dd', FieldByName('expired').AsDateTime) = Expired) then
          begin
            if RecNo = CurrentRecNo then
              TotalQtyInput := TotalQtyInput + QtyInput
            else
              TotalQtyInput := TotalQtyInput + FieldByName('QTY').AsInteger;
          end;
          Next;
        end;
      finally
        if TempBookmark <> '' then
          Bookmark := TempBookmark;
        EnableControls;
      end;
    end;

    { if TotalQtyInput > StokTersedia then
    begin
      Error := True;
      ErrorText := 'qty untuk barang ini (' + IntToStr(TotalQtyInput) +
                   ') melebihi stok di gudang (' + IntToStr(StokTersedia) + ')';
      Exit;
    end;}

     CurrentRecNo := CDS3.RecNo;
  
  TotalPerNomor := 0;
  
  if not CDS3.IsEmpty then
    TempBookmark := CDS3.Bookmark;
  
  with CDS3 do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        if (FieldByName('no_penerimaan').AsString = Nomor) and 
           (FieldByName('sku').AsString = SKU) then
        begin
          if RecNo = CurrentRecNo then
            TotalPerNomor := TotalPerNomor + QtyInput
          else  // Baris lain
            TotalPerNomor := TotalPerNomor + FieldByName('QTY').AsInteger;
        end;
        Next;
      end;
    finally
      if TempBookmark <> '' then
        Bookmark := TempBookmark;
      EnableControls;
    end;
  end;

     SisaPermintaan := CDS3.FieldByName('kurang').AsInteger;

    if TotalPerNomor > SisaPermintaan then
    begin
      Error := True;
      ErrorText := 'Total untuk nomor ' + Nomor + ' (' + IntToStr(TotalPerNomor) +
                   ') melebihi sisa permintaan (' + IntToStr(SisaPermintaan) + ')';
      Exit;
    end;

    if QtyInput > CDS3.FieldByName('kurang').AsInteger then
    begin
      Error := True;
      ErrorText := 'QTY tidak boleh melebihi sisa permintaan (' + 
                   IntToStr(CDS3.FieldByName('kurang').AsInteger) + ')';
      Exit;
    end;
  end;

  if not Error then
  begin
    if CDS3.State = dsBrowse then
      CDS3.Edit;

    CDS3.FieldByName('QTY').AsInteger := QtyInput;

    CDS3.Post;

    cxgrdbtblvwGrdMain.DataController.Refresh;
  end;
end;

end.
