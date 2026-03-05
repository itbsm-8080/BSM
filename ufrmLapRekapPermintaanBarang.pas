unit ufrmLapRekapPermintaanBarang;

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
  dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FMTBcd, Provider, SqlExpr, ImgList,
  ComCtrls, StdCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, cxSpinEdit,
  cxTextEdit, cxButtonEdit, MyAccess, cxCurrencyEdit;

type
  TfrmLapRekapPermintaanBarang = class(TfrmCxBrowse)
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    clNo: TcxGridDBColumn;
    clSKU: TcxGridDBColumn;
    clNamaBarang: TcxGridDBColumn;
    clSatuan: TcxGridDBColumn;
    clStok: TcxGridDBColumn;
    clminstok: TcxGridDBColumn;
    clharga: TcxGridDBColumn;
    clQtyPO: TcxGridDBColumn;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrdMainColumn1: TcxGridDBColumn;
    cxGrdMainColumn3: TcxGridDBColumn;
    cxGrdMainColumn4: TcxGridDBColumn;
    cxGrdMainColumn5: TcxGridDBColumn;
    cxGrdMainColumn6: TcxGridDBColumn;
    cxGrdMainColumn7: TcxGridDBColumn;
    cxGrdMainColumn8: TcxGridDBColumn;
    cxGrdMainColumn9: TcxGridDBColumn;
    cxGrdMainColumn10: TcxGridDBColumn;
    cxGrdMainColumn11: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxButton5: TcxButton;
    cxGrdMainColumn2: TcxGridDBColumn;
    cxGrdMainColumn12: TcxGridDBColumn;
  procedure btnRefreshClick(Sender: TObject);
  function GetCDS: TClientDataSet;
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    function gethargabeli(akode:string):double;
    procedure cxButton7Click(Sender: TObject);
  private
    { Private declarations }
      protected
    FCDS: TClientDataSet;
  public
    property CDS: TClientDataSet read GetCDS write FCDS;
    { Public declarations }
  end;

var
  frmLapRekapPermintaanBarang: TfrmLapRekapPermintaanBarang;

implementation
   uses cxGridExportLink,ufrmCostCenter,Ulib, MAIN, uModuleConnection,ufrmpo;
{$R *.dfm}

procedure TfrmLapRekapPermintaanBarang.btnRefreshClick(Sender: TObject);
var
  s:string;
  tsql:TmyQuery;
  i:integer;
begin
//  Self.SQLMaster := 'select distinct Kode,Nama,Kode_supplier,Supplier,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode and cabang="01") Solo,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode and cabang="02") Jogja,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode and cabang="03") Madiun,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode and cabang="04") Purwokerto,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode and cabang="05") Semarang,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode and cabang="06") Surabaya,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode and cabang="07") Cirebon,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode and cabang="08") Lab,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode and cabang="10") Jakarta,'
//+ ' (select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode ) Total,'
//+ ' Stok Stok_Pusat,'
//+ ' Stok-(select sum(qty) from permintaanbarang where tanggal='+quotd(startdate.date)+' and kode=x.kode ) Sisa'
//+ ' from permintaanbarang x'
//+ ' where Tanggal='+quotd(startdate.date) ;
//
//   inherited;
//    cxGrdMaster.ApplyBestFit();
//    cxGrdMaster.Columns[0].Width :=100;
//    cxGrdMaster.Columns[1].Width :=200;
//    cxGrdMaster.Columns[4].Width :=70;
//    cxGrdMaster.Columns[5].Width :=70;
//    cxGrdMaster.Columns[6].Width :=70;
//    cxGrdMaster.Columns[7].Width :=70;
//    cxGrdMaster.Columns[8].Width :=70;
//    cxGrdMaster.Columns[9].Width :=70;
//    cxGrdMaster.Columns[10].Width :=70;
//    cxGrdMaster.Columns[11].Width :=70;
//    cxGrdMaster.Columns[12].Width :=70;
//    cxGrdMaster.Columns[13].Width :=70;
//    cxGrdMaster.Columns[14].Width :=70;
//    cxGrdMaster.Columns[15].Width :=70;
    s:= 'select distinct Kode,Nama,Kode_supplier,Supplier,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode and cabang="01") Solo,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode and cabang="02") Jogja,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode and cabang="03") Madiun,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode and cabang="04") Purwokerto,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode and cabang="05") Semarang,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode and cabang="06") Surabaya,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode and cabang="07") Cirebon,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode and cabang="08") Lab,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode and cabang="10") Jakarta,'
