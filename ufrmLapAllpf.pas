unit ufrmLapAllPf;

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
  cxCurrencyEdit, cxGridDBBandedTableView, dxPScxGrid6Lnk, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, AdvEdit,DateUtils, MyAccess, MemDS, DBAccess;

type
  TfrmLapAllPf = class(TForm)
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
    sqlqry4: TSQLQuery;
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
    Label2: TLabel;
    edtTahun: TComboBox;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGroup: TcxGridDBBandedColumn;
    cxHNA: TcxGridDBBandedColumn;
    cxTarget: TcxGridDBBandedColumn;
    cxCapai: TcxGridDBBandedColumn;
    cxTotalTarget: TcxGridDBBandedColumn;
    cxTotalCapai: TcxGridDBBandedColumn;
    cxPresentaseSolo: TcxGridDBBandedColumn;
    cxPresentaseKRM: TcxGridDBBandedColumn;
    cxTargetKRM: TcxGridDBBandedColumn;
    cxCapaiKRM: TcxGridDBBandedColumn;
    cxTotalTargetKRM: TcxGridDBBandedColumn;
    cxTotalCapaiKRM: TcxGridDBBandedColumn;
    cxtargetjogja: TcxGridDBBandedColumn;
    cxcapaijogja: TcxGridDBBandedColumn;
    cxtotaltargetjogja: TcxGridDBBandedColumn;
    cxtotalcapaijogja: TcxGridDBBandedColumn;
    cxratiojogja: TcxGridDBBandedColumn;
    cxtargetmadiun: TcxGridDBBandedColumn;
    cxcapaimadiun: TcxGridDBBandedColumn;
    cxtotaltargetmadiun: TcxGridDBBandedColumn;
    cxtotalcapaimadiun: TcxGridDBBandedColumn;
    cxratiomadiun: TcxGridDBBandedColumn;
    cxtargetpw: TcxGridDBBandedColumn;
    cxcapaipw: TcxGridDBBandedColumn;
    cxtotaltargetpw: TcxGridDBBandedColumn;
    cxtotalcapaipw: TcxGridDBBandedColumn;
    cxratiopw: TcxGridDBBandedColumn;
    cxtargetall: TcxGridDBBandedColumn;
    cxcapaiall: TcxGridDBBandedColumn;
    cxtotaltargetall: TcxGridDBBandedColumn;
    cxtotalcapaiall: TcxGridDBBandedColumn;
    cxratioall: TcxGridDBBandedColumn;
    clStokSolo: TcxGridDBBandedColumn;
    clStokKrm: TcxGridDBBandedColumn;
    clStokJogja: TcxGridDBBandedColumn;
    clStokMadiun: TcxGridDBBandedColumn;
    clStokPwkt: TcxGridDBBandedColumn;
    clTotalStok: TcxGridDBBandedColumn;
    clTargetsm: TcxGridDBBandedColumn;
    clCapaism: TcxGridDBBandedColumn;
    clTotalTargetsm: TcxGridDBBandedColumn;
    clTotalCapaism: TcxGridDBBandedColumn;
    clratiosm: TcxGridDBBandedColumn;
    clStoksm: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    SQLQuery3: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    SQLQuery4: TSQLQuery;
    DataSetProvider2: TDataSetProvider;
    sqlqry1: TMyQuery;
    SQLQuery1: TMyQuery;
    SQLQuery2: TMyQuery;
    procedure FormDblClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure sbNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure sbPrintClick(Sender: TObject);
    procedure btnTampilClick(Sender: TObject);
    procedure cxPresentaseKRMCustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxPresentaseKRMCustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxPresentaseSoloCustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxPresentaseSoloCustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column8CustomDrawCell(Sender:
        TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1Column8CustomDrawFooterCell(Sender:
        TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
        TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure
        cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems11GetText(
        Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
        AText: string);
    procedure TeSpeedButton1Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems8GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems3GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems9GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems15GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems16GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems26GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);

  private

    flagedit : Boolean;
    fid : integer;
    fnomorjual : string ;
    FPivotChartLink: TcxPivotGridChartConnection;
    xtotal,xhpp : Double;
    iskupon : Integer;
    ntotalpremium , ntotalsolar , ntotalpertamax, ntotalpertamaxplus , ntotalpenjualan : double;
    ntotaljpremium , ntotaljsolar , ntotaljpertamax, ntotaljpertamaxplus  : double;
    ntotalbayar : double;
    xhppPremium,xhppsolar,xhpppertamaxplus,xhpppertamax : double ;

    function GetPivotChartLink: TcxPivotGridChartConnection;
  public

    procedure loaddata;
    procedure refreshdata;

    property PivotChartLink: TcxPivotGridChartConnection read GetPivotChartLink
        write FPivotChartLink;

    { Public declarations }
  end;

var

  frmLapAllPf: TfrmLapAllPf;

implementation
   uses Ulib, MAIN, uModuleConnection, cxgridExportlink;
{$R *.dfm}



procedure TfrmLapAllPf.FormDblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmLapAllPf.btnExitClick(Sender: TObject);
begin
      Release;
end;

procedure TfrmLapAllPf.refreshdata;
begin
  edttahun.text :=  FormatDateTime('yyyy',Date);
end;

procedure TfrmLapAllPf.sbNewClick(Sender: TObject);
begin
   refreshdata;

end;




procedure TfrmLapAllPf.FormShow(Sender: TObject);
begin
  flagedit := False;
  refreshdata;
end;





procedure TfrmLapAllPf.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      SelectNext(ActiveControl,True,True);

end;


procedure TfrmLapAllPf.sbPrintClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmLapAllPf.loaddata;
var
  ssql:string;
  tsql : TmyQuery;
  akhir : TDateTime;
begin
  akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex +1)+'/01/'+edttahun.Text));

 ssql:='SELECT Cabang,trim(Grup) Grup,HNA,'
