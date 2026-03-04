unit ufrmCreatePO;

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
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, AdvEdit,
  AdvEdBtn, cxSpinEdit, cxTextEdit, cxButtonEdit, dxSkinDarkRoom,
  dxSkinFoggy, dxSkinSeven, dxSkinSharp, dxSkinsDefaultPainters, MyAccess;

type
  TfrmCreatePO = class(TfrmCxBrowse)
    cxButton5: TcxButton;
    SaveDialog1: TSaveDialog;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    Label3: TLabel;
    edtsupplier: TAdvEditBtn;
    edtNamaSupplier: TAdvEdit;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    clNo: TcxGridDBColumn;
    clSKU: TcxGridDBColumn;
    clNamaBarang: TcxGridDBColumn;
    clStok: TcxGridDBColumn;
    clSatuan: TcxGridDBColumn;
    clQtyPO: TcxGridDBColumn;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    clminstok: TcxGridDBColumn;
    clharga: TcxGridDBColumn;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure cxGrdMasterStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure edtsupplierClickBtn(Sender: TObject);
    function GetCDS: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
  private
    { Private declarations }
  protected
    FCDS: TClientDataSet;

  public
     property CDS: TClientDataSet read GetCDS write FCDS;
    { Public declarations }
  end;

var
  frmCreatePO: TfrmCreatePO;

implementation
   uses ufrmbarang,Ulib, MAIN, uModuleConnection, uFrmbantuan,ufrmpo;
{$R *.dfm}

procedure TfrmCreatePO.btnRefreshClick(Sender: TObject);
var
  tsql:TmyQuery;
  s:string;
  i:Integer;
begin
if edtsupplier.Text <> '' then
begin
  S    := ' select brg_kode Kode ,brg_nama Nama,brg_satuan Satuan,ktg_nama Kategori,'
                  + ' sup_nama Supplier ,'
                  + ' (select sum(mst_stok_in-mst_stok_out) from tmasterstok where mst_brg_kode=brg_kode) Stok ,'
                  + ' (select sum(mst_stok_in-mst_stok_out) from tmasterstok where mst_brg_kode=brg_kode and mst_gdg_kode <> "WH-10") StokTnpRepack ,'
                  + ' brg_min_stok Min ,0 QTY_PO,brg_hrgbeli'
                  + ' from tbarang '
                  + ' inner join tkategori on ktg_kode=brg_ktg_kode and brg_isaktif=1'
                  + ' inner join tgroup on gr_kode=brg_gr_kode'
                  + ' Left join tsupplier on sup_kode=brg_sup_kode'
                  + ' where brg_sup_kode='+Quot(edtsupplier.text);

   tsql := xOpenQuery(s,frmMenu.conn) ;
   try

       with  tsql do
       begin

            i:=1;
            CDS.EmptyDataSet;
            while  not Eof do
            begin
                      CDS.Append;
                      CDS.FieldByName('no').AsInteger                    := i;
                      CDS.FieldByName('SKU').AsInteger                   := fieldbyname('kode').AsInteger;
                      CDS.FieldByName('nama').AsString                   := fieldbyname('nama').AsString;
                      CDS.FieldByName('satuan').AsString                 := fieldbyname('satuan').Asstring;
                      CDS.FieldByName('StokNonRepacking').asfloat        := fieldbyname('StokTnpRepack').asfloat;
                      CDS.FieldByName('minstok').asfloat                  := fieldbyname('min').asfloat;
                      CDS.FieldByName('qtypo').AsFloat                   := 0;
                      CDS.FieldByName('harga').AsFloat                   := fieldbyname('brg_hrgbeli').asfloat;

                      CDS.Post;
                   i:=i+1;
                   next;
            end ;
        end
   finally
     tsql.Free;
   end;

end;
end;

procedure TfrmCreatePO.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;

end;

procedure TfrmCreatePO.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmCreatePO.cxGrdMasterStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  AColumn : TcxCustomGridTableItem;
  AColumn2 : TcxCustomGridTableItem;

begin
  AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('Stok');
  AColumn2 := (Sender as TcxGridDBTableView).GetColumnByFieldName('Min');

  if (AColumn <> nil)  and (ARecord <> nil) and (AItem <> nil) and
     (cVarToFloat(ARecord.Values[AColumn.Index]) <= (cVarToFloat(ARecord.Values[AColumn2.Index]))) then
    AStyle := cxStyle2;
end;

procedure TfrmCreatePO.edtsupplierClickBtn(Sender: TObject);
var
    SQLbantuan :string;
begin
sqlbantuan := 'select sup_kode , sup_nama from tsupplier ';
 Application.CreateForm(Tfrmbantuan,frmbantuan);
 frmBantuan.SQLMaster := SQLbantuan;
  frmBantuan.ShowModal;
   if varglobal <> '' then
   begin
    edtsupplier.Text := varglobal;
    edtnamasupplier.Text := varglobal1;
  end;

end;

function TfrmCreatePO.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'No', ftInteger, False);
    zAddField(FCDS, 'SKU', ftInteger, False);
    zAddField(FCDS, 'nama', ftstring, False,200);
    zAddField(FCDS, 'StokNonRepacking', ftFloat, False);
    zAddField(FCDS, 'minstok', ftFloat, False);
    zAddField(FCDS, 'Satuan', ftString, False, 10);
    zAddField(FCDS, 'qtypo', ftFloat, False);
    zAddField(FCDS, 'harga', ftFloat, False);

    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;


procedure TfrmCreatePO.FormCreate(Sender: TObject);
begin
  inherited;
     TcxDBGridHelper(cxGrdMain).LoadFromCDS(CDS, False, False);

end;

procedure TfrmCreatePO.cxButton5Click(Sender: TObject);
var
  s:string;
  anomor:String;
  tt:TStrings;
  i:Integer;
  atotal :double;
begin
  inherited;
  anomor:=frmpo.getmaxkode2;
  s:='insert into Tpo_HDR '
     + ' (po_nomor,po_tanggal,po_sup_kode) values ('
     +  QuotedStr(anomor)+','
     + QuotD(Date)+','
     + Quot(edtsupplier.Text)+')';
  // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);
   tt := TStringList.Create;
    s:= ' delete from Tpo_DTL '
      + ' where  pod_po_nomor =' + quot(anomor);
   tt.Append(s);
   CDS.First;
     i:=1;
     atotal:=0;
  while not CDS.Eof do
  begin
   if CDS.FieldByName('QTYpo').AsInteger > 0 then
   begin
    S:='insert into tpo_DTL (pod_po_nomor,pod_brg_kode,pod_brg_satuan,pod_qty,pod_harga,pod_discpr,pod_nourut) values ('
      + Quot(anomor) +','
      + IntToStr(CDS.FieldByName('SKU').AsInteger) +','
      + Quot(CDS.FieldByName('satuan').AsString) +','
      + IntToStr(CDS.FieldByName('QTYpo').AsInteger) +','
      + floattostr(CDS.FieldByName('harga').AsFloat) +',0,'
      + IntToStr(i)
      + ');';
    tt.Append(s);
     atotal:=atotal+(CDS.FieldByName('QTYpo').asfloat*CDS.FieldByName('harga').asfloat);
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
   CDS.EmptyDataSet;
   edtsupplier.Text := '';
   edtNamaSupplier.Text := '';
end;

end.
