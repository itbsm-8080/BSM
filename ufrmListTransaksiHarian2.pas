unit ufrmListTransaksiHarian2;

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
  TfrmListTransaksiHarian2 = class(TForm)
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
    PopupMenu1: TPopupMenu;
    LihatFakturPenjualan1: TMenuItem;
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
    procedure LihatFakturPenjualan1Click(Sender: TObject);

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

  frmListTransaksiHarian2: TfrmListTransaksiHarian2;

implementation
   uses Ulib, MAIN, uModuleConnection, cxgridExportlink, uFrmbantuan, ufrmInvoice, ufrmBayarSupplier;
{$R *.dfm}



procedure TfrmListTransaksiHarian2.FormDblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmListTransaksiHarian2.btnExitClick(Sender: TObject);
begin
      Release;
end;

procedure TfrmListTransaksiHarian2.refreshdata;
begin
  startdate.DateTime := Date;
  startdate.setfocus;

end;

procedure TfrmListTransaksiHarian2.sbNewClick(Sender: TObject);
begin
   refreshdata;
   startdate.SetFocus;
//   sbdelete.Enabled := False;
end;




procedure TfrmListTransaksiHarian2.FormShow(Sender: TObject);
begin
  flagedit := False;
  startdate.DateTime := Date;
  enddate.DateTime := Date;
  refreshdata;
end;





procedure TfrmListTransaksiHarian2.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      SelectNext(ActiveControl,True,True);

end;


procedure TfrmListTransaksiHarian2.sbPrintClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmListTransaksiHarian2.loaddata;
var
  skolom,s: string ;
  afilter : string ;
  i:integer;
begin


        s:= ' select Tanggal,Supplier,sup_nama Nama,Tax,sum(Bruto) Bruto,sum(Disc)Disc,sum(Gross) Gross,sum(disc_faktur) Disc_faktur ,sum(Dpp) Dpp,sum(Pajak) Pajak,sum(Total) Total'
        + ' ,sum(freight) Freight,sum(Retur-Pajak_Retur) Retur_Net,sum(Pajak_Retur) Pajak_Retur,'
        + ' sum(Retur) Retur,sum(kas) Bayar_Cash,sum(transfer) Bayar_Transfer,sum(UM) UM,sum(Potongan) Potongan,sum(internal) Internal,sum(lainnya) Lainnya'
        + ' from transaksi_harian A inner join tsupplier on sup_kode=supplier '
        + ' where tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
        + ' and supplier like '+ quot(edtcustomer.text+'%')
        +' group by Tanggal,supplier,sup_nama,Tax '
        + ' order by Tanggal';

        ds3.Close;
        sqlqry1.Connection := frmmenu.conn;
        sqlqry1.SQL.Text := s;
        ds3.open;


        Skolom :='Tanggal,Supplier,Nama,Tax,Bruto,Disc,Gross,Disc_faktur,Dpp,Pajak,Total,Freight,Retur_Net,Pajak_Retur,Retur,Bayar_Cash,Bayar_Transfer,UM,Potongan,Internal,Lainnya';
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

        cxGrid1DBTableView1.Columns[8].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[8].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[4].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[4].Summary.FooterFormat:='###,###,###,###';

        cxGrid1DBTableView1.Columns[5].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[5].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[6].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[6].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[7].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[7].Summary.FooterFormat:='###,###,###,###';
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
        cxGrid1DBTableView1.Columns[15].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[15].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[16].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[16].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[17].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[17].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[18].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[18].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[19].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[19].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[20].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[20].Summary.FooterFormat:='###,###,###,###';

//  hitung;
          TcxDBPivotHelper(cxPivot).LoadFromCDS(ds3);
           SetPivotColumns(['Bulan']);
           SetPivotRow (['Supplier']);
           SetPivotData(['Riil']);


end;

procedure TfrmListTransaksiHarian2.btnTampilClick(Sender: TObject);
begin
    loaddata;

end;

procedure TfrmListTransaksiHarian2.cxPageControl1Click(Sender: TObject);
begin
IF PageControl1.Pages[2].Visible  then
begin
  PivotChartLink.GridChartView := cxGrdChart;
  PivotChartLink.PivotGrid := cxPivot;