+ ' (SELECT SUM(mst_stok_in-mst_stok_out) FROM bsmcabang.tbarangpf'
+ ' inner join bsmcabang.tmasterstok on mst_brg_kode=bpf_brg_kode AND'
+ ' bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND bpf_tahun='+ edttahun.text
+ ' WHERE bpf_grup=Grup AND mst_tanggal<='+quotd(akhir)
+ ' GROUP BY bpf_grup) StokSolo,'
+ ' Target targetsolo,Total Totaltargetsolo,Jual,Retur,Jual-retur Capaisolo,(Jual-retur)*hna totalcapaisolo,(Jual-retur )/target*100 ratiosolo ,'
+ ' cast(0 as decimal) stokjogja,cast(0 as decimal) targetjogja,cast(0 as decimal) capaijogja,cast(0 as decimal) totaltargetjogja,cast(0 as decimal) totalcapaijogja,cast(0 as decimal) ratiojogja,'
+ ' cast(0 as decimal) stokkrm,cast(0 as decimal) targetkrm,cast(0 as decimal) capaikrm,cast(0 as decimal) totaltargetkrm,cast(0 as decimal) totalcapaikrm,cast(0 as decimal) ratiokrm,'
+ ' cast(0 as decimal) stokmadiun,cast(0 as decimal) targetmadiun,cast(0 as decimal) capaimadiun,cast(0 as decimal) totaltargetmadiun,cast(0 as decimal) totalcapaimadiun,cast(0 as decimal) ratiomadiun,'
+ ' cast(0 as decimal) stokpwkt,cast(0 as decimal) targetpw,cast(0 as decimal) capaipw,cast(0 as decimal) totaltargetpw,cast(0 as decimal) totalcapaipw,cast(0 as decimal) ratiopw,'
+ ' cast(0 as decimal) stoksmg,cast(0 as decimal) targetsmg,cast(0 as decimal) capaismg,cast(0 as decimal) totaltargetsmg,cast(0 as decimal) totalcapaismg,cast(0 as decimal) ratiosmg,'
+ ' cast(0 as decimal) stokall,cast(0 as decimal) targetall,cast(0 as decimal) capaiall,cast(0 as decimal) totaltargetall,cast(0 as decimal) totalcapaiall,cast(0 as decimal) ratioall'
+ ' FROM ('
+ ' SELECT "SOLO" Cabang,tgrouppf.nama_grouppf Grup, tm_hna HNA,SUM(tm_target) Target,SUM(tm_target)*tm_hna Total,'
+ ' (SELECT ifnull(SUM(retjd_qty),0) FROM bsmcabang.tretj_dtl INNER JOIN bsmcabang.tbarangpf ON bpf_brg_kode=retjd_brg_kode'
+ ' and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun= '+ edttahun.text
+ ' INNER JOIN bsmcabang.tretj_hdr ON retj_nomor=retjd_retj_nomor  AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE bpf_kode_grouppf=tm_grouppf'
+ ' ) retur,'
+ ' (SELECT ifnull(SUM(fpd_qty),0) FROM bsmcabang.tfp_dtl INNER JOIN bsmcabang.tbarangpf ON bpf_brg_kode=fpd_brg_kode and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' INNER JOIN bsmcabang.tfp_hdr ON fp_nomor=fpd_fp_nomor  AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ '  WHERE  bpf_kode_grouppf=tm_grouppf'
+ '  ) jual'
+ '  FROM bsmcabang.ttargetmarketing'
+ ' INNER JOIN bsmcabang.tgrouppf ON kode_grouppf=tm_grouppf'
+ ' WHERE tm_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND tm_tahun='+ edttahun.text
+ ' GROUP BY tm_grouppf) final ';
            ds3.Close;
            sqlqry1.Connection := frmMenu.conn;
            sqlqry1.SQL.Text := ssql;
            ds3.open;



   ssql:='SELECT Cabang,Grup,HNA,'
