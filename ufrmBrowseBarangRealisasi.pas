unit ufrmBrowseBarangRealisasi;

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
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TfrmBrowseBarangRealisasi = class(TfrmCxBrowse)
    PopupMenu1: TPopupMenu;
    UpdateStatusKembali1: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxButton5: TcxButton;
    lbl1: TLabel;
    cbbLookupCabang: TcxExtLookupComboBox;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
//    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxGrdMasterStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
//    procedure cxButton9Click(Sender: TObject);
function getdatabase(akode:string):string;

  private
    conn2 : TSQLConnection;
    aHost2,aDatabase2,auser2,apassword2 : string;
    FCDSCabang: TClientDataset;
    adatabase :string;
    function GetCDSCabang: TClientDataset;

    { Private declarations }
  public
    property CDSCabang: TClientDataset read GetCDSCabang write FCDSCabang;
    { Public declarations }
  end;

var
  frmBrowseBarangRealisasi: TfrmBrowseBarangRealisasi;

implementation
   uses Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowseBarangRealisasi.btnRefreshClick(Sender: TObject);
begin
   If cbbLookupCabang.Text = '' then
    begin
      ShowMessage('Cabang belum di pilih');
      Exit;
    end;

  adatabase := getdatabase(cbbLookupCabang.EditValue)+'.';
  Self.SQLMaster := ' SELECT brg_kode SKU, brg_nama NamaBarang, SUM(pbd_qty) Minta, SUM(pbd_qtyterima) Terima, SUM(pbd_qty - pbd_qtyterima) Kurang '
                  + ' FROM tbarang '
                  + ' INNER JOIN '+adatabase+'tpermintaanbarang_dtl ON pbd_brg_kode = brg_kode '
                  + ' INNER JOIN '+adatabase+'tpermintaanbarang_hdr ON pb_nomor = pbd_pb_nomor '
                  + ' WHERE pbd_qty > pbd_qtyterima AND pb_isclosed = 0 '
                  + ' GROUP BY brg_kode, brg_nama';

  Self.SQLDetail := ' SELECT pbd_pb_nomor Nomor, pbd_qty Minta, pbd_qtyterima Terima, pbd_qty - pbd_qtyterima Kurang, brg_kode SKU'
                  + ' FROM tbarang '
                  + ' INNER JOIN '+adatabase+'tpermintaanbarang_dtl ON pbd_brg_kode = brg_kode '
                  + ' INNER JOIN '+adatabase+'tpermintaanbarang_hdr ON pb_nomor = pbd_pb_nomor '
                  + ' WHERE pbd_qty > pbd_qtyterima AND pb_isclosed = 0 '
                  + ' ORDER BY brg_kode';

 Self.MasterKeyField := 'SKU';
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=200;
    cxGrdMaster.Columns[2].Width :=100;
    cxGrdMaster.Columns[3].Width :=100;
    cxGrdMaster.Columns[4].Width :=100;

    cxGrdDetail.Columns[0].Width :=100;
    cxGrdDetail.Columns[1].Width :=100;
    cxGrdDetail.Columns[2].Width :=100;
    cxGrdDetail.Columns[3].Width :=100;
    cxGrdDetail.Columns[4].Width :=100;

    cxGrdMaster.Columns[2].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[2].Summary.FooterFormat:='###,###,###,###';
    cxGrdMaster.Columns[3].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[3].Summary.FooterFormat:='###,###,###,###';
    cxGrdMaster.Columns[4].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[4].Summary.FooterFormat:='###,###,###,###';
end;

procedure TfrmBrowseBarangRealisasi.FormShow(Sender: TObject);
begin
  ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  //  btnRefreshClick(Self);
  cbbLookupCabang.EditValue := '';
  cbbLookupCabang.SetFocus;
end;

procedure TfrmBrowseBarangRealisasi.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

//procedure TfrmBrowsePermintaanBarang.cxButton3Click(Sender: TObject);
//begin
//  inherited;
//  frmPermintaanBarang.doslip(CDSMaster.FieldByname('Nomor').AsString);
//end;

procedure TfrmBrowseBarangRealisasi.cxButton4Click(Sender: TObject);
var
  s:string;
begin
  inherited;


end;

procedure TfrmBrowseBarangRealisasi.cxGrdMasterStylesGetContentStyle(
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

function TfrmBrowseBarangRealisasi.GetCDSCabang: TClientDataset;
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

procedure TfrmBrowseBarangRealisasi.FormCreate(Sender: TObject);
begin
//  inherited;
 with TcxExtLookupHelper(cbbLookupCabang.Properties) do
    LoadFromCDS(CDSCabang, 'Kode','Cabang',['Kode'],Self);
end;

function TfrmBrowseBarangRealisasi.getdatabase(akode:string):string;
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