end;
end;

procedure TfrmListTransaksiHarian2.TeSpeedButton1Click(Sender: TObject);
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


procedure TfrmListTransaksiHarian2.dttanggalChange(Sender: TObject);
begin
  enddate.DateTime := startdate.DateTime;
end;

function TfrmListTransaksiHarian2.GetPivotChartLink: TcxPivotGridChartConnection;
begin
  If not Assigned(FPivotChartLink) then
    FPivotChartLink := TcxPivotGridChartConnection.Create(Self);
  Result := FPivotChartLink;
end;

procedure TfrmListTransaksiHarian2.TeSpeedButton2Click(Sender: TObject);
begin
//  IF PageControl1.Pages[1].Visible  then
//     cxVCLPrinterPivot.Preview
//  else
//  if PageControl1.Pages[2].Visible  then
//    cxVCLPrinterChart.Preview;
end;

procedure TfrmListTransaksiHarian2.SetPivotRow(ColumnSets: Array Of String);
begin
  TcxDBPivotHelper(cxPivot).SetRowColumns(ColumnSets);
end;

procedure TfrmListTransaksiHarian2.SetPivotColumns(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetColColumns(ColumnSets);
end;

procedure TfrmListTransaksiHarian2.SetPivotData(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetDataColumns(ColumnSets);
end;


procedure TfrmListTransaksiHarian2.cxButton1Click(Sender: TObject);
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

procedure TfrmListTransaksiHarian2.edtCustomerClickBtn(Sender: TObject);
begin
  sqlbantuan := ' select Sup_kode Kode,sup_nama Nama from tsupplier  ';
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

procedure TfrmListTransaksiHarian2.LihatFakturPenjualan1Click(
  Sender: TObject);
var
  frmInvoice: TfrmInvoice;
  frmbayarsupplier : Tfrmbayarsupplier;
begin
  inherited;
   If ds3.FieldByname('Nomor').IsNull then exit;
  if pos(UpperCase('FP'),UpperCase(ds3.FieldByname('Nomor').AsString)) > 0  then
  begin
  if ActiveMDIChild.Caption <> 'Faktur Penjualan' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmInvoice  := frmmenu.ShowForm(TfrmInvoice) as TfrmInvoice;
      frmInvoice.ID := ds3.FieldByname('Nomor').AsString;
      frmInvoice.FLAGEDIT := True;
      frmInvoice.edtnOMOR.Text := ds3.FieldByname('Nomor').AsString;
      frmInvoice.loaddataall(ds3.FieldByname('Nomor').AsString);
//      if cekbayar(CDS.FieldByname('Invoice').AsString) = 1 then
//      begin
//        ShowMessage('Transaksi ini sudah ada pembayaran,Tidak dapat di edit');
        frmInvoice.cxButton2.Enabled :=False;
        frmInvoice.cxButton1.Enabled :=False;
//        frmInvoice.cxButton3.Enabled := False;
//      end;
   end;
   frmInvoice.Show;
 end;
   if pos(UpperCase('VP'),UpperCase(ds3.FieldByname('Nomor').AsString)) > 0  then
  begin
  if ActiveMDIChild.Caption <> 'Invoice' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmbayarsupplier  := frmmenu.ShowForm(Tfrmbayarsupplier) as Tfrmbayarsupplier;
      frmbayarsupplier.ID := ds3.FieldByname('Nomor').AsString;
      frmbayarsupplier.FLAGEDIT := True;
      frmbayarsupplier.edtnOMOR.Text := ds3.FieldByname('Nomor').AsString;
      frmbayarsupplier.loaddataall(ds3.FieldByname('Nomor').AsString);
//      if cekbayar(CDS.FieldByname('Invoice').AsString) = 1 then
//      begin
//        ShowMessage('Transaksi ini sudah ada pembayaran,Tidak dapat di edit');
        frmbayarsupplier.cxButton2.Enabled :=False;
        frmbayarsupplier.cxButton1.Enabled :=False;

//      end;
   end;
   frmbayarsupplier.Show;
 end;
end;


end.
