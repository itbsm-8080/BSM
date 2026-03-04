unit ufrmPesanan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, DBClient, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSpinEdit, cxCurrencyEdit, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, MyAccess;

type
  TfrmPesanan = class(TForm)
    AdvPanel1: TAdvPanel;
    Label2: TLabel;
    edtNomor: TAdvEdit;
    Label3: TLabel;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    AdvPanel2: TAdvPanel;
    Label1: TLabel;
    Label4: TLabel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    cxLookupSales: TcxExtLookupComboBox;
    cxLookupCustomer: TcxExtLookupComboBox;
    AdvPanel4: TAdvPanel;
    cxGrid: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    clNo: TcxGridDBColumn;
    clSKU: TcxGridDBColumn;
    clNamaBarang: TcxGridDBColumn;
    clHarga: TcxGridDBColumn;
    clQTY: TcxGridDBColumn;
    clTotal: TcxGridDBColumn;
    clKet: TcxGridDBColumn;
    cxGrdDetail: TcxGridDBTableView;
    lvMaster: TcxGridLevel;
    lbljudul: TLabel;
    dtTanggal: TDateTimePicker;
    edtShip: TAdvEdit;
    Label5: TLabel;
    chkPajak: TCheckBox;
    AdvPanel5: TAdvPanel;
    Label6: TLabel;
    edtAlamat: TAdvEdit;
    edtmemo: TMemo;
    Label7: TLabel;
    edtDiscpr: TAdvEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtDiscFaktur: TAdvEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtPPN: TAdvEdit;
    edtTotal: TAdvEdit;
    clDisc: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    HapusRecord1: TMenuItem;
    edtDisc: TAdvEdit;
    Label13: TLabel;
    Label14: TLabel;
    edtDP: TAdvEdit;
    clSatuan: TcxGridDBColumn;
    procedure refreshdata;
   procedure initgrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function getmaxkode:string;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function GetCDS: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure cxLookupCustomerPropertiesChange(Sender: TObject);
    procedure clNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
   procedure initViewSKU;
    procedure clQTYPropertiesEditValueChanged(Sender: TObject);
    procedure HapusRecord1Click(Sender: TObject);
    procedure clSKUPropertiesEditValueChanged(Sender: TObject);
    procedure rorte(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure clKetPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrdMainDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure hitung;  
    procedure edtDiscprExit(Sender: TObject);
    procedure edtDiscFakturExit(Sender: TObject);
    procedure chkPajakClick(Sender: TObject);
    procedure dtTanggalChange(Sender: TObject);
    procedure simpandata;
    function cekdata:Boolean;
    procedure loaddataall(akode : string);
  private
    FCDSSalesman: TClientDataset;
    FCDSCustomer: TClientDataset;
    FCDSSKU : TClientDataset;
    FFLAGEDIT: Boolean;
    FID: string;
    function GetCDSSalesman: TClientDataset;
    function GetCDSCustomer: TClientDataset;


    { Private declarations }
  protected
    FCDS: TClientDataSet;
  public
    property CDS: TClientDataSet read GetCDS write FCDS;
    property CDSSKU: TClientDataSet read FCDSSKU write FCDSSKU;
    property CDSSalesman: TClientDataset read GetCDSSalesman write FCDSSalesman;
    property CDSCustomer: TClientDataset read GetCDSCustomer write FCDSCustomer;
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;
    { Public declarations }
  end;

var
  frmPesanan: TfrmPesanan;
const
  nomerator = 'SO';

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure TfrmPesanan.refreshdata;
begin
  FID:='';
  FLAGEDIT := False;
  dtTanggal.DateTime := Date;
  chkPajak.Checked := True;
  chkPajak.Enabled := True;
  edtnomor.Text := getmaxkode;
  cxLookupSales.EditValue := '';
  cxLookupCustomer.EditValue := '';
  edtAlamat.Clear;
  edtmemo.Clear;
  edtShip.Clear;
  edtDP.Text :='0';
  cxLookupCustomer.SetFocus;
  initgrid;

end;
procedure Tfrmpesanan.initgrid;
begin
  CDS.EmptyDataSet;
  CDS.Append;
  CDS.FieldByName('QTY').AsInteger    := 0;
  CDS.FieldByName('Harga').AsInteger  := 0;
  CDS.FieldByName('Total').AsInteger  := 0;
  CDS.Post;

end;
procedure TfrmPesanan.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;



procedure TfrmPesanan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmPesanan.getmaxkode:string;
var
  s:string;
begin
  if chkPajak.Checked then
  begin
  s:='select max(right(so_nomor,4)) from tso_hdr where so_nomor like ' + quot(NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.%')
  + ' and so_istax=1 ';
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
  end
  else
  begin
    s:='select max(right(so_nomor,4)) from tso_hdr where so_nomor like ' + quot(NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.%')
      + ' and so_istax =0 ';
  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.'+RightStr(IntToStr(15000+1),4)
      else
         result:= NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.'+RightStr(IntToStr(15000+fields[0].AsInteger+1),4);

    finally
      free;
    end;
  end;
  end;
end;

procedure TfrmPesanan.cxButton1Click(Sender: TObject);
begin
    try
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

procedure TfrmPesanan.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmPesanan.cxButton2Click(Sender: TObject);
begin
   try
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

function TfrmPesanan.GetCDSSalesman: TClientDataset;
var s:String;
begin
  If not Assigned(FCDSSalesman) then
  begin
    S := 'select sls_nama as salesman, sls_kode Kode'
        +' from tsalesman';
    FCDSSalesman := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDSSalesman;
end;

procedure TfrmPesanan.FormCreate(Sender: TObject);
begin
  with TcxExtLookupHelper(cxLookupSales.Properties) do
    LoadFromCDS(CDSSalesman, 'Kode','Salesman',['Kode'],Self);
  with TcxExtLookupHelper(cxLookupCustomer.Properties) do
    LoadFromCDS(CDSCustomer, 'Kode','Customer',['Kode'],Self);
     TcxExtLookupHelper(cxLookupCustomer.Properties).SetMultiPurposeLookup;

     TcxDBGridHelper(cxGrdMain).LoadFromCDS(CDS, False, False);
     initViewSKU;
end;

function TfrmPesanan.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'No', ftInteger, False);
    zAddField(FCDS, 'SKU', ftInteger, False);
    zAddField(FCDS, 'QTY', ftInteger, False);
    zAddField(FCDS, 'Satuan', ftString, False, 10);
    zAddField(FCDS, 'Harga', ftFloat, False);
    zAddField(FCDS, 'Disc', ftFloat, False);
    zAddField(FCDS, 'Total', ftFloat, False);
    zAddField(FCDS, 'Keterangan', ftString, False, 255);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmPesanan.GetCDSCustomer: TClientDataset;
var s:String;
begin
  If not Assigned(FCDSCustomer) then
  begin
    S := 'select cus_nama as Customer, cus_kode Kode, Cus_alamat Alamat,cus_shipaddress'
        +' from tCustomer';


    FCDSCustomer := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDSCustomer;
end;

procedure TfrmPesanan.FormShow(Sender: TObject);
begin
refreshdata;
end;

procedure TfrmPesanan.cxLookupCustomerPropertiesChange(Sender: TObject);
begin
edtAlamat.Text := CDSCustomer.Fields[2].AsString;
edtShip.Text :=  CDSCustomer.Fields[3].AsString;
end;

procedure TfrmPesanan.clNoGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  If Assigned(ARecord) then
  begin
    AText := Inttostr(ARecord.Index+1);
  end;
end;

procedure TfrmPesanan.initViewSKU;
var
  S: string;
begin
  if Assigned(FCDSSKU) then FCDSSKU.Free;
  S := 'select brg_kode sku, brg_nama NamaBarang, brg_hrgJual HrgJual,brg_satuan Satuan from Tbarang ';


  FCDSSKU := TConextMain.cOpenCDS(S, nil);

  with TcxExtLookupHelper(clSKU.Properties) do
  begin
    LoadFromCDS(CDSSKU, 'SKU','SKU',['SKU'],Self);
    SetMultiPurposeLookup;
  end;

  with TcxExtLookupHelper(clNamaBarang.Properties) do
    LoadFromCDS(CDSSKU, 'SKU','NamaBarang',['SKU'],Self);
  

end;
procedure TfrmPesanan.clQTYPropertiesEditValueChanged(Sender: TObject);
var
  i: Integer;
  lVal: Double;
begin
  inherited;
  cxGrdMain.DataController.Post;

  i := cxGrdMain.DataController.FocusedRecordIndex;
  lVal := cxGrdMain.DataController.Values[i, clQTY.Index] *  cxGrdMain.DataController.Values[i, clHarga.Index]*(cvartofloat(cxGrdMain.DataController.Values[i,cldisc.Index])/100);
  lVal := cxGrdMain.DataController.Values[i, clQTY.Index] * cxGrdMain.DataController.Values[i, clHarga.Index] - lVal;

  If CDS.State <> dsEdit then CDS.Edit;
  CDS.FieldByName('Total').AsFloat := lVal;
  CDS.Post;


end;
procedure TfrmPesanan.HapusRecord1Click(Sender: TObject);
begin
 If CDS.Eof then exit;
  CDS.Delete;
  If CDS.Eof then initgrid;
end;

procedure TfrmPesanan.clSKUPropertiesEditValueChanged(Sender: TObject);
begin
 CDS.FieldByName('harga').AsFloat := CDSSKU.Fields[2].AsFloat;
 CDS.FieldByName('satuan').AsString := CDSSKU.Fields[3].Asstring;

end;

procedure TfrmPesanan.rorte(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  var
  i:integer;
begin
    for i := 0 to cxGrdMain.DataController.RecordCount-1 do
    begin
      If (cVarToInt(cxGrdMain.DataController.Values[i, clSKU.Index]) = DisplayValue) and (cxGrdMain.DataController.FocusedRecordIndex <> i) then
      begin
        error := true;
        ErrorText :='Sku sudah ada';
        exit;
      end;
    end;
end;

procedure TfrmPesanan.clKetPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  var
    i:integer ;
begin
   i := cxGrdMain.DataController.FocusedRecordIndex;

 If (cVarToInt(cxGrdMain.DataController.Values[i, clSKU.Index])=0) then
 begin
    Error :=True;
    ErrorText := 'Sku Belum Diinput';

 end;
end;

procedure TfrmPesanan.cxGrdMainDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);

begin
  Hitung;
end;

procedure TfrmPesanan.hitung;
var
  asubtotal : Double;
  adisc:Double;
begin
  asubtotal :=cVarToFloat(TcxDBGridHelper(cxGrdMain).GetFooterSummary('Total'));
  edtDiscFaktur.Text := FloatToStr((cStrToFloat(edtDiscpr.text)/100*asubtotal)+cStrToFloat(edtDisc.text)) ;
  asubtotal := asubtotal - cStrToFloat(edtDiscFaktur.Text);
  if chkPajak.Checked then
  begin
    edtTotal.Text :=FloatToStr(asubtotal*getangkappn(dttanggal.datetime));
    edtPPN.Text := FloatToStr(asubtotal *getangkappn2(dttanggal.datetime));
  end
  else
  begin
    edtTotal.Text :=FloatToStr(asubtotal);
    edtPPN.Text := '0';
  end;

end;
procedure TfrmPesanan.edtDiscprExit(Sender: TObject);
begin
 if edtDiscpr.Text = '' then
    edtDiscpr.Text :='0';
hitung;
end;

procedure TfrmPesanan.edtDiscFakturExit(Sender: TObject);
begin
  if edtDiscFaktur.Text = '' then
    edtDiscFaktur.Text :='0';
  hitung;  
end;

procedure TfrmPesanan.chkPajakClick(Sender: TObject);
begin
hitung;
edtnomor.text := getmaxkode;
end;

procedure TfrmPesanan.dtTanggalChange(Sender: TObject);
begin
edtNomor.Text := getmaxkode;
end;


procedure TfrmPesanan.simpandata;
var
  s:string;
  i:integer;
  tt:TStrings;
  aistax : integer;
begin
  if chkPajak.Checked then
    aistax :=  1
  else
    aistax := 0;
if FLAGEDIT then
  s:='update TSO_HDR set '
    + ' so_cus_kode = ' + Quot(cxLookupCustomer.EditValue) + ','
    + ' so_memo = ' + Quot(edtmemo.Text) + ','
    + ' so_shipaddress = ' + Quot(edtShip.Text)+','
    + ' so_sls_kode = ' + Quot(cxLookupSales.EditValue) + ','
    + ' so_disc_faktur =' + floattostr(cStrToFloat(edtDiscpr.Text))+ ','
    + ' so_disc_fakturpr = '+ floattostr(cStrToFloat(edtDisc.Text))+ ','
    + ' so_amount = '+ floattostr(cstrtoFloat(edtTotal.Text))+ ','
    + ' so_taxamount = '+ floattostr(cStrToFloat(edtPPN.Text))+ ','
    + ' so_istax = ' + IntToStr(aistax)+  ','
    + ' so_DP = ' +floattostr(cStrToFloat(edtDp.Text))+ ','
    + ' date_modified  = ' + QuotD(cGetServerTime,True) + ','
    + ' user_modified = ' + Quot(frmMenu.KDUSER)
    + ' where so_nomor = ' + quot(FID) + ';'
else
begin
  edtNomor.Text := getmaxkode;
  s :=  ' insert into TSO_HDR '
             + ' (so_nomor,so_tanggal,so_memo,so_cus_kode,so_shipaddress,so_sls_kode,so_disc_faktur,'
             + ' so_disc_fakturpr,so_amount,so_taxamount,so_DP,so_istax,date_create,user_create) '
             + ' values ( '
             + Quot(edtNomor.Text) + ','
             + Quotd(dtTanggal.Date) + ','
             + Quot(edtmemo.Text)+','
             + Quot(cxLookupCustomer.EditValue) + ','
             + Quot(edtShip.Text)  + ','
             + Quot(cxLookupSales.EditValue)+','
             + floattostr(cStrToFloat(edtDisc.Text))+ ','
             + floattostr(cStrToFloat(edtDiscpr.Text))+ ','
             + floattostr(cStrToFloat(edtTotal.Text))+ ','
             + floattostr(cStrToFloat(edtPPN.Text))+ ','
             + floattostr(cStrToFloat(edtDP.Text))+ ','
             + IntToStr(aistax)+  ','
             + QuotD(cGetServerTime,True) + ','
             + Quot(frmMenu.KDUSER)+')';
end;
  // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);


     tt := TStringList.Create;
   s:= ' delete from TSO_DTL '
      + ' where  sod_so_nomor =' + quot(FID);

   tt.Append(s);
   CDS.First;
  while not CDS.Eof do
  begin
    i:=1;
    S:='insert into tso_DTL (sod_so_nomor,sod_brg_kode,sod_brg_satuan,sod_qty,sod_discpr,sod_harga,sod_keterangan,sod_nourut) values ('
      + Quot(edtNomor.Text) +','
      + IntToStr(CDS.FieldByName('SKU').AsInteger) +','
      + Quot(CDS.FieldByName('satuan').AsString) +','
      + IntToStr(CDS.FieldByName('QTY').AsInteger) +','
      + FloatToStr(cVarToFloat(CDS.FieldByName('DISC').AsFloat))+','
      + FloatToStr(cVarToFloat(CDS.FieldByName('harga').AsFloat))+','
      + quot(CDS.FieldByName('keterangan').AsString) +','
      + IntToStr(i)
      + ');';
    tt.Append(s);
    CDS.Next;
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


function TfrmPesanan.cekdata:Boolean;
var
  i:integer;
begin
  result:=true;
   i := 1;
   If cxLookupCustomer.EditValue = '' then
    begin
      ShowMessage('Customer belum di pilih');
      result:=false;
      Exit;
    end;
     If cxLookupSales.EditValue = '' then
    begin
      ShowMessage('Salesman belum di pilih');
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

    If CDS.FieldByName('QTY').AsInteger = 0 then
    begin
      ShowMessage('QTY Baris : ' + inttostr(i) + ' Belum diisi');
      result:=false;
      Exit;
    end;
    inc(i);
    CDS.Next;
  end;
end;

procedure TfrmPesanan.loaddataall(akode : string);
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
  s := ' select so_nomor,so_tanggal,so_memo,SO_cus_kode,SO_sls_kode,'
     + ' SO_DISC_faktur,so_disc_fakturpr,so_istax,SO_DP,so_shipaddress,sod_keterangan,'
     + ' sod_brg_kode,sod_bRG_satuan,sod_qty,sod_harga,sod_discPR,(sod_qty*sod_harga*(100-sod_discpr)/100) nilai'
     + ' from tso_hdr a'
     + ' LEFT join tso_dtl d on a.so_nomor=d.sod_so_nomor '
     + ' where a.so_nomor = '+ Quot(akode);
    tsql := xOpenQuery(s,frmMenu.conn) ;
   try

       with  tsql do
       begin
         if not eof then
         begin
            flagedit := True;
            FID :=fieldbyname('so_nomor').AsString;
            if fieldbyname('so_istax').AsInteger =1 then
               chkPajak.Checked := True
            else
              chkPajak.Checked := False;
            chkpajak.Enabled := False;
            edtNomor.Text   := fieldbyname('so_nomor').AsString;
            dttanggal.DateTime := fieldbyname('so_tanggal').AsDateTime;
            edtmemo.Text := fieldbyname('so_memo').AsString;
            cxLookupSales.EditValue     := fieldbyname('so_sls_kode').AsString;
            cxLookupCustomer.EditValue  := fieldbyname('so_cus_kode').AsString;
            edtShip.Text := fieldbyname('so_shipaddress').AsString;
            edtDiscpr.Text := fieldbyname('so_disc_fakturpr').AsString;
            edtDisc.Text :=  fieldbyname('so_disc_faktur').AsString;
            edtDP.Text :=  fieldbyname('so_DP').AsString;

            i:=1;
             CDS.EmptyDataSet;
            while  not Eof do
             begin


                      CDS.Append;
                      CDS.FieldByName('SKU').AsInteger        := fieldbyname('sod_brg_kode').AsInteger;
                      CDS.FieldByName('satuan').AsString      := fieldbyname('sod_brg_satuan').Asstring;
                      CDS.FieldByName('QTY').AsInteger        := fieldbyname('sod_qty').AsInteger;
                      CDS.FieldByName('Harga').AsFloat        := fieldbyname('sod_harga').AsFloat;
                      CDS.FieldByName('disc').AsFloat        := fieldbyname('sod_discpr').AsFloat;
                      CDS.FieldByName('total').AsFloat        := fieldbyname('nilai').AsFloat;
                      CDS.FieldByName('keterangan').AsString  := fieldbyname('sod_keterangan').AsString;

                      CDS.Post;
                   i:=i+1;
                   next;
            end ;
            hitung;
        end
        else
        begin
          ShowMessage('Nomor so tidak di temukan');
          dttanggal.SetFocus;
        end;
      end;
   finally
     tsql.Free;
   end;
   hitung;
end;

end.
