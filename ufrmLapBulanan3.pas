unit ufrmLapBulanan3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, SqlExpr,  cxGraphics,
  cxControls, dxStatusBar, te_controls, Menus, cxLookAndFeelPainters,
  cxButtons, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid ,
  Grids, BaseGrid, AdvGrid, AdvCGrid, ComCtrls, Mask, ImgList, FMTBcd,
  Provider, DB, DBClient, DBGrids, cxLookAndFeels, cxDBData,
  cxGridBandedTableView, cxGridDBTableView,
  cxGridChartView, cxCustomPivotGrid, cxDBPivotGrid, cxPC,
  cxPivotGridChartConnection, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxCommon, dxPSCore,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, AdvCombo,
  cxCurrencyEdit, cxGridDBBandedTableView, dxPScxGrid6Lnk,DateUtils, MemDS,
  DBAccess, MyAccess, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TfrmLapBulanan3 = class(TForm)
    tscrlbx1: TTeScrollBox;
    TePanel4: TTePanel;
    ilMenu: TImageList;
    TePanel1: TTePanel;
    ilToolbar: TImageList;
    TePanel2: TTePanel;
    TeLabel1: TTeLabel;
    SaveDialog1: TSaveDialog;
    TePanel3: TTePanel;
    dtstprvdr1: TDataSetProvider;
    sqlqry2: TSQLQuery;
    ds2: TDataSource;
    ds3: TClientDataSet;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxstyl1: TcxStyle;
    cxVCLPrinter: TdxComponentPrinter;
    cxVCLPrinterChart: TdxGridReportLink;
    btnRefresh: TcxButton;
    Label1: TLabel;
    TePanel5: TTePanel;
    cxButton8: TcxButton;
    cxButton7: TcxButton;
    cbbBulan: TAdvComboBox;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column8: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column9: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column10: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    Label2: TLabel;
    edtTahun: TComboBox;
    cxGrid1DBBandedTableView1Column11: TcxGridDBBandedColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxGrid1DBBandedTableView1Column12: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column13: TcxGridDBBandedColumn;
    growth: TcxGridDBBandedColumn;
    growth2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column16: TcxGridDBBandedColumn;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGrid1DBBandedTableView1Column14: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column15: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column17: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column18: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column19: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column20: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column21: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column22: TcxGridDBBandedColumn;
    sqlqry1: TMyQuery;
    Label3: TLabel;
    cxExtLookupCabang: TcxExtLookupComboBox;
    Label4: TLabel;
    ComboBox1: TComboBox;
    cxStyle5: TcxStyle;
    cxGrid1DBBandedTableView1Column23: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column24: TcxGridDBBandedColumn;
    procedure FormDblClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure sbNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure sbPrintClick(Sender: TObject);
    procedure btnTampilClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1Column10CustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column10CustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure growthCustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure growthCustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column8CustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column8CustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure
        cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems12GetText(
        Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
        AText: string);
    procedure
        cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems14GetText(
        Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
        AText: string);
    procedure TeSpeedButton1Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems8GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems9GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure growth2CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas:
        TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure growth2CustomDrawFooterCell(Sender: TcxGridTableView; ACanvas:
        TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems16GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1Column19CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column19CustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column21CustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column21CustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems19GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure
        cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems21GetText(
        Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
        AText: string);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBBandedTableView1Column20CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column22CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems13GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems15GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1Column20CustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems17GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems18GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);

  private
    flagedit : Boolean;
    fid : integer;
    fnomorjual : string ;
    FCDSPabrik: TClientDataset;    
    FPivotChartLink: TcxPivotGridChartConnection;
    xtotal,xhpp : Double;
    iskupon : Integer;
    ntotalpremium , ntotalsolar , ntotalpertamax, ntotalpertamaxplus , ntotalpenjualan : double;
    ntotaljpremium , ntotaljsolar , ntotaljpertamax, ntotaljpertamaxplus  : double;
    ntotalbayar : double;
    xhppPremium,xhppsolar,xhpppertamaxplus,xhpppertamax : double ;
    function GetPivotChartLink: TcxPivotGridChartConnection;
    function GetCDSPabrik: TClientDataset;
  public
    property CDSPabrik: TClientDataset read GetCDSPabrik write FCDSPabrik;
    procedure loaddata;
    procedure refreshdata;
    property PivotChartLink: TcxPivotGridChartConnection read GetPivotChartLink
        write FPivotChartLink;

    { Public declarations }
  end;