+ ' (SELECT SUM(mst_stok_in-mst_stok_out) FROM bsmcabang2.tbarangpf'
+ ' inner join bsmcabang2.tmasterstok on mst_brg_kode=bpf_brg_kode AND'
+ ' bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND bpf_tahun='+ edttahun.text
+ ' WHERE bpf_grup=Grup AND mst_tanggal<='+quotd(akhir)
+ ' GROUP BY bpf_grup) StokJogja,'
+ ' Target targetjogja,Total Totaltargetjogja,Jual,Retur,Jual-retur Capaijogja,(Jual-retur)*hna totalcapaijogja,(Jual-retur )/target*100 ratiojogja FROM ('
+ ' SELECT "SOLO" Cabang,tgrouppf.nama_grouppf Grup, tm_hna HNA,SUM(tm_target) Target,SUM(tm_target)*tm_hna Total,'
+ ' (SELECT ifnull(SUM(retjd_qty),0) FROM bsmcabang2.tretj_dtl INNER JOIN bsmcabang2.tbarangpf ON bpf_brg_kode=retjd_brg_kode'
+ ' and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun= '+ edttahun.text
+ ' INNER JOIN bsmcabang2.tretj_hdr ON retj_nomor=retjd_retj_nomor  AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang2.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE bpf_kode_grouppf=tm_grouppf'
+ ' ) retur,'
+ ' (SELECT ifnull(SUM(fpd_qty),0) FROM bsmcabang2.tfp_dtl INNER JOIN bsmcabang2.tbarangpf ON bpf_brg_kode=fpd_brg_kode and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' INNER JOIN bsmcabang2.tfp_hdr ON fp_nomor=fpd_fp_nomor  AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang2.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ '  WHERE  bpf_kode_grouppf=tm_grouppf'
+ '  ) jual'
+ '  FROM bsmcabang2.ttargetmarketing'
+ ' INNER JOIN bsmcabang2.tgrouppf ON kode_grouppf=tm_grouppf'
+ ' WHERE tm_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND tm_tahun='+ edttahun.text
+ ' GROUP BY tm_grouppf) final ';
tsql:=xOpenQuery(ssql,frmMenu.conn);
with tsql do
begin
  try
    while not eof do
    begin
             if ds3.Locate('GRUP',Trim(FieldByName('GRUP').AsString),[loCaseInsensitive]) then
             begin

               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targetjogja').AsFloat := FieldByName('targetjogja').AsFloat;
                ds3.FieldByName('capaijogja').AsFloat := FieldByName('capaijogja').AsFloat;
                ds3.FieldByName('totaltargetjogja').AsFloat := FieldByName('totaltargetjogja').AsFloat;
                ds3.FieldByName('totalcapaijogja').AsFloat := FieldByName('totalcapaijogja').AsFloat;
                ds3.FieldByName('ratiojogja').AsFloat := FieldByName('ratiojogja').AsFloat;
                ds3.FieldByName('stokjogja').AsFloat := FieldByName('stokjogja').AsFloat;


             end;
         Next;
    end;
  finally
    free;
  end;
