unit ufrmListSaldoHutang;

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
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, AdvEdit,
  AdvEdBtn, dxPScxGrid6Lnk, MemDS, DBAccess, MyAccess;

type
  TfrmListSaldohutang = class(TForm)
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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    cxChart: TcxGrid;
    cxGrdChart: TcxGridChartView;
    lvlChart: TcxGridLevel;
    cxPivot: TcxDBPivotGrid;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrdDetail: TcxGridDBTableView;
    cxGrid11Level1: TcxGridLevel;
    cxVCLPrinter: TdxComponentPrinter;
    cxVCLPrinterChart: TdxGridReportLink;
    btnRefresh: TcxButton;
    Label1: TLabel;
    startdate: TDateTimePicker;
    Label2: TLabel;
    enddate: TDateTimePicker;
    TePanel5: TTePanel;
    cxButton8: TcxButton;
    cxButton7: TcxButton;
    Label5: TLabel;
    edtCustomer: TAdvEditBtn;
    edtCusNama: TAdvEdit;
    sqlqry1: TMyQuery;
    procedure FormDblClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure sbNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure sbPrintClick(Sender: TObject);
    procedure btnTampilClick(Sender: TObject);
    procedure cxPageControl1Click(Sender: TObject);
    procedure TeSpeedButton1Click(Sender: TObject);
    procedure dttanggalChange(Sender: TObject);
    procedure TeSpeedButton2Click(Sender: TObject);
    procedure SetPivotColumns(ColumnSets: Array Of String);
    procedure SetPivotData(ColumnSets: Array Of String);
    procedure SetPivotRow(ColumnSets: Array Of String);
    procedure cxButton1Click(Sender: TObject);
    procedure edtCustomerClickBtn(Sender: TObject);

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

  frmListSaldohutang: TfrmListSaldohutang;

implementation
   uses Ulib, MAIN, uModuleConnection, cxgridExportlink, uFrmbantuan;
{$R *.dfm}



procedure TfrmListSaldohutang.FormDblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmListSaldohutang.btnExitClick(Sender: TObject);
begin
      Release;
end;

procedure TfrmListSaldohutang.refreshdata;
begin
  startdate.DateTime := Date;
  startdate.setfocus;

end;

procedure TfrmListSaldohutang.sbNewClick(Sender: TObject);
begin
   refreshdata;
   startdate.SetFocus;
//   sbdelete.Enabled := False;
end;




procedure TfrmListSaldohutang.FormShow(Sender: TObject);
begin
  flagedit := False;
  startdate.DateTime := Date;
  enddate.DateTime := Date;
  refreshdata;
end;





procedure TfrmListSaldohutang.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      SelectNext(ActiveControl,True,True);

end;


procedure TfrmListSaldohutang.sbPrintClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmListSaldohutang.loaddata;
var
  skolom,s: string ;
  afilter : string ;
  i:integer;