+ ' (select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode ) Total,'
+ ' Stok ,'
+ ' (select sum(stok) from allstokcabang where kode=x.kode) StokCabang,'
+ ' (select sum(pod_qty-pod_qty_terima) from popending where pod_brg_kode=x.kode) popending,'
+ ' Stok-(select sum(qty) from permintaanbarang where tanggal<='+quotd(startdate.date)+' and kode=x.kode ) Sisa'
+ ' from permintaanbarang x'
+ ' where Tanggal<='+quotd(startdate.date) ;

   tsql := xOpenQuery(s,frmMenu.conn) ;
   try
       i:=0;
       with  tsql do
       begin

            CDS.EmptyDataSet;
            while  not Eof do
            begin
                      CDS.Append;
                      i:=i+1;
//                      CDS.FieldByName('no').AsInteger                  := i;
                      CDS.FieldByName('kode').AsInteger                  := fieldbyname('kode').AsInteger;
                      CDS.FieldByName('nama').AsString                   := fieldbyname('nama').AsString;
                      CDS.FieldByName('kode_supplier').AsString          := fieldbyname('kode_supplier').Asstring;
                      CDS.FieldByName('supplier').AsString               := fieldbyname('supplier').Asstring;

                      CDS.FieldByName('solo').asfloat                  := fieldbyname('solo').asfloat;
                      CDS.FieldByName('Jogja').asfloat                  := fieldbyname('Jogja').asfloat;
                      CDS.FieldByName('Madiun').asfloat                  := fieldbyname('Madiun').asfloat;
                      CDS.FieldByName('Purwokerto').asfloat                  := fieldbyname('Purwokerto').asfloat;
                      CDS.FieldByName('Semarang').asfloat                  := fieldbyname('Semarang').asfloat;
                      CDS.FieldByName('Surabaya').asfloat                  := fieldbyname('Surabaya').asfloat;
                      CDS.FieldByName('Cirebon').asfloat                  := fieldbyname('Cirebon').asfloat;
                      CDS.FieldByName('Lab').asfloat                  := fieldbyname('Lab').asfloat;
                      CDS.FieldByName('Jakarta').asfloat                  := fieldbyname('Jakarta').asfloat;
                      CDS.FieldByName('Total').asfloat                  := fieldbyname('Total').asfloat;
                      CDS.FieldByName('Stok').asfloat                  := fieldbyname('Stok').asfloat;
                      CDS.FieldByName('Stokcabang').asfloat                  := fieldbyname('Stokcabang').asfloat;
                      CDS.FieldByName('popending').asfloat                  := fieldbyname('popending').asfloat;
                      CDS.FieldByName('sisa').asfloat                  := fieldbyname('sisa').asfloat;
                      CDS.FieldByName('order').AsFloat                   := 0;


                      CDS.Post;

                   next;
            end ;
        end
   finally
     tsql.Free;
   end;


end;


function TfrmLapRekapPermintaanBarang.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'No', ftInteger, False);
    zAddField(FCDS, 'Kode', ftInteger, False);
    zAddField(FCDS, 'nama', ftstring, False,200);
    zAddField(FCDS, 'Kode_Supplier', ftstring, False,20);
    zAddField(FCDS, 'Supplier', ftstring, False,200);
    zAddField(FCDS, 'Solo', ftFloat, False);
    zAddField(FCDS, 'Jogja', ftFloat, False);
    zAddField(FCDS, 'Madiun', ftFloat, False);
    zAddField(FCDS, 'Purwokerto', ftFloat, False);
    zAddField(FCDS, 'Semarang', ftFloat, False);
    zAddField(FCDS, 'Surabaya', ftFloat, False);
    zAddField(FCDS, 'Cirebon', ftFloat, False);
    zAddField(FCDS, 'Lab', ftFloat, False);
    zAddField(FCDS, 'Jakarta', ftFloat, False);
    zAddField(FCDS, 'Total', ftFloat, False);
    zAddField(FCDS, 'Stok', ftFloat, False);
    zAddField(FCDS, 'Stokcabang', ftFloat, False);
    zAddField(FCDS, 'popending', ftFloat, False);    
    zAddField(FCDS, 'Sisa', ftFloat, False);
    zAddField(FCDS, 'order', ftFloat, False);



    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;