end;


   ssql:='SELECT Cabang,Grup,HNA,'
+ ' (SELECT SUM(mst_stok_in-mst_stok_out) FROM krm.tbarangpf'
+ ' inner join krm.tmasterstok on mst_brg_kode=bpf_brg_kode AND'
+ ' bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND bpf_tahun='+ edttahun.text
+ ' WHERE bpf_grup=Grup AND mst_tanggal<='+quotd(akhir)
+ ' GROUP BY bpf_grup) StokKrm,'
+ ' Target targetkrm,Total Totaltargetkrm,Jual,Retur,Jual-retur Capaikrm,(Jual-retur)*hna totalcapaikrm,(Jual-retur )/target*100 ratiokrm FROM ('
+ ' SELECT "SOLO" Cabang,tgrouppf.nama_grouppf Grup, tm_hna HNA,SUM(tm_target) Target,SUM(tm_target)*tm_hna Total,'
+ ' (SELECT ifnull(SUM(retjd_qty),0) FROM krm.tretj_dtl INNER JOIN krm.tbarangpf ON bpf_brg_kode=retjd_brg_kode'
+ ' and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun= '+ edttahun.text
+ ' INNER JOIN krm.tretj_hdr ON retj_nomor=retjd_retj_nomor  AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text
+ ' INNER JOIN krm.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE bpf_kode_grouppf=tm_grouppf'
+ ' ) retur,'
+ ' (SELECT ifnull(SUM(fpd_qty),0) FROM krm.tfp_dtl INNER JOIN krm.tbarangpf ON bpf_brg_kode=fpd_brg_kode and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' INNER JOIN krm.tfp_hdr ON fp_nomor=fpd_fp_nomor  AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text
+ ' INNER JOIN krm.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ '  WHERE  bpf_kode_grouppf=tm_grouppf'
+ '  ) jual'
+ '  FROM krm.ttargetmarketing'
+ ' INNER JOIN krm.tgrouppf ON kode_grouppf=tm_grouppf'
+ ' WHERE tm_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND tm_tahun='+ edttahun.text
+ ' GROUP BY tm_grouppf) final ';
tsql:=xOpenQuery(ssql,frmMenu.conn);
with tsql do
begin
  try
    while not eof do
    begin
             if ds3.Locate('GRUP',trim(FieldByName('GRUP').AsString),[loCaseInsensitive]) then
             begin

               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targetkrm').AsFloat := FieldByName('targetkrm').AsFloat;
                ds3.FieldByName('capaikrm').AsFloat := FieldByName('capaikrm').AsFloat;
                ds3.FieldByName('totaltargetkrm').AsFloat := FieldByName('totaltargetkrm').AsFloat;
                ds3.FieldByName('totalcapaikrm').AsFloat := FieldByName('totalcapaikrm').AsFloat;
                ds3.FieldByName('ratiokrm').AsFloat := FieldByName('ratiokrm').AsFloat;
                ds3.FieldByName('stokkrm').AsFloat := FieldByName('stokkrm').AsFloat;

             end;
         Next;
    end;
  finally
    free;
  end;
