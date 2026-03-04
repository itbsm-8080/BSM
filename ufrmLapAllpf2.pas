unit ufrmLapAllPf2;

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
  TfrmLapAllPf2 = class(TForm)
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
    Label2: TLabel;
    edtTahun: TComboBox;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    SQLQuery3: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    SQLQuery4: TSQLQuery;
    DataSetProvider2: TDataSetProvider;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    cxGridDBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDBBandedColumn11: TcxGridDBBandedColumn;
    cxGridDBBandedColumn13: TcxGridDBBandedColumn;
    cxGridDBBandedColumn14: TcxGridDBBandedColumn;
    cxGridDBBandedColumn15: TcxGridDBBandedColumn;
    cxGridDBBandedColumn16: TcxGridDBBandedColumn;
    cxGridDBBandedColumn17: TcxGridDBBandedColumn;
    cxGridDBBandedColumn18: TcxGridDBBandedColumn;
    cxGridDBBandedColumn19: TcxGridDBBandedColumn;
    cxGridDBBandedColumn20: TcxGridDBBandedColumn;
    cxGridDBBandedColumn21: TcxGridDBBandedColumn;
    cxGridDBBandedColumn22: TcxGridDBBandedColumn;
    cxGridDBBandedColumn23: TcxGridDBBandedColumn;
    cxGridDBBandedColumn24: TcxGridDBBandedColumn;
    cxGridDBBandedColumn25: TcxGridDBBandedColumn;
    cxGridDBBandedColumn26: TcxGridDBBandedColumn;
    cxGridDBBandedColumn27: TcxGridDBBandedColumn;
    cxGridDBBandedColumn28: TcxGridDBBandedColumn;
    cxGridDBBandedColumn29: TcxGridDBBandedColumn;
    cxGridDBBandedColumn30: TcxGridDBBandedColumn;
    cxGridDBBandedColumn31: TcxGridDBBandedColumn;
    cxGridDBBandedColumn32: TcxGridDBBandedColumn;
    cxGridDBBandedColumn35: TcxGridDBBandedColumn;
    cxGridDBBandedColumn36: TcxGridDBBandedColumn;
    cxGridDBBandedColumn39: TcxGridDBBandedColumn;
    cxGridDBBandedColumn40: TcxGridDBBandedColumn;
    cxGridDBBandedColumn41: TcxGridDBBandedColumn;
    cxGridDBBandedColumn42: TcxGridDBBandedColumn;
    cxGridDBBandedColumn43: TcxGridDBBandedColumn;
    cxGridDBBandedColumn44: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    TabSheet3: TTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBBandedColumn12: TcxGridDBBandedColumn;
    cxGridDBBandedColumn33: TcxGridDBBandedColumn;
    cxGridDBBandedColumn34: TcxGridDBBandedColumn;
    cxGridDBBandedColumn37: TcxGridDBBandedColumn;
    cxGridDBBandedColumn38: TcxGridDBBandedColumn;
    cxGridDBBandedColumn45: TcxGridDBBandedColumn;
    cxGridDBBandedColumn46: TcxGridDBBandedColumn;
    cxGridDBBandedColumn47: TcxGridDBBandedColumn;
    cxGridDBBandedColumn48: TcxGridDBBandedColumn;
    cxGridDBBandedColumn49: TcxGridDBBandedColumn;
    cxGridDBBandedColumn50: TcxGridDBBandedColumn;
    cxGridDBBandedColumn51: TcxGridDBBandedColumn;
    cxGridDBBandedColumn52: TcxGridDBBandedColumn;
    cxGridDBBandedColumn53: TcxGridDBBandedColumn;
    cxGridDBBandedColumn54: TcxGridDBBandedColumn;
    cxGridDBBandedColumn55: TcxGridDBBandedColumn;
    cxGridDBBandedColumn56: TcxGridDBBandedColumn;
    cxGridDBBandedColumn57: TcxGridDBBandedColumn;
    cxGridDBBandedColumn58: TcxGridDBBandedColumn;
    cxGridDBBandedColumn59: TcxGridDBBandedColumn;
    cxGridDBBandedColumn60: TcxGridDBBandedColumn;
    cxGridDBBandedColumn61: TcxGridDBBandedColumn;
    cxGridDBBandedColumn62: TcxGridDBBandedColumn;
    cxGridDBBandedColumn63: TcxGridDBBandedColumn;
    cxGridDBBandedColumn64: TcxGridDBBandedColumn;
    cxGridDBBandedColumn65: TcxGridDBBandedColumn;
    cxGridDBBandedColumn66: TcxGridDBBandedColumn;
    cxGridDBBandedColumn67: TcxGridDBBandedColumn;
    cxGridDBBandedColumn68: TcxGridDBBandedColumn;
    cxGridDBBandedColumn69: TcxGridDBBandedColumn;
    cxGridDBBandedColumn70: TcxGridDBBandedColumn;
    cxGridDBBandedColumn71: TcxGridDBBandedColumn;
    cxGridDBBandedColumn72: TcxGridDBBandedColumn;
    cxGridDBBandedColumn73: TcxGridDBBandedColumn;
    cxGridDBBandedColumn74: TcxGridDBBandedColumn;
    cxGridDBBandedColumn75: TcxGridDBBandedColumn;
    cxGridDBBandedColumn76: TcxGridDBBandedColumn;
    cxGridDBBandedColumn77: TcxGridDBBandedColumn;
    cxGridDBBandedColumn78: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
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

  frmLapAllPf2: TfrmLapAllPf2;

