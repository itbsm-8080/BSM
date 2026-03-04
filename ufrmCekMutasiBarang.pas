unit ufrmCekMutasiBarang;

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
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, AdvCombo, MyAccess;

type
  TfrmCekMutasiBarang = class(TfrmCxBrowse)
    PopupMenu1: TPopupMenu;
    LihatFakturPenjualan1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    cxLookupCabangTujuan: TcxExtLookupComboBox;
    cxLookupCabangAsal: TcxExtLookupComboBox;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCDSCabang: TClientDataset;
    function GetCDSCabang: TClientDataset;
    { Private declarations }
  public
    property CDSCabang: TClientDataset read GetCDSCabang write FCDSCabang;
    { Public declarations }
  end;

var
  frmCekMutasiBarang: TfrmCekMutasiBarang;

implementation
   uses Ulib, MAIN, uModuleConnection,ufrmPembayaranLain,
  ufrmBayarSupplier;
{$R *.dfm}

procedure TfrmCekMutasiBarang.btnRefreshClick(Sender: TObject);
var
  s:string;
  tsql,tsql2:TmyQuery;
  adatabaseasal,adatabasetujuan : string;
begin
 s:= 'select cbg_database from tcabang where cbg_kode= '+ Quot(cxLookupCabangAsal.EditValue);
 tsql := xOpenQuery(s,frmMenu.conn);
 with tsql do
 begin
   try
      adatabaseasal := Fields[0].AsString;
   finally
     Free
   end;
 end;
 s:= 'select cbg_database from tcabang where cbg_kode= '+ Quot(cxLookupCabangTujuan.EditValue);
 tsql := xOpenQuery(s,frmMenu.conn);
 with tsql do
 begin
   try
      adatabasetujuan := Fields[0].AsString;
   finally
     Free
   end;
 end;

 Self.SQLMaster :='SELECT mutc_nomor nomor,mutc_tanggal,mutci_nomormutasi,mutc_keterangan,if(mutci_nomormutasi<>"","Sudah","Belum") Status '
                + ' FROM '+adatabaseasal+'.tmutcab_hdr A '
                + ' LEFT JOIN '
                +  adatabasetujuan+'.tmutcabin_hdr B ON mutc_nomor=mutci_nomormutasi '
                + ' WHERE A.mutc_cbg_asal='+ Quot(cxLookupCabangAsal.EditValue)
                + ' AND A.mutc_cbg_tujuan='+ Quot(cxLookupCabangTujuan.EditValue)
                + ' and mutc_tanggal between '+quotd(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
                + ' order by mutc_nomor ';
   Self.SQLDetail := 'select mutcd_mutc_nomor Nomor,mutcd_brg_kode Kode,brg_nama Nama,mutcd_qty,mutcd_expired,mutcd_gdg_kode from '+adatabaseasal+'.tmutcab_hdr'
                    + ' inner join '+adatabaseasal+'.tmutcab_dtl on mutc_nomor=mutcd_mutc_nomor'
                    + ' inner join '+adatabaseasal+'.tbarang  on  brg_kode=mutcd_brg_kode'
                    + ' where '
                    + ' mutc_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
                    + ' order by mutcd_mutc_nomor ';
 Self.MasterKeyField := 'Nomor';



  inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=100;

end;

procedure TfrmCekMutasiBarang.FormShow(Sender: TObject);
begin
  ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  startdate.DateTime :=  date;
  enddate.DateTime := date;

end;

procedure TfrmCekMutasiBarang.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;


procedure TfrmCekMutasiBarang.FormCreate(Sender: TObject);
begin
  inherited;
 with TcxExtLookupHelper(cxLookupCabangTujuan.Properties) do
    LoadFromCDS(CDSCabang, 'Kode','Cabang',['Kode'],Self);
  with TcxExtLookupHelper(cxLookupCabangAsal.Properties) do
    LoadFromCDS(CDSCabang, 'Kode','Cabang',['Kode'],Self);

end;
function TfrmCekMutasiBarang.GetCDSCabang: TClientDataset;
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


end.