end;
   ssql:='SELECT Cabang,Grup,HNA,'
+ ' (SELECT SUM(mst_stok_in-mst_stok_out) FROM bsmcabang3.tbarangpf'
+ ' inner join bsmcabang3.tmasterstok on mst_brg_kode=bpf_brg_kode AND'
+ ' bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND bpf_tahun='+ edttahun.text
+ ' WHERE bpf_grup=Grup AND mst_tanggal<='+quotd(akhir)
+ ' GROUP BY bpf_grup) StokMadiun,'
+ ' Target targetmadiun,Total Totaltargetmadiun,Jual,Retur,Jual-retur Capaimadiun,(Jual-retur)*hna totalcapaimadiun,(Jual-retur )/target*100 ratiomadiun FROM ('
+ ' SELECT "SOLO" Cabang,tgrouppf.nama_grouppf Grup, tm_hna HNA,SUM(tm_target) Target,SUM(tm_target)*tm_hna Total,'
+ ' (SELECT ifnull(SUM(retjd_qty),0) FROM bsmcabang3.tretj_dtl INNER JOIN bsmcabang3.tbarangpf ON bpf_brg_kode=retjd_brg_kode'
+ ' and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun= '+ edttahun.text
+ ' INNER JOIN bsmcabang3.tretj_hdr ON retj_nomor=retjd_retj_nomor  AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang3.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE bpf_kode_grouppf=tm_grouppf'
+ ' ) retur,'
+ ' (SELECT ifnull(SUM(fpd_qty),0) FROM bsmcabang3.tfp_dtl INNER JOIN bsmcabang3.tbarangpf ON bpf_brg_kode=fpd_brg_kode and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' INNER JOIN bsmcabang3.tfp_hdr ON fp_nomor=fpd_fp_nomor  AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang3.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ '  WHERE  bpf_kode_grouppf=tm_grouppf'
+ '  ) jual'
+ '  FROM bsmcabang3.ttargetmarketing'
+ ' INNER JOIN bsmcabang3.tgrouppf ON kode_grouppf=tm_grouppf'
+ ' WHERE tm_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND tm_tahun='+ edttahun.text
+ ' GROUP BY tm_grouppf) final ';
tsql:=xOpenQuery(ssql,frmMenu.conn);
with tsql do
begin
  try
    while not eof do
    begin
             if ds3.Locate('GRUP',Trim(FieldByName('GRUP').AsString),[loCaseInsensitive]) then
             begin

               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targetmadiun').AsFloat := FieldByName('targetmadiun').AsFloat;
                ds3.FieldByName('capaimadiun').AsFloat := FieldByName('capaimadiun').AsFloat;
                ds3.FieldByName('totaltargetmadiun').AsFloat := FieldByName('totaltargetmadiun').AsFloat;
                ds3.FieldByName('totalcapaimadiun').AsFloat := FieldByName('totalcapaimadiun').AsFloat;
                ds3.FieldByName('ratiomadiun').AsFloat := FieldByName('ratiomadiun').AsFloat;
                ds3.FieldByName('stokmadiun').AsFloat := FieldByName('stokmadiun').AsFloat;

             end;
         Next;
    end;
  finally
    free;
  end;
end;

   ssql:='SELECT Cabang,Grup,HNA,'