implementation
   uses Ulib, MAIN, uModuleConnection, cxgridExportlink;
{$R *.dfm}



procedure TfrmLapAllPf2.FormDblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmLapAllPf2.btnExitClick(Sender: TObject);
begin
      Release;
end;

procedure TfrmLapAllPf2.refreshdata;
begin
  edttahun.text :=  FormatDateTime('yyyy',Date);
end;

procedure TfrmLapAllPf2.sbNewClick(Sender: TObject);
begin
   refreshdata;

end;




procedure TfrmLapAllPf2.FormShow(Sender: TObject);
begin
  flagedit := False;
  refreshdata;
end;





procedure TfrmLapAllPf2.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      SelectNext(ActiveControl,True,True);

end;


procedure TfrmLapAllPf2.sbPrintClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmLapAllPf2.loaddata;
var
  ssql:string;
  tsql : TmyQuery;
  akhir : TDateTime;
begin
  akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex +1)+'/01/'+edttahun.Text));


ssql := 'SELECT nama_grouppf grup,brg_nama item,jual-retur omzet ,stok,ifnull(stok/(jual-retur),0) ratio, '
+ ' cast(0 as decimal) omzet2,cast(0 as decimal) stok2,cast(0 as decimal) ratio2,'
+ ' cast(0 as decimal) omzet3,cast(0 as decimal) stok3,cast(0 as decimal) ratio3,'
+ ' cast(0 as decimal) omzet4,cast(0 as decimal) stok4,cast(0 as decimal) ratio4,'
+ ' cast(0 as decimal) omzet5,cast(0 as decimal) stok5,cast(0 as decimal) ratio5,'
+ ' cast(0 as decimal) omzetall,cast(0 as decimal) stokall,cast(0 as decimal) ratioall '
+ ' FROM ('
+ ' SELECT brg_kode,nama_grouppf,brg_nama,'
+ ' (select ifnull(SUM(fpd_qty),0) FROM bsmcabang.tfp_hdr INNER JOIN bsmcabang.tfp_dtl ON fpd_fp_nomor=fp_nomor'
//+ ' INNER JOIN bsmcabang.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ ' WHERE fpd_brg_kode=brg_kode AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text+' ) jual,'
+ ' (select ifnull(SUM(retjd_qty),0) FROM bsmcabang.tretj_hdr INNER JOIN bsmcabang.tretj_dtl ON retjd_retj_nomor=retj_nomor'
//+ ' INNER JOIN bsmcabang.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE retjd_brg_kode=brg_kode AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text+' ) retur,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM bsmcabang.tmasterstok WHERE mst_tanggal<='+quotd(akhir)+' AND mst_brg_kode=brg_kode and mst_gdg_kode not in ("WH-10","WH-09","WH-05")) stok'
+ '  FROM bsmcabang.tbarangpf'
+ ' INNER JOIN bsmcabang.tgrouppf ON kode_grouppf=bpf_kode_grouppf'
+ ' INNER JOIN bsmcabang.tbarang ON bpf_brg_kode=brg_kode'
+ ' AND bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' HAVING stok <> 0 or jual <> 0 OR retur <> 0) final';
            ClientDataSet1.Close;
            SQLQuery1.Connection := frmMenu.conn;
            SQLQuery1.SQL.Text := ssql;
            ClientDataSet1.open;