var

  frmLapBulanan3: TfrmLapBulanan3;

implementation
   uses Ulib, MAIN, uModuleConnection, cxgridExportlink;
{$R *.dfm}



procedure TfrmLapBulanan3.FormDblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmLapBulanan3.btnExitClick(Sender: TObject);
begin
      Release;
end;

procedure TfrmLapBulanan3.refreshdata;
begin
  edttahun.text :=  FormatDateTime('yyyy',Date);
end;

procedure TfrmLapBulanan3.sbNewClick(Sender: TObject);
begin
   refreshdata;

end;




procedure TfrmLapBulanan3.FormShow(Sender: TObject);
begin
  flagedit := False;
  refreshdata;
end;





procedure TfrmLapBulanan3.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      SelectNext(ActiveControl,True,True);

end;


procedure TfrmLapBulanan3.sbPrintClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmLapBulanan3.loaddata;
var
  ssql:string;
  afilter :string;

begin
//      ShowMessage(cxExtLookupCabang.EditValue);
      afilter := '';

      if cxExtLookupCabang.EditValue <> '00' then
      afilter := ' NOMOR like '+quot(cxExtLookupCabang.EditValue+'%')+' AND ';

      if cxExtLookupCabang.EditValue = '00' then
      afilter := ' cabang not in ("KRM","JKT") AND ';

// by nama
IF ComboBox1.ItemIndex =0 then
      ssql:= ' SELECT DISTINCT KODE,max(NAMA) Keterangan,'
+ ' Netbulanini,hppbulanini,marginbulanini,marginbulanini/Netbulanini*100 ratiobulanini,'
+ ' Netbulanlalu,hppbulanlalu,marginbulanlalu,marginbulanlalu/Netbulanlalu*100 ratiobulanlalu,'
+ ' marginbulanini/marginbulanlalu*100 growthbulanini,'
+ ' netbulanini/netbulanlalu*100 growthnetbulanini,'
+ ' Netsdbulanini,hppsdbulanini,marginsdbulanini,marginsdbulanini/Netsdbulanini*100 ratiosdbulanini,'
+ ' Netsdbulanlalu,hppsdbulanlalu,marginsdbulanlalu,marginsdbulanlalu/Netsdbulanlalu*100 ratiosdbulanlalu,'
+ ' marginsdbulanini/marginsdbulanlalu*100 growthsdbulanini,'
+ ' netsdbulanini/netsdbulanlalu*100 growthnetsdbulanini'
+ ' FROM tampung2_2024 a'
+ ' LEFT JOIN'
+ ' (SELECT KODE KODEBULANINI,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netbulanini,SUM(hpp) hppbulanini,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginbulanini FROM tampung2_2024 WHERE ' + afilter + '  bulan='+IntToStr(cbbBulan.ItemIndex+1)+' AND tahun='+edtTahun.Text+' GROUP BY kode)  bulanini ON bulanini.kodebulanini=a.kode'
+ ' LEFT JOIN'
+ ' (SELECT KODE KODEbulanlalu,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netbulanlalu,SUM(hpp) hppbulanlalu,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginbulanlalu FROM tampung2_2024 WHERE ' + afilter + '  bulan='+IntToStr(cbbBulan.ItemIndex+1)+'  AND tahun='+ IntToStr(strtoint(edtTahun.Text)-1)+' GROUP BY kode)  bulanlalu ON bulanlalu.kodebulanlalu=a.kode'
+ ' LEFT JOIN'
+ ' (SELECT KODE KODEsdbulanINI,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netsdbulanini,SUM(hpp) hppsdbulanini,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginsdbulanini FROM tampung2_2024 WHERE ' + afilter + '  bulan<='+IntToStr(cbbBulan.ItemIndex+1)+'  AND tahun='+edtTahun.Text+' GROUP BY kode)  sdbulanini ON sdbulanini.kodesdbulanini=a.kode'
+ ' LEFT JOIN'
+ ' (SELECT KODE KODEsdbulanlalu,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netsdbulanlalu,SUM(hpp) hppsdbulanlalu,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginsdbulanlalu FROM tampung2_2024 WHERE ' + afilter + '  bulan<='+IntToStr(cbbBulan.ItemIndex+1)+'  AND tahun='+ IntToStr(strtoint(edtTahun.Text)-1)+' GROUP BY kode)  sdbulanlalu ON sdbulanlalu.kodesdbulanlalu=a.kode group by kode';