+ ' (SELECT SUM(mst_stok_in-mst_stok_out) FROM bsmcabang4.tbarangpf'
+ ' inner join bsmcabang4.tmasterstok on mst_brg_kode=bpf_brg_kode AND'
+ ' bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND bpf_tahun='+ edttahun.text
+ ' WHERE bpf_grup=Grup AND mst_tanggal<='+quotd(akhir)
+ ' GROUP BY bpf_grup) StokPwkt,'
+ ' Target targetpw,Total Totaltargetpw,Jual,Retur,Jual-retur Capaipw,(Jual-retur)*hna totalcapaipw,(Jual-retur )/target*100 ratiopw FROM ('
+ ' SELECT "SOLO" Cabang,tgrouppf.nama_grouppf Grup, tm_hna HNA,SUM(tm_target) Target,SUM(tm_target)*tm_hna Total,'
+ ' (SELECT ifnull(SUM(retjd_qty),0) FROM bsmcabang4.tretj_dtl INNER JOIN bsmcabang4.tbarangpf ON bpf_brg_kode=retjd_brg_kode'
+ ' and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun= '+ edttahun.text
+ ' INNER JOIN bsmcabang4.tretj_hdr ON retj_nomor=retjd_retj_nomor  AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang4.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE bpf_kode_grouppf=tm_grouppf'
+ ' ) retur,'
+ ' (SELECT ifnull(SUM(fpd_qty),0) FROM bsmcabang4.tfp_dtl INNER JOIN bsmcabang4.tbarangpf ON bpf_brg_kode=fpd_brg_kode and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' INNER JOIN bsmcabang4.tfp_hdr ON fp_nomor=fpd_fp_nomor  AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang4.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ '  WHERE  bpf_kode_grouppf=tm_grouppf'
+ '  ) jual'
+ '  FROM bsmcabang4.ttargetmarketing'
+ ' INNER JOIN bsmcabang4.tgrouppf ON kode_grouppf=tm_grouppf'
+ ' WHERE tm_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND tm_tahun='+ edttahun.text
+ ' GROUP BY tm_grouppf) final ';
tsql:=xOpenQuery(ssql,frmMenu.conn);
with tsql do
begin
  try
    while not eof do
    begin
             if ds3.Locate('GRUP',trim(FieldByName('GRUP').AsString),[loCaseInsensitive]) then
             begin

               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targetpw').AsFloat := FieldByName('targetpw').AsFloat;
                ds3.FieldByName('capaipw').AsFloat := FieldByName('capaipw').AsFloat;
                ds3.FieldByName('totaltargetpw').AsFloat := FieldByName('totaltargetpw').AsFloat;
                ds3.FieldByName('totalcapaipw').AsFloat := FieldByName('totalcapaipw').AsFloat;
                ds3.FieldByName('ratiopw').AsFloat := FieldByName('ratiopw').AsFloat;
                ds3.FieldByName('stokpwkt').AsFloat := FieldByName('stokpwkt').AsFloat;

             end;
         Next;
    end;
  finally
    free;
  end;
end;

   ssql:='SELECT Cabang,Grup,HNA,'