ssql := 'SELECT nama_grouppf grup,brg_nama item,jual-retur omzet2 ,stok stok2,ifnull(stok/(jual-retur),0) ratio2 '
+ ' FROM ('
+ ' SELECT brg_kode,nama_grouppf,brg_nama,'
+ ' (select ifnull(SUM(fpd_qty),0) FROM bsmcabang2.tfp_hdr INNER JOIN bsmcabang2.tfp_dtl ON fpd_fp_nomor=fp_nomor'
//+ ' INNER JOIN bsmcabang2.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ ' WHERE fpd_brg_kode=brg_kode AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text+' ) jual,'
+ ' (select ifnull(SUM(retjd_qty),0) FROM bsmcabang2.tretj_hdr INNER JOIN bsmcabang2.tretj_dtl ON retjd_retj_nomor=retj_nomor'
//+ ' INNER JOIN bsmcabang2.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE retjd_brg_kode=brg_kode AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text+' ) retur,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM bsmcabang2.tmasterstok WHERE mst_tanggal<='+quotd(akhir)+' AND mst_brg_kode=brg_kode and mst_gdg_kode not in ("WH-07","WH-99")) stok'
+ '  FROM bsmcabang2.tbarangpf'
+ ' INNER JOIN bsmcabang2.tgrouppf ON kode_grouppf=bpf_kode_grouppf'
+ ' INNER JOIN bsmcabang2.tbarang ON bpf_brg_kode=brg_kode'
+ ' AND bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' HAVING stok <> 0 or jual <> 0 OR retur <> 0) final';

tsql:=xOpenQuery(ssql,frmMenu.conn);
with tsql do
begin
  try
    while not eof do
    begin
             if ClientDataSet1.Locate('item',trim(FieldByName('item').AsString),[loCaseInsensitive]) then
             begin

               If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;
                ClientDataSet1.FieldByName('omzet2').AsFloat := FieldByName('omzet2').AsFloat;
                ClientDataSet1.FieldByName('stok2').AsFloat := FieldByName('stok2').AsFloat;
                ClientDataSet1.FieldByName('ratio2').AsFloat := FieldByName('ratio2').AsFloat;

             end;
         Next;
    end;
  finally
    free;
  end;
end;

ssql := 'SELECT nama_grouppf grup,brg_nama item,jual-retur omzet3 ,stok stok3,ifnull(stok/(jual-retur),0) ratio3 '
+ ' FROM ('
+ ' SELECT brg_kode,nama_grouppf,brg_nama,'
+ ' (select ifnull(SUM(fpd_qty),0) FROM bsmcabang3.tfp_hdr INNER JOIN bsmcabang3.tfp_dtl ON fpd_fp_nomor=fp_nomor'
//+ ' INNER JOIN bsmcabang3.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ ' WHERE fpd_brg_kode=brg_kode AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text+' ) jual,'
+ ' (select ifnull(SUM(retjd_qty),0) FROM bsmcabang3.tretj_hdr INNER JOIN bsmcabang3.tretj_dtl ON retjd_retj_nomor=retj_nomor'
//+ ' INNER JOIN bsmcabang3.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE retjd_brg_kode=brg_kode AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text+' ) retur,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM bsmcabang3.tmasterstok WHERE mst_tanggal<='+quotd(akhir)+' AND mst_brg_kode=brg_kode ) stok'
+ '  FROM bsmcabang3.tbarangpf'
+ ' INNER JOIN bsmcabang3.tgrouppf ON kode_grouppf=bpf_kode_grouppf'
+ ' INNER JOIN bsmcabang3.tbarang ON bpf_brg_kode=brg_kode'
+ ' AND bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' HAVING stok <> 0 or jual <> 0 OR retur <> 0) final';

tsql:=xOpenQuery(ssql,frmMenu.conn);
with tsql do
begin
  try
    while not eof do
    begin
             if ClientDataSet1.Locate('item',trim(FieldByName('item').AsString),[loCaseInsensitive]) then
             begin

               If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;
                ClientDataSet1.FieldByName('omzet3').AsFloat := FieldByName('omzet3').AsFloat;
                ClientDataSet1.FieldByName('stok3').AsFloat := FieldByName('stok3').AsFloat;
                ClientDataSet1.FieldByName('ratio3').AsFloat := FieldByName('ratio3').AsFloat;

             end;
         Next;
    end;
  finally
    free;
  end;
end;

