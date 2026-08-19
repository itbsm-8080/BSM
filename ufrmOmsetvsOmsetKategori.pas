unit ufrmOmsetvsOmsetKategori;

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
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, MyAccess,
  cxContainer, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TfrmOmsetvsOmsetKategori = class(TfrmCxBrowse)
    PopupMenu1: TPopupMenu;
    UpdateStatusKembali1: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxButton5: TcxButton;
    cxLabel1: TcxLabel;
    cxLookupKategori1: TcxExtLookupComboBox;
    cxLabel2: TcxLabel;
    cxLookupKategori2: TcxExtLookupComboBox;
    cxLabel3: TcxLabel;
    cxLookupKategori3: TcxExtLookupComboBox;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
//    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxGrdMasterStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
//    procedure cxButton9Click(Sender: TObject);

  private
    conn2 : TSQLConnection;
    FCDSKategori: TClientDataset;
    aHost2,aDatabase2,auser2,apassword2 : string;
    function GetCDSKategori: TClientDataset;
    { Private declarations }
  public
    property CDSKategori: TClientDataset read GetCDSKategori write FCDSKategori;
    { Public declarations }
  end;

var
  frmOmsetvsOmsetKategori: TfrmOmsetvsOmsetKategori;

implementation
   uses Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmOmsetvsOmsetKategori.btnRefreshClick(Sender: TObject);
var
s: string;
i, n: Integer;
begin

  cxGrdMaster.ClearItems;

    s:= 'set @tg1 ='+QuotD(startdate.DateTime)+';';
  s:= s +'set @tg2 ='+QuotD(enddate.DateTime)+';';
  EnsureConnected(frmMenu.conn);
  ExecSQLDirect(frmMenu.conn, s);

   s := 'SELECT Cabang, Outlet, ';

  if cxLookupKategori1.Text <> '' then
    s := s + 'COALESCE(SUM(CASE WHEN ktg_kode = ' + QuotedStr(cxLookupKategori1.EditValue) +
         ' THEN nilai_net_per_baris END), 0) AS ' + QuotedStr(cxLookupKategori1.Text) + ', ';

  if cxLookupKategori2.Text <> '' then
    s := s + 'COALESCE(SUM(CASE WHEN ktg_kode = ' + QuotedStr(cxLookupKategori2.EditValue) + 
         ' THEN nilai_net_per_baris END), 0) AS ' + QuotedStr(cxLookupKategori2.Text) + ', ';
         
  if cxLookupKategori3.Text <> '' then
    s := s + 'COALESCE(SUM(CASE WHEN ktg_kode = ' + QuotedStr(cxLookupKategori3.EditValue) +
         ' THEN nilai_net_per_baris END), 0) AS ' + QuotedStr(cxLookupKategori3.Text) + ', ';

  s := s + 'COALESCE(SUM(nilai_net_per_baris), 0) AS Omset '
      + ' FROM vomsetvsomsetkategori '
      + ' GROUP BY Cabang, Outlet';

   Self.SQLMaster := s;

   inherited;
    cxGrdMaster.ApplyBestFit();
     for i := 0 to cxGrdMaster.ColumnCount - 1 do
      cxGrdMaster.Columns[i].Width := 150;
    cxGrdMaster.Columns[0].Width := 120;
    cxGrdMaster.Columns[1].Width := 200;

    n := 0;
    if cxLookupKategori1.EditValue <> '' then Inc(n);
    if cxLookupKategori2.EditValue <> '' then Inc(n);
    if cxLookupKategori3.EditValue <> '' then Inc(n);

    for i := cxGrdMaster.ColumnCount - (n + 1) to cxGrdMaster.ColumnCount - 1 do
    begin
      cxGrdMaster.Columns[i].Summary.FooterKind   := skSum;
      cxGrdMaster.Columns[i].Summary.FooterFormat := '###,###,###,###';
    end;
end;

procedure TfrmOmsetvsOmsetKategori.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  cxLookupKategori1.EditValue := '';
  cxLookupKategori2.EditValue := '';
  cxLookupKategori3.EditValue := '';