+ ' (SELECT SUM(mst_stok_in-mst_stok_out) FROM bsmcabang5.tbarangpf'
+ ' inner join bsmcabang5.tmasterstok on mst_brg_kode=bpf_brg_kode AND'
+ ' bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND bpf_tahun='+ edttahun.text
+ ' WHERE bpf_grup=Grup AND mst_tanggal<='+quotd(akhir)
+ ' GROUP BY bpf_grup) StokSMG,'
+ ' Target targetsmg,Total Totaltargetsmg,Jual,Retur,Jual-retur Capaismg,(Jual-retur)*hna totalcapaismg,(Jual-retur )/target*100 ratiosmg FROM ('
+ ' SELECT "Semarang" Cabang,tgrouppf.nama_grouppf Grup, tm_hna HNA,SUM(tm_target) Target,SUM(tm_target)*tm_hna Total,'
+ ' (SELECT ifnull(SUM(retjd_qty),0) FROM bsmcabang5.tretj_dtl INNER JOIN bsmcabang5.tbarangpf ON bpf_brg_kode=retjd_brg_kode'
+ ' and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun= '+ edttahun.text
+ ' INNER JOIN bsmcabang5.tretj_hdr ON retj_nomor=retjd_retj_nomor  AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang5.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE bpf_kode_grouppf=tm_grouppf'
+ ' ) retur,'
+ ' (SELECT ifnull(SUM(fpd_qty),0) FROM bsmcabang5.tfp_dtl INNER JOIN bsmcabang5.tbarangpf ON bpf_brg_kode=fpd_brg_kode and bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' INNER JOIN bsmcabang5.tfp_hdr ON fp_nomor=fpd_fp_nomor  AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text
+ ' INNER JOIN bsmcabang5.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ '  WHERE  bpf_kode_grouppf=tm_grouppf'
+ '  ) jual'
+ '  FROM bsmcabang5.ttargetmarketing'
+ ' INNER JOIN bsmcabang5.tgrouppf ON kode_grouppf=tm_grouppf'
+ ' WHERE tm_periode='+inttostr(cbbBulan.ItemIndex+1)+' AND tm_tahun='+ edttahun.text
+ ' GROUP BY tm_grouppf) final ';
tsql:=xOpenQuery(ssql,frmMenu.conn);
with tsql do
begin
  try
    while not eof do
    begin
             if ds3.Locate('GRUP',trim(FieldByName('GRUP').AsString),[loCaseInsensitive]) then
             begin

               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targetsmg').AsFloat := FieldByName('targetsmg').AsFloat;
                ds3.FieldByName('capaismg').AsFloat := FieldByName('capaismg').AsFloat;
                ds3.FieldByName('totaltargetsmg').AsFloat := FieldByName('totaltargetsmg').AsFloat;
                ds3.FieldByName('totalcapaismg').AsFloat := FieldByName('totalcapaismg').AsFloat;
                ds3.FieldByName('ratiosmg').AsFloat := FieldByName('ratiosmg').AsFloat;
                ds3.FieldByName('stoksmg').AsFloat := FieldByName('stoksmg').AsFloat;

             end;
         Next;
    end;
  finally
    free;
  end;
end;

ds3.First;
while not ds3.Eof do
begin
               If ds3.State <> dsEdit then ds3.Edit;
                ds3.FieldByName('targetall').AsFloat := ds3.fieldByName('targetsolo').AsFloat+ds3.fieldByName('targetkrm').AsFloat+ds3.fieldByName('targetjogja').AsFloat+ds3.fieldByName('targetmadiun').AsFloat+ds3.fieldByName('targetpw').AsFloat+ds3.fieldByName('targetsmg').AsFloat;
                ds3.FieldByName('capaiall').AsFloat := ds3.fieldByName('capaisolo').AsFloat+ds3.fieldByName('capaikrm').AsFloat+ds3.fieldByName('capaijogja').AsFloat+ds3.fieldByName('capaimadiun').AsFloat+ds3.fieldByName('capaipw').AsFloat+ds3.fieldByName('capaismg').AsFloat;
                ds3.FieldByName('totaltargetall').AsFloat := ds3.fieldByName('totaltargetsolo').AsFloat+ds3.fieldByName('totaltargetkrm').AsFloat+ds3.fieldByName('totaltargetjogja').AsFloat+ds3.fieldByName('totaltargetmadiun').AsFloat+ds3.fieldByName('totaltargetpw').AsFloat+ds3.fieldByName('totaltargetsmg').AsFloat;
                ds3.FieldByName('totalcapaiall').AsFloat := ds3.fieldByName('totalcapaisolo').AsFloat+ds3.fieldByName('totalcapaikrm').AsFloat+ds3.fieldByName('totalcapaijogja').AsFloat+ds3.fieldByName('totalcapaimadiun').AsFloat+ds3.fieldByName('totalcapaipw').AsFloat+ds3.fieldByName('totalcapaismg').AsFloat;
                ds3.FieldByName('stokall').AsFloat := ds3.fieldByName('stoksolo').AsFloat+ds3.fieldByName('stokkrm').AsFloat+ds3.fieldByName('stokjogja').AsFloat+ds3.fieldByName('stokmadiun').AsFloat+ds3.fieldByName('stokpwkt').AsFloat+ds3.fieldByName('stoksmg').AsFloat;
                if ds3.FieldByName('totaltargetall').AsFloat > 0 then
                ds3.FieldByName('ratioall').AsFloat := ds3.FieldByName('totalcapaiall').AsFloat/ds3.FieldByName('totaltargetall').AsFloat*100
                else
                ds3.FieldByName('ratioall').AsFloat :=0;