IF ComboBox1.ItemIndex =1 then
      ssql:= ' SELECT DISTINCT KATEGORI Keterangan,'
+ ' Netbulanini,hppbulanini,marginbulanini,marginbulanini/Netbulanini*100 ratiobulanini,'
+ ' Netbulanlalu,hppbulanlalu,marginbulanlalu,marginbulanlalu/Netbulanlalu*100 ratiobulanlalu,'
+ ' marginbulanini/marginbulanlalu*100 growthbulanini,'
+ ' netbulanini/netbulanlalu*100 growthnetbulanini,'
+ ' Netsdbulanini,hppsdbulanini,marginsdbulanini,marginsdbulanini/Netsdbulanini*100 ratiosdbulanini,'
+ ' Netsdbulanlalu,hppsdbulanlalu,marginsdbulanlalu,marginsdbulanlalu/Netsdbulanlalu*100 ratiosdbulanlalu,'
+ ' marginsdbulanini/marginsdbulanlalu*100 growthsdbulanini,'
+ ' netsdbulanini/netsdbulanlalu*100 growthnetsdbulanini'
+ ' FROM tampung2_2024 a'
+ ' LEFT JOIN'
+ ' (SELECT KATEGORI KATEGORIBULANINI,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netbulanini,SUM(hpp) hppbulanini,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginbulanini FROM tampung2_2024 WHERE ' + afilter + '  bulan='+IntToStr(cbbBulan.ItemIndex+1)+' AND tahun='+edtTahun.Text+' GROUP BY KATEGORI)  bulanini ON bulanini.KATEGORIbulanini=a.KATEGORI'
+ ' LEFT JOIN'
+ ' (SELECT KATEGORI KATEGORIbulanlalu,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netbulanlalu,SUM(hpp) hppbulanlalu,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginbulanlalu FROM tampung2_2024 WHERE ' + afilter + '  bulan='+IntToStr(cbbBulan.ItemIndex+1)+'  AND tahun='+ IntToStr(strtoint(edtTahun.Text)-1)+' GROUP BY KATEGORI)  bulanlalu ON bulanlalu.KATEGORIbulanlalu=a.KATEGORI'
+ ' LEFT JOIN'
+ ' (SELECT KATEGORI KATEGORIsdbulanINI,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netsdbulanini,SUM(hpp) hppsdbulanini,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginsdbulanini FROM tampung2_2024 WHERE ' + afilter + '  bulan<='+IntToStr(cbbBulan.ItemIndex+1)+'  AND tahun='+edtTahun.Text+' GROUP BY KATEGORI)  sdbulanini ON sdbulanini.KATEGORIsdbulanini=a.KATEGORI'
+ ' LEFT JOIN'
+ ' (SELECT KATEGORI KATEGORIsdbulanlalu,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netsdbulanlalu,SUM(hpp) hppsdbulanlalu,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginsdbulanlalu FROM tampung2_2024 WHERE ' + afilter + '  bulan<='+IntToStr(cbbBulan.ItemIndex+1)+'  AND tahun='+ IntToStr(strtoint(edtTahun.Text)-1)+' GROUP BY KATEGORI)  sdbulanlalu ON sdbulanlalu.KATEGORIsdbulanlalu=a.KATEGORI';