begin


        s:= 'select Supplier,sup_nama Nama,Tax,Saldo_Awal,'
          + ' (select sum(inv_amount-inv_taxamount) '
          + ' from tinv_hdr where inv_sup_kode=supplier and inv_tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime)+ ' and if(inv_istax=1,"PPN","Non PPn")=tax) Net,'
          + ' (select sum(inv_taxamount) from tinv_hdr where inv_sup_kode=supplier and inv_tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime)
          + ' and if(inv_istax=1,"PPN","Non PPn")=tax) Pajak,'
          + ' Total,'
          + ' Retur,Bayar_Cash,Bayar_Transfer,Potongan,UM_Pembelian,Giro,Lainnya'
          + ' ,(Saldo_Awal+Total)-(Retur+Bayar_cash+bayar_transfer+Potongan+UM_Pembelian+Giro+Lainnya) Saldo_Akhir from'
          + ' (select aa.supplier,ifnull(bb.tanggal,'+ QuotD(startdate.DateTime) +') Tanggal,aa.tax,'
          + ' ifnull((select sum(kredit-debet) from bsm.kartu_hutang where supplier=aa.supplier and tax=aa.tax and tanggal < '+ QuotD(startdate.DateTime) +'),0) Saldo_Awal,'
          + ' ifnull((select sum(kredit) from bsm.kartu_hutang where supplier=aa.supplier and tax=aa.tax and tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime) + '),0) Total,'
          + ' ifnull((select sum(debet)  from bsm.kartu_hutang where supplier=aa.supplier and tax=aa.tax and tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime) + ' and nomor like "RET%"),0) Retur,'
          + ' ifnull((select sum(debet)  from bsm.kartu_hutang where supplier=aa.supplier and tax=aa.tax and tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime) + ' and nomor like "VP%" and rekening in ("11.002","11.003") ),0) Bayar_Cash,'
          + ' ifnull((select sum(debet)  from bsm.kartu_hutang where supplier=aa.supplier and tax=aa.tax and tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime) + ' and nomor like "VP%" and rekening in ("12.004","12.006","12.014","12.013")),0) Bayar_Transfer,'
          + ' ifnull((select sum(debet)  from bsm.kartu_hutang where supplier=aa.supplier and tax=aa.tax and tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime) + ' and nomor like "VP%" and rekening in ("21.005")),0) Potongan,'
          + ' ifnull((select sum(debet)  from bsm.kartu_hutang where supplier=aa.supplier and tax=aa.tax and tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime) + ' and nomor like "VP%" and rekening in ("15.003")),0) UM_Pembelian,'
          + ' ifnull((select sum(debet)  from bsm.kartu_hutang where supplier=aa.supplier and tax=aa.tax and tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime) + ' and nomor like "VP%" and rekening in ("12.002")),0) Giro,'
          + ' ifnull((select sum(debet)  from bsm.kartu_hutang where supplier=aa.supplier and tax=aa.tax and tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime) + ' and nomor like "VP%" and rekening not in ("12.002","15.003","21.005","12.004","12.006","12.014","12.013","11.002","11.003")),0) Lainnya'
          + ' from'
          + ' (select supplier,tax from bsm.kartu_hutang group by supplier,tax ) aa left join bsm.kartu_hutang  bb'
          + ' on aa.supplier=bb.Supplier and aa.tax=bb.tax and tanggal between '+ QuotD(startdate.DateTime) + '  and '+ QuotD(enddate.DateTime)
          + ' group by aa.supplier,aa.tax order by ifnull(bb.tanggal,'+ QuotD(startdate.DateTime) + ' )) a inner join tsupplier on sup_KODE =a.supplier ';


//
//        select Tanggal,Customer,cus_nama Nama,Tax,sum(Bruto) Bruto,sum(Disc)Disc,sum(Dpp) Dpp,sum(Pajak) Pajak,sum(Total) Total'
//        + ' ,sum(Biaya_Promosi) Biaya_Promosi,sum(Kontrak) Kontrak,sum(freight) Freight,'
//        + ' sum(Retur) Retur,sum(Bayar_Cash) Bayar_Cash,sum(Bayar_Transfer) Bayar_Transfer,sum(Giro) Giro,sum(Deposit) Deposit,sum(Potongan) Potongan'
//        + ' from transaksi_harian A inner join tcustomer on cus_kode=customer '
//        + ' where tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
//        + ' and customer like '+ quot(edtcustomer.text+'%')
//        +' group by Tanggal,customer,cus_nama,Tax '
//        + ' order by Tanggal';

        ds3.Close;
        sqlqry1.Connection := frmmenu.conn;
        sqlqry1.SQL.Text := s;
        ds3.open;


        Skolom :='Supplier,Nama,Tax,Saldo_Awal,Net,Pajak,Total,Retur,Bayar_Cash,Bayar_Transfer,Giro,Potongan,UM_Pembelian,Lainnya,Saldo_Akhir';
        QueryToDBGrid(cxGrid1DBTableView1, s,skolom ,ds2);
           cxGrid1DBTableView1.Columns[0].MinWidth := 60;
           cxGrid1DBTableView1.Columns[1].MinWidth := 60;
           cxGrid1DBTableView1.Columns[2].MinWidth := 100;
           cxGrid1DBTableView1.Columns[3].MinWidth := 100;
           cxGrid1DBTableView1.Columns[4].MinWidth := 100;
           cxGrid1DBTableView1.Columns[5].MinWidth := 100;
           cxGrid1DBTableView1.Columns[6].MinWidth := 100;
           cxGrid1DBTableView1.Columns[7].MinWidth := 100;

        for i:=0 To cxGrid1DBTableView1.ColumnCount -1 do
        begin
          if ds3.Fields[i].DataType = ftFloat then
          begin
             ds3.Fields[i].Alignment := taRightJustify;
             TFloatField(ds3.Fields[i]).DisplayFormat := '###,###,###';
          end;

        end;
        cxGrid1DBTableView1.Columns[1].Summary.GroupFooterKind:=skCount;
        cxGrid1DBTableView1.Columns[1].Summary.GroupFooterFormat:='####';
        cxGrid1DBTableView1.Columns[9].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[9].Summary.GroupFooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[8].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[8].Summary.GroupFooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[4].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[4].Summary.GroupFooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[5].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[5].Summary.GroupFooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[6].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[6].Summary.GroupFooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[7].Summary.GroupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[7].Summary.GroupFooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[9].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[9].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[10].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[10].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[11].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[11].Summary.FooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[12].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[12].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[13].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[13].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[14].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[14].Summary.FooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[8].Summary.FooterKind:=skSum;

        cxGrid1DBTableView1.Columns[8].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[4].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[4].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[3].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[3].Summary.FooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[5].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[5].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[6].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[6].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[7].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[7].Summary.FooterFormat:='###,###,###,###';