ds3.next;
end;
end;

procedure TfrmLapAllPf.btnTampilClick(Sender: TObject);
begin
    loaddata;

end;

procedure TfrmLapAllPf.cxPresentaseKRMCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0) > 100 then
      ACanvas.font.Color := clFuchsia
    else
      ACanvas.font.Color := clLime;
        ACanvas.font.Style := [fsbold];


end;

procedure TfrmLapAllPf.cxPresentaseKRMCustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
 if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0) > 100 then
      ACanvas.font.Color := clFuchsia
    else
      ACanvas.font.Color := clLime;
        ACanvas.font.Style := [fsbold];


end;

procedure TfrmLapAllPf.cxPresentaseSoloCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0) < 100 then
      ACanvas.font.Color := clFuchsia
    else
      ACanvas.font.Color := clLime;
        ACanvas.font.Style := [fsbold];

end;

procedure
    TfrmLapAllPf.cxPresentaseSoloCustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
 if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0) < 100 then
      ACanvas.font.Color := clFuchsia
    else
      ACanvas.font.Color := clLime;
        ACanvas.font.Style := [fsbold];

end;

procedure TfrmLapAllPf.cxGrid1DBBandedTableView1Column8CustomDrawCell(Sender:
    TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0) >= 70 then
      ACanvas.font.Color := claqua;
    if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0)  >= 100 then
      ACanvas.font.Color := clLime ;
    if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0)  < 70 then
      ACanvas.font.Color := $000006FD;
        ACanvas.font.Style := [fsbold];

end;

procedure TfrmLapAllPf.cxGrid1DBBandedTableView1Column8CustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0) >= 70 then
      ACanvas.font.Color := claqua;
    if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0)  >= 100 then
      ACanvas.font.Color := clLime ;
    if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0)  < 70 then
      ACanvas.font.Color := $000006FD;
        ACanvas.font.Style := [fsbold];

end;

procedure
    TfrmLapAllPf.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems11GetText(
    Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
    AText: string);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetsolo')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totalcapaisolo'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetsolo'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;


procedure TfrmLapAllPf.TeSpeedButton1Click(Sender: TObject);
begin

     if SaveDialog1.Execute then
     begin
       ExportGridToExcel(SaveDialog1.FileName, cxGrid1);
     end;

end;


function TfrmLapAllPf.GetPivotChartLink: TcxPivotGridChartConnection;
begin
  If not Assigned(FPivotChartLink) then
    FPivotChartLink := TcxPivotGridChartConnection.Create(Self);
  Result := FPivotChartLink;
end;

procedure TfrmLapAllPf.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems8GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetkrm')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totalcapaikrm'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetkrm'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;


procedure TfrmLapAllPf.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems3GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetjogja')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totalcapaijogja'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetjogja'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapAllPf.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems9GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetmadiun')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totalcapaimadiun'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetmadiun'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapAllPf.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems15GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetpw')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totalcapaipw'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetpw'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

procedure TfrmLapAllPf.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems16GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetall')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totalcapaiall'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetall'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;


procedure TfrmLapAllPf.cxGrid1DBBandedTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems26GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetsmg')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totalcapaismg'))/ cVarToFloat(TcxDBGridHelper(cxGrid1DBBandedTableView1).GetFooterSummary('totaltargetsmg'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;

end.