IF ComboBox1.ItemIndex =2 then
      ssql:= ' SELECT DISTINCT SUBDEPARTEMEN Keterangan,'
+ ' Netbulanini,hppbulanini,marginbulanini,marginbulanini/Netbulanini*100 ratiobulanini,'
+ ' Netbulanlalu,hppbulanlalu,marginbulanlalu,marginbulanlalu/Netbulanlalu*100 ratiobulanlalu,'
+ ' marginbulanini/marginbulanlalu*100 growthbulanini,'
+ ' netbulanini/netbulanlalu*100 growthnetbulanini,'
+ ' Netsdbulanini,hppsdbulanini,marginsdbulanini,marginsdbulanini/Netsdbulanini*100 ratiosdbulanini,'
+ ' Netsdbulanlalu,hppsdbulanlalu,marginsdbulanlalu,marginsdbulanlalu/Netsdbulanlalu*100 ratiosdbulanlalu,'
+ ' marginsdbulanini/marginsdbulanlalu*100 growthsdbulanini,'
+ ' netsdbulanini/netsdbulanlalu*100 growthnetsdbulanini'
+ ' FROM tampung2_2024 a'
+ ' LEFT JOIN'
+ ' (SELECT SUBDEPARTEMEN SUBDEPARTEMENBULANINI,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netbulanini,SUM(hpp) hppbulanini,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginbulanini FROM tampung2_2024 WHERE ' + afilter + '  bulan='+IntToStr(cbbBulan.ItemIndex+1)+' AND tahun='+edtTahun.Text+' GROUP BY SUBDEPARTEMEN)  bulanini ON bulanini.SUBDEPARTEMENbulanini=a.SUBDEPARTEMEN'
+ ' LEFT JOIN'
+ ' (SELECT SUBDEPARTEMEN SUBDEPARTEMENbulanlalu,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netbulanlalu,SUM(hpp) hppbulanlalu,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginbulanlalu FROM tampung2_2024 WHERE ' + afilter + '  bulan='+IntToStr(cbbBulan.ItemIndex+1)+'  AND tahun='+ IntToStr(strtoint(edtTahun.Text)-1)+' GROUP BY SUBDEPARTEMEN)  bulanlalu ON bulanlalu.SUBDEPARTEMENbulanlalu=a.SUBDEPARTEMEN'
+ ' LEFT JOIN'
+ ' (SELECT SUBDEPARTEMEN SUBDEPARTEMENsdbulanINI,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netsdbulanini,SUM(hpp) hppsdbulanini,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginsdbulanini FROM tampung2_2024 WHERE ' + afilter + '  bulan<='+IntToStr(cbbBulan.ItemIndex+1)+'  AND tahun='+edtTahun.Text+' GROUP BY SUBDEPARTEMEN)  sdbulanini ON sdbulanini.SUBDEPARTEMENsdbulanini=a.SUBDEPARTEMEN'
+ ' LEFT JOIN'
+ ' (SELECT SUBDEPARTEMEN SUBDEPARTEMENsdbulanlalu,SUM(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) Netsdbulanlalu,SUM(hpp) hppsdbulanlalu,SUM(margin- Kontrak - Biayapromosi-Feemarketing) marginsdbulanlalu FROM tampung2_2024 WHERE ' + afilter + '  bulan<='+IntToStr(cbbBulan.ItemIndex+1)+'  AND tahun='+ IntToStr(strtoint(edtTahun.Text)-1)+' GROUP BY SUBDEPARTEMEN)  sdbulanlalu ON sdbulanlalu.SUBDEPARTEMENsdbulanlalu=a.SUBDEPARTEMEN';

           ds3.Close;
            sqlqry1.Connection := frmMenu.conn;
            sqlqry1.SQL.Text := ssql;
            ds3.open;
end;

procedure TfrmLapBulanan3.btnTampilClick(Sender: TObject);
begin
    loaddata;

end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1Column10CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 0 then
      ACanvas.font.Color := clRed

    else
      ACanvas.font.Color := clgreen;
        ACanvas.font.Style := [fsbold];