procedure TfrmLapRekapPermintaanBarang.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmLapRekapPermintaanBarang.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmLapRekapPermintaanBarang.FormCreate(Sender: TObject);
begin
  inherited;
  TcxDBGridHelper(cxGrdMain).LoadFromCDS(CDS, False, False);
end;

procedure TfrmLapRekapPermintaanBarang.cxButton5Click(Sender: TObject);

var
  s:string;
  anomor:String;
  tt:TStrings;
  i:Integer;
  ahargabeli,atotal :double;
  aistax: Integer;
begin
  inherited;
  aistax := 1;
//  showmessage(CDS.FieldByName('kode_supplier').AsString);

  if MessageDlg('Ingin membuat PO dengan pajak ?',mtCustom,
                              [mbYes,mbNo], 0)= mrNo
  then aistax := 0 ;

  anomor:=frmpo.getmaxkode2;
  s:='insert into Tpo_HDR '
     + ' (po_nomor,po_tanggal,po_istax,po_sup_kode) values ('
     +  QuotedStr(anomor)+','
     + QuotD(Date)+','
     + Quot(IntToStr(aistax))+','
     + Quot(CDS.FieldByName('kode_supplier').AsString)+')';
  // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);
   tt := TStringList.Create;
    s:= ' delete from Tpo_DTL '
      + ' where  pod_po_nomor =' + quot(anomor);
   tt.Append(s);
      CDS.Filter := cxGrdMain.DataController.Filter.FilterText;
      CDS.Filtered := True;

   CDS.First;

     i:=1;
     atotal:=0;
  while not CDS.Eof do
  begin
   if CDS.FieldByName('order').AsInteger > 0 then
   begin
     ahargabeli:=gethargabeli(CDS.FieldByName('kode').AsString);
    S:='insert into tpo_DTL (pod_po_nomor,pod_brg_kode,pod_brg_satuan,pod_qty,pod_harga,pod_discpr,pod_nourut) values ('
      + Quot(anomor) +','
      + IntToStr(CDS.FieldByName('kode').AsInteger) +','
      + Quot(getnama('tbarang','brg_kode',CDS.FieldByName('kode').AsString,'brg_satuan')) +','
      + IntToStr(CDS.FieldByName('order').AsInteger) +','
      + floattostr(ahargabeli) +',0,'
      + IntToStr(i)
      + ');';
    tt.Append(s);
     atotal:=atotal+(CDS.FieldByName('order').asfloat*ahargabeli);
    Inc(i);
    end;
    CDS.Next;
  end;
    s:='update tpo_hdr set po_amount='+floattostr(atotal*1.11)
    + ' ,po_taxamount='+floattostr(0.11*(atotal))
    + ' where po_nomor ='+ Quot(anomor);
    tt.append(s);
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

if ActiveMDIChild.Caption <> 'PO' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmPO  := frmmenu.ShowForm(TfrmPO) as TfrmPO;
      frmPO.ID := anomor;
      frmPO.FLAGEDIT := True;
      frmPO.edtnOMOR.Text := anomor;
      frmPO.loaddataALL(anomor);
   end;
   frmPO.Show;
end;

function TfrmLapRekapPermintaanBarang.gethargabeli(akode:string):double;
var
  s:string;
  tsql:TmyQuery;
begin
  s:='select brg_hrgbeli from tbarang where brg_kode='+Quot(akode);
  try
      tsql:=xOpenQuery(s,frmMenu.conn);
      if not tsql.Eof then
      Result :=tsql.Fields[0].AsFloat
      else
      Result:=0;
  finally
    tsql.free;
  end;
end;

procedure TfrmLapRekapPermintaanBarang.cxButton7Click(Sender: TObject);
begin
  if SaveDlg.Execute then
    ExportGridToExcel(SaveDlg.FileName, cxGrid1,True,True,True);

  cxGrdMain.DataController.CollapseDetails;

end;

end.