ssql := 'SELECT nama_grouppf grup,brg_nama item,jual-retur omzet4 ,stok stok4,ifnull(stok/(jual-retur),0) ratio4 '
+ ' FROM ('
+ ' SELECT brg_kode,nama_grouppf,brg_nama,'
+ ' (select ifnull(SUM(fpd_qty),0) FROM bsmcabang4.tfp_hdr INNER JOIN bsmcabang4.tfp_dtl ON fpd_fp_nomor=fp_nomor'
//+ ' INNER JOIN bsmcabang4.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ ' WHERE fpd_brg_kode=brg_kode AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text+' ) jual,'
+ ' (select ifnull(SUM(retjd_qty),0) FROM bsmcabang4.tretj_hdr INNER JOIN bsmcabang4.tretj_dtl ON retjd_retj_nomor=retj_nomor'
//+ ' INNER JOIN bsmcabang4.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE retjd_brg_kode=brg_kode AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text+' ) retur,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM bsmcabang4.tmasterstok WHERE mst_tanggal<='+quotd(akhir)+' AND mst_brg_kode=brg_kode and mst_gdg_kode not in ("WH-02","WH-99")) stok'
+ '  FROM bsmcabang4.tbarangpf'
+ ' INNER JOIN bsmcabang4.tgrouppf ON kode_grouppf=bpf_kode_grouppf'
+ ' INNER JOIN bsmcabang4.tbarang ON bpf_brg_kode=brg_kode'
+ ' AND bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' HAVING stok <> 0 or jual <> 0 OR retur <> 0) final';

tsql:=xOpenQuery(ssql,frmMenu.conn);
with tsql do
begin
  try
    while not eof do
    begin
             if ClientDataSet1.Locate('item',trim(FieldByName('item').AsString),[loCaseInsensitive]) then
             begin

               If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;
                ClientDataSet1.FieldByName('omzet4').AsFloat := FieldByName('omzet4').AsFloat;
                ClientDataSet1.FieldByName('stok4').AsFloat := FieldByName('stok4').AsFloat;
                ClientDataSet1.FieldByName('ratio4').AsFloat := FieldByName('ratio4').AsFloat;

             end;
         Next;
    end;
  finally
    free;
  end;
end;
ssql := 'SELECT nama_grouppf grup,brg_nama item,jual-retur omzet5 ,stok stok5,ifnull(stok/(jual-retur),0) ratio5 '
+ ' FROM ('
+ ' SELECT brg_kode,nama_grouppf,brg_nama,'
+ ' (select ifnull(SUM(fpd_qty),0) FROM bsmcabang5.tfp_hdr INNER JOIN bsmcabang5.tfp_dtl ON fpd_fp_nomor=fp_nomor'
//+ ' INNER JOIN bsmcabang5.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ ' WHERE fpd_brg_kode=brg_kode AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text+' ) jual,'
+ ' (select ifnull(SUM(retjd_qty),0) FROM bsmcabang5.tretj_hdr INNER JOIN bsmcabang5.tretj_dtl ON retjd_retj_nomor=retj_nomor'
//+ ' INNER JOIN bsmcabang5.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE retjd_brg_kode=brg_kode AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text+' ) retur,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM bsmcabang5.tmasterstok WHERE mst_tanggal<='+quotd(akhir)+' AND mst_brg_kode=brg_kode and mst_gdg_kode not in ("WH-10","WH-09","WH-99")) stok'
+ '  FROM bsmcabang5.tbarangpf'
+ ' INNER JOIN bsmcabang5.tgrouppf ON kode_grouppf=bpf_kode_grouppf'
+ ' INNER JOIN bsmcabang5.tbarang ON bpf_brg_kode=brg_kode'
+ ' AND bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' HAVING stok <> 0 or jual <> 0 OR retur <> 0) final';

tsql:=xOpenQuery(ssql,frmMenu.conn);
with tsql do
begin
  try
    while not eof do
    begin
             if ClientDataSet1.Locate('item',trim(FieldByName('item').AsString),[loCaseInsensitive]) then
             begin

               If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;
                ClientDataSet1.FieldByName('omzet5').AsFloat := FieldByName('omzet5').AsFloat;
                ClientDataSet1.FieldByName('stok5').AsFloat := FieldByName('stok5').AsFloat;
                ClientDataSet1.FieldByName('ratio5').AsFloat := FieldByName('ratio5').AsFloat;

             end;
         Next;
    end;
  finally
    free;
  end;
end;