end;

procedure
    TfrmLapBulanan3.cxGrid1DBBandedTableView1Column10CustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 0 then
      ACanvas.font.Color := clRed

    else
      ACanvas.font.Color := clgreen;
      ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan3.growthCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 100 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure
    TfrmLapBulanan3.growthCustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 100 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1Column8CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if StrToFloatDef(AViewInfo.Text,0) < 0 then
      ACanvas.Font.Color := clRed
  
    else
      ACanvas.Font.Color := clGreen;
       ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1Column8CustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 0 then
      ACanvas.Font.Color := clRed
    else
      ACanvas.Font.Color := clGreen;
       ACanvas.Font.Style := [fsbold];
end;

procedure
    TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems12GetText(
    Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
    AText: string);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginbulanini')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netbulanini'))*100;
    AText := FormatFloat('###.##',capaibulanini);


  except
  end;
end;

procedure
    TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems14GetText(
    Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
    AText: string);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginsdbulanini')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginsdbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netsdbulanini'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapBulanan3.TeSpeedButton1Click(Sender: TObject);
begin

     if SaveDialog1.Execute then
     begin
       ExportGridToExcel(SaveDialog1.FileName, cxGrid1);
     end;

end;


function TfrmLapBulanan3.GetPivotChartLink: TcxPivotGridChartConnection;
begin
  If not Assigned(FPivotChartLink) then
    FPivotChartLink := TcxPivotGridChartConnection.Create(Self);
  Result := FPivotChartLink;
end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems8GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('Targetsdbulanini')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilsdbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('Targetsdbulanini'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems9GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('Targetbulanini')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('riilbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('Targetbulanini'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapBulanan3.growth2CustomDrawCell(Sender: TcxCustomGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone:
    Boolean);
begin

  if StrToFloatDef(AViewInfo.Text,0) < 100 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan3.growth2CustomDrawFooterCell(Sender: TcxGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone:
    Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 100 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems16GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginbulanini')) > 0  then
        capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginbulanlalu'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;


procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1Column19CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

  if StrToFloatDef(AViewInfo.Text,0) < 70 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];

end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1Column19CustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin

  if StrToFloatDef(AViewInfo.Text,0) < 70 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];

end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1Column21CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 0 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];


end;

procedure
    TfrmLapBulanan3.cxGrid1DBBandedTableView1Column21CustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 0 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];


end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems19GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netsdbulanini')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netsdbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netsdbulanlalu'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure
    TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems21GetText(
    Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
    AText: string);
 var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netsdbulanini')) > 0  then
        capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netsdbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netsdbulanlalu'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;


function TfrmLapBulanan3.GetCDSPabrik: TClientDataset;
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
procedure TfrmLapBulanan3.FormCreate(Sender: TObject);
begin
   with TcxExtLookupHelper(cxExtLookupCabang.Properties) do
    LoadFromCDS(CDSPabrik, 'Kode','Nama',['Kode'],Self);
end;
procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1Column20CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(AViewInfo.Text,0) < 0 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1Column22CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if StrToFloatDef(AViewInfo.Text,0) < 100 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems13GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginbulanlalu')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginbulanlalu'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netbulanlalu'))*100;
    AText := FormatFloat('###.##',capaibulanini);


  except
  end;
end;
procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems15GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginsdbulanlalu')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginsdbulanlalu'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netsdbulanlalu'))*100;
    AText := FormatFloat('###.##',capaibulanini);


  except
  end;
end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1Column20CustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
if StrToFloatDef(AViewInfo.Text,0) < 0 then
  begin
      ACanvas.Font.Color := clRed;

  end
    else
      ACanvas.Font.Color := clGreen;
        ACanvas.Font.Style := [fsbold];
end;

procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems17GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
 var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netbulanini')) > 0  then
        capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('netbulanlalu'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;
procedure TfrmLapBulanan3.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems18GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
 var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginsdbulanini')) > 0  then
        capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginsdbulanini'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('marginsdbulanlalu'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

end.