//  btnRefreshClick(Self);
end;

procedure TfrmOmsetvsOmsetKategori.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

//procedure TfrmBrowsePermintaanBarang.cxButton3Click(Sender: TObject);
//begin
//  inherited;
//  frmPermintaanBarang.doslip(CDSMaster.FieldByname('Nomor').AsString);
//end;

procedure TfrmOmsetvsOmsetKategori.cxButton4Click(Sender: TObject);
var
  s:string;
begin
  inherited;
     try
       if not cekdelete(frmMenu.KDUSER,'frmPermintaanBarang') then
      begin
         MessageDlg('Anda tidak berhak Menghapus di Modul ini',mtWarning, [mbOK],0);
         Exit;
      End;

      if MessageDlg('Yakin ingin hapus ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;
       s:='delete from tpermintaanbarang_dtl '
        + ' where pbd_pb_nomor = ' + quot(CDSMaster.FieldByname('Nomor').AsString) + ';' ;
        EnsureConnected(frmMenu.conn);
  ExecSQLDirect(frmMenu.conn, s);

       s:='delete from tpermintaanbarang_hdr '
        + ' where pb_nomor = ' + quot(CDSMaster.FieldByname('Nomor').AsString) + ';' ;
        EnsureConnected(frmMenu.conn);
  ExecSQLDirect(frmMenu.conn, s);


      CDSMaster.Delete;
   except
     MessageDlg('Gagal Hapus',mtError, [mbOK],0);
     
     Exit;
   end;
    

end;


procedure TfrmOmsetvsOmsetKategori.cxGrdMasterStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  AColumn : TcxCustomGridTableItem;
begin
  AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('Kembali');

  if (AColumn <> nil)  and (ARecord <> nil) and (AItem <> nil) and
     (cVarToFloat(ARecord.Values[AColumn.Index]) > 0) then
    AStyle := cxStyle1;
end;

procedure TfrmOmsetvsOmsetKategori.cxButton5Click(Sender: TObject);
var
 ss,s,anoreferensi:String;
  ttt,tt : TStrings;

  i:integer;
  tsql:TmyQuery;
begin
  ttt := TStringList.Create;

 // if chkbarang.Checked then
 begin


  s := 'SELECT * FROM tpermintaanbarang_hdr WHERE (date_create between '+Quotd(startdate.DateTime) +' and '+Quotd(enddate.DateTime+1)+')'
  +' OR (date_modified between '+quotd(startdate.datetime)+' and '+Quotd(enddate.DateTime+1)+')';


  tsql := xOpenQuery(s,frmMenu.conn);
    with tsql do
    begin

    while not eof do
    begin
      ss:='delete from bsm.tpermintaanbarang_dtl where pbd_pb_nomor ='+Quot(Fieldbyname('pb_nomor').AsString)+';';
       ttt.Append(ss);
      ss:='delete from bsm.tpermintaanbarang_hdr  where pb_nomor ='+ Quot(FieldByname('pb_nomor').AsString)+';';
      ttt.Append(ss);

      ss := 'insert ignore into bsm.tpermintaanbarang_hdr ('
          + ' pb_nomor,pb_tanggal,pb_memo,date_create,date_modified,user_create,user_modified'
          + ' ) values ('
          + Quot(fieldbyname('pb_nomor').AsString) +','+ Quotd(fieldbyname('pb_tanggal').AsDateTime) +','
          + quot(fieldbyname('pb_memo').Asstring) +','
          + quotd(fieldbyname('date_create').AsDateTime) +','+ quotd(fieldbyname('date_modified').AsDateTime)+','
          + quot(fieldbyname('user_create').Asstring) +','+quot(fieldbyname('user_modified').Asstring)
          +');';

         ttt.Append(ss);

      Next;
    end;
      tsql.Free;
   end;
        

      s := 'SELECT * '
        + ' FROM tpermintaanbarang_dtl inner join tpermintaanbarang_hdr on pb_nomor=pbd_pb_nomor'
        + ' WHERE (date_create between '+Quotd(startdate.DateTime) +' and '+Quotd(enddate.DateTime+1)+')'
        +' OR (date_modified between '+quotd(startdate.datetime)+' and '+Quotd(enddate.DateTime+1)+')';
      tsql := xOpenQuery(s,frmMenu.conn);
    with tsql do
    begin

    while not eof do
    begin

      ss:='insert ignore into bsm.tpermintaanbarang_dtl (pbd_pb_nomor,pbd_brg_kode,pbd_satuan,pbd_qty,'
      + ' pbd_stoknow,pbd_avgsale,pbd_nourut,pbd_keterangan'
      + ' ) values ('
      + Quot(Fieldbyname('pbd_pb_nomor').AsString) +','
      + Quot(Fieldbyname('pbd_brg_kode').AsString) +','
      + Quot(Fieldbyname('pbd_satuan').AsString) +','
      + FloatToStr(Fieldbyname('pbd_qty').AsFloat) +','
      + FloatToStr(Fieldbyname('pbd_stoknow').AsFloat) +','
      + FloatToStr(Fieldbyname('pbd_avgsale').AsFloat) +','
      + intToStr(Fieldbyname('pbd_nourut').AsInteger) +','
      + Quot(Fieldbyname('pbd_keterangan').AsString)  +');';


     ttt.Append(ss);

      Next;
    end;
      tsql.Free;
   end;

   s:='SELECT * '
      + ' FROM tpermintaanbarang_dtl inner join tpermintaanbarang_hdr on pb_nomor=pbd_pb_nomor'
      + ' WHERE (date_create between '+Quotd(startdate.DateTime) +' and '+Quotd(enddate.DateTime+1)+')'
      +' OR (date_modified between '+quotd(startdate.datetime)+' and '+Quotd(enddate.DateTime+1)+')';

  tsql := xOpenQuery(s,frmMenu.conn);
    with tsql do
    begin

    while not eof do
    begin

      ss:='insert ignore into bsm.tpermintaanbarang_dtl (pbd_pb_nomor,pbd_brg_kode,pbd_satuan,pbd_qty,'
      + ' pbd_stoknow,pbd_avgsale,pbd_nourut,pbd_keterangan'
      + ' ) values ('
      + Quot(Fieldbyname('pbd_pb_nomor').AsString) +','
      + Quot(Fieldbyname('pbd_brg_kode').AsString) +','
      + Quot(Fieldbyname('pbd_satuan').AsString) +','
      + FloatToStr(Fieldbyname('pbd_qty').AsFloat) +','
      + FloatToStr(Fieldbyname('pbd_stoknow').AsFloat) +','
      + FloatToStr(Fieldbyname('pbd_avgsale').AsFloat) +','
      + intToStr(Fieldbyname('pbd_nourut').AsInteger) +','
      + Quot(Fieldbyname('pbd_keterangan').AsString)  +');';


     ttt.Append(ss);

      Next;
    end;
      tsql.Free;
   end;




  end;

 
end;


procedure TfrmOmsetvsOmsetKategori.FormCreate(Sender: TObject);
begin
  with TcxExtLookupHelper(cxLookupKategori1.Properties) do
  LoadFromCDS(CDSKategori, 'Kode','Kategori',['Kode'],Self);

  with TcxExtLookupHelper(cxLookupKategori2.Properties) do
  LoadFromCDS(CDSKategori, 'Kode','Kategori',['Kode'],Self);

  with TcxExtLookupHelper(cxLookupKategori3.Properties) do
  LoadFromCDS(CDSKategori, 'Kode','Kategori',['Kode'],Self);

//  TcxDBGridHelper(cxGrdMain).LoadFromCDS(CDS, False, False);

end;

function TfrmOmsetvsOmsetKategori.GetCDSKategori: TClientDataset;
var s:String;
begin
  If not Assigned(FCDSKategori) then
  begin
    S := 'SELECT ktg_kode Kode, ktg_nama Kategori FROM tkategori WHERE ktg_tingkat = 3';

    FCDSKategori := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDSKategori;
end;

end.