//  hitung;
          TcxDBPivotHelper(cxPivot).LoadFromCDS(ds3);
           SetPivotColumns(['Tax']);
           SetPivotRow (['Customer']);
           SetPivotData(['Saldo_Akhir']);


end;

procedure TfrmListSaldohutang.btnTampilClick(Sender: TObject);
begin
    loaddata;

end;

procedure TfrmListSaldohutang.cxPageControl1Click(Sender: TObject);
begin
IF PageControl1.Pages[2].Visible  then
begin
  PivotChartLink.GridChartView := cxGrdChart;
  PivotChartLink.PivotGrid := cxPivot;
end;
end;

procedure TfrmListSaldohutang.TeSpeedButton1Click(Sender: TObject);
begin

  IF PageControl1.Pages[1].Visible  then
     TcxDBPivotHelper(cxPivot).ExportToXLS
  else
  begin
     if SaveDialog1.Execute then
     begin
       ExportGridToExcel(SaveDialog1.FileName, cxGrid1);
     end;
 end;


end;


procedure TfrmListSaldohutang.dttanggalChange(Sender: TObject);
begin
  enddate.DateTime := startdate.DateTime;
end;

function TfrmListSaldohutang.GetPivotChartLink: TcxPivotGridChartConnection;
begin
  If not Assigned(FPivotChartLink) then
    FPivotChartLink := TcxPivotGridChartConnection.Create(Self);
  Result := FPivotChartLink;
end;

procedure TfrmListSaldohutang.TeSpeedButton2Click(Sender: TObject);
begin
//  IF PageControl1.Pages[1].Visible  then
//     cxVCLPrinterPivot.Preview
//  else
//  if PageControl1.Pages[2].Visible  then
//    cxVCLPrinterChart.Preview;
end;

procedure TfrmListSaldohutang.SetPivotRow(ColumnSets: Array Of String);
begin
  TcxDBPivotHelper(cxPivot).SetRowColumns(ColumnSets);
end;

procedure TfrmListSaldohutang.SetPivotColumns(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetColColumns(ColumnSets);
end;

procedure TfrmListSaldohutang.SetPivotData(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetDataColumns(ColumnSets);
end;


procedure TfrmListSaldohutang.cxButton1Click(Sender: TObject);
begin
//With cxPivot.GetFieldByName('Salesman') do
//  begin
//    if SortBySummaryInfo.Field = nil then
//      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Riil')
//    else
//      SortBySummaryInfo.Field := nil;
//  end;
//
//With cxPivot.GetFieldByName('Customer') do
//  begin
//    if SortBySummaryInfo.Field = nil then
//      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Riil')
//    else
//      SortBySummaryInfo.Field := nil;
//  end;

end;

procedure TfrmListSaldohutang.edtCustomerClickBtn(Sender: TObject);
begin
  sqlbantuan := ' select cus_kode Kode,cus_nama Nama from tcustomer  ';
  sqlfilter := 'Kode,Nama';
  Application.CreateForm(Tfrmbantuan,frmbantuan);
  frmBantuan.SQLMaster := SQLbantuan;
  frmBantuan.ShowModal;
   if varglobal <> '' then
 begin
  edtcustomer.Text := varglobal;
  edtCusNama.Text :=  varglobal1;
 end;

end;

end.