ClientDataSet1.First;
while not ClientDataSet1.Eof do
begin
               If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;
                ClientDataSet1.FieldByName('omzetall').AsFloat := ClientDataSet1.fieldByName('omzet').AsFloat+ClientDataSet1.fieldByName('omzet2').AsFloat+ClientDataSet1.fieldByName('omzet3').AsFloat+ClientDataSet1.fieldByName('omzet4').AsFloat+ClientDataSet1.fieldByName('omzet5').AsFloat;
                ClientDataSet1.FieldByName('stokall').AsFloat := ClientDataSet1.fieldByName('stok').AsFloat+ClientDataSet1.fieldByName('stok2').AsFloat+ClientDataSet1.fieldByName('stok3').AsFloat+ClientDataSet1.fieldByName('stok4').AsFloat+ClientDataSet1.fieldByName('stok5').AsFloat;
                if ClientDataSet1.FieldByName('omzetall').AsFloat > 0 then
                ClientDataSet1.FieldByName('ratioall').AsFloat := ClientDataSet1.FieldByName('stokall').AsFloat/ClientDataSet1.FieldByName('omzetall').AsFloat
                else
                ClientDataSet1.FieldByName('ratioall').AsFloat :=0;
ClientDataSet1.next;
end;


ssql := 'SELECT nama_grouppf grup,brg_nama item,jual-retur omzet ,stok,ifnull(stok/(jual-retur),0) ratio '
+ ' FROM ('
+ ' SELECT brg_kode,nama_grouppf,brg_nama,'
+ ' (select ifnull(SUM(fpd_qty),0) FROM krm.tfp_hdr INNER JOIN krm.tfp_dtl ON fpd_fp_nomor=fp_nomor'
//+ ' INNER JOIN krm.tsalescustomer ON sc_cus_kode=fp_cus_kode'
+ ' WHERE fpd_brg_kode=brg_kode AND MONTH(fp_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(fp_tanggal)='+ edttahun.text+' ) jual,'
+ ' (select ifnull(SUM(retjd_qty),0) FROM krm.tretj_hdr INNER JOIN krm.tretj_dtl ON retjd_retj_nomor=retj_nomor'
//+ ' INNER JOIN krm.tsalescustomer ON sc_cus_kode=retj_cus_kode'
+ ' WHERE retjd_brg_kode=brg_kode AND MONTH(retj_tanggal)='+inttostr(cbbBulan.ItemIndex+1)+' AND YEAR(retj_tanggal)='+ edttahun.text+' ) retur,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM krm.tmasterstok WHERE mst_tanggal<='+quotd(akhir)+' AND mst_brg_kode=brg_kode) stok'
+ '  FROM krm.tbarangpf'
+ ' INNER JOIN krm.tgrouppf ON kode_grouppf=bpf_kode_grouppf'
+ ' INNER JOIN krm.tbarang ON bpf_brg_kode=brg_kode'
+ ' AND bpf_periode='+inttostr(cbbBulan.ItemIndex+1)+' and bpf_tahun='+ edttahun.text
+ ' HAVING stok <> 0 or jual <> 0 OR retur <> 0) final';
            ClientDataSet2.Close;
            SQLQuery2.Connection := frmMenu.conn;
            SQLQuery2.SQL.Text := ssql;
            ClientDataSet2.open;

end;

procedure TfrmLapAllPf2.btnTampilClick(Sender: TObject);
begin
    loaddata;

end;

procedure TfrmLapAllPf2.cxPresentaseKRMCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0) > 100 then
      ACanvas.font.Color := clFuchsia
    else
      ACanvas.font.Color := clLime;
        ACanvas.font.Style := [fsbold];


end;

procedure TfrmLapAllPf2.cxPresentaseKRMCustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
 if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0) > 100 then
      ACanvas.font.Color := clFuchsia
    else
      ACanvas.font.Color := clLime;
        ACanvas.font.Style := [fsbold];


end;

procedure TfrmLapAllPf2.cxPresentaseSoloCustomDrawCell(
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
    TfrmLapAllPf2.cxPresentaseSoloCustomDrawFooterCell(
    Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
 if StrToFloatDef(StringReplace(AViewInfo.Text,',','',[rfReplaceAll]),0) < 100 then
      ACanvas.font.Color := clFuchsia
    else
      ACanvas.font.Color := clLime;
        ACanvas.font.Style := [fsbold];

end;

procedure TfrmLapAllPf2.cxGrid1DBBandedTableView1Column8CustomDrawCell(Sender:
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

procedure TfrmLapAllPf2.cxGrid1DBBandedTableView1Column8CustomDrawFooterCell(
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

function TfrmLapAllPf2.GetPivotChartLink: TcxPivotGridChartConnection;
begin
  If not Assigned(FPivotChartLink) then
    FPivotChartLink := TcxPivotGridChartConnection.Create(Self);
  Result := FPivotChartLink;
end;

end.
