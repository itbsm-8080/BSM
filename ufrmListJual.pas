unit ufrmListJual;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, SqlExpr,  cxGraphics,
  cxControls, dxStatusBar, Menus, cxLookAndFeelPainters,
  cxButtons, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid ,
  Grids, BaseGrid, AdvGrid, AdvCGrid, ComCtrls, Mask, ImgList, FMTBcd,
  Provider, DB, DBClient, DBGrids, cxLookAndFeels, cxDBData,
  cxGridBandedTableView, cxGridDBTableView,
  cxGridChartView, cxCustomPivotGrid, cxDBPivotGrid, cxPC,
  cxPivotGridChartConnection, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns,  cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxCommon, dxPSCore,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxPScxGrid6Lnk,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  te_controls, AdvEdBtn, AdvEdit, MemDS, DBAccess, MyAccess;


type
  TfrmListJual = class(TForm)
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
    CheckBox2: TCheckBox;
    cxButton3: TcxButton;
    cxButton1: TcxButton;
    Label3: TLabel;
    edtNama: TAdvEdit;
    edtkode: TAdvEditBtn;
    Label4: TLabel;
    edtNamabarang: TAdvEdit;
    chkTampung: TCheckBox;
    cxButton2: TcxButton;
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
    procedure edtkodeClickBtn(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);

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
    function GetPivotChartLink: TcxPivotGridChartConnection;
  public

    procedure loaddata;
    procedure loaddata2;

    procedure refreshdata;
    property PivotChartLink: TcxPivotGridChartConnection read GetPivotChartLink
        write FPivotChartLink;

    { Public declarations }
  end;

var

  frmListJual: TfrmListJual;

implementation
   uses Ulib, MAIN, uModuleConnection, cxgridExportlink,uReport,
  uFrmbantuan;
{$R *.dfm}



procedure TfrmListJual.FormDblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmListJual.btnExitClick(Sender: TObject);
begin
      Release;
end;

procedure TfrmListJual.refreshdata;
begin
  startdate.DateTime := Date;
  startdate.setfocus;

end;

procedure TfrmListJual.sbNewClick(Sender: TObject);
begin
   refreshdata;
   startdate.SetFocus;
//   sbdelete.Enabled := False;
end;




procedure TfrmListJual.FormShow(Sender: TObject);
begin
  flagedit := False;
  startdate.DateTime := Date;
  enddate.DateTime := Date;
  refreshdata;
end;





procedure TfrmListJual.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      SelectNext(ActiveControl,True,True);

end;


procedure TfrmListJual.sbPrintClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmListJual.loaddata;
var
  asuper2,asuper,skolom,s,smargin: string ;
  afilter : string ;
  i,jmlkolom:integer;
begin
  if frmmenu.KDUSER ='SUPER' THEN
  begin
  asuper := ' ,(SELECT mst_hargabeli FROM masterstok WHERE mst_noreferensi =DO_nomor AND mst_brg_kode=fpd_brg_kode LIMIT 1)*qty hpp,'
//          + ' sum((100-fpd_discpr)*(fpd_harga*(fpd_qty-ifnull(retjd_qty,0)))/100) -'
//          + ' sum(fpd_cn*((100-fpd_discpr)*fpd_harga/100)*(fpd_qty-ifnull(retjd_qty,0))/100) - '
//          + ' sum((mst_stok_out-'
//          + ' (select Ifnull(sum(retjd_qty),0) from tretj_dtl inner join tretj_hdr on retj_nomor=retjd_retj_nomor '
//          + ' inner join tfp_hdr on retj_fp_nomor=fp_nomor  '
//          + ' where mst_noreferensi=fp_do_nomor and retjd_brg_kode=mst_brg_kode AND retjd_expired=mst_expired_date))'
//          + ' *mst_hargabeli) Margin '
          + ' nilai_belum_ppn - ((SELECT mst_hargabeli FROM masterstok WHERE mst_noreferensi =DO_nomor AND mst_brg_kode=fpd_brg_kode LIMIT 1)*qty) margin';
  asuper2 := ' ,0 hpp,0 margin'
  end;
  if CheckBox2.Checked then
    afilter := ' where brg_isproductfocus=1 '
  else
    afilter:='';
   s:='SET @tg1='+QuotD(startdate.DateTime);
   // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);
   s:='SET @tg2='+QuotD(enddate.DateTime);
   // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);
  s:= ' SELECT upper(Cabang) Cabang,fp_nomor Nomor,fp_tanggal Tanggal,Bulan,Tahun,'
+ ' cus_nama Outlet,'
+ ' fpd_brg_kode Kode,brg_nama Nama,Qty,Nilai,Kontrak,Group_produk,'
+ ' fp_istax Pajak,brg_isproductfocus IsPf,salesman,marketing,Qty*HNA NilaiByHNA,'
+ ' Nilai_belum_ppn Nilaiblmppn,so_isecer isecer,'
+ ' (SELECT IF(ktg_nama like '+QUOT('%N3%')+',"YA","TIDAK") FROM bsm.tbarang INNER JOIN bsm.tkategori ON ktg_kode=brg_ktg_kode WHERE brg_kode=fpd_brg_kode) IsN3,'
+ ' (SELECT ktg_nama FROM bsm.tbarang INNER JOIN bsm.tkategori ON ktg_kode=brg_ktg_kode WHERE brg_kode=fpd_brg_kode) kategori,'
+ ' (SELECT ktg_nama FROM bsm.tbarang INNER JOIN bsm.tkategori ON ktg_kode=left(brg_ktg_kode,3) WHERE brg_kode=fpd_brg_kode) SubDepartemen,'
+ ' (SELECT ktg_nama FROM bsm.tbarang INNER JOIN bsm.tkategori ON ktg_kode=left(brg_ktg_kode,1) WHERE brg_kode=fpd_brg_kode) Departemen ,cast(0 as signed) kunjunganmarketing,cast(0 as signed) kunjungansales,biayapromosi,feemarketing'
+ asuper
+ ' FROM penjualan2022'
+ afilter
+ ' union '
+ ' SELECT upper(kar_cabang) Cabang,"" Nomor,date_format(tanggal,"%Y-%m-%d") Tanggal,cast(date_format(tanggal,"%m") as signed)  bulan ,'
+ ' cast(date_format(tanggal,"%Y") as signed)  Tahun,cus_nama,"" Kode,"" Nama,0 qty,0 nilai  ,0 kontrak ,"" group_produk, 0 pajak,if(kar_jabatan="Marketing",1,0) ISpf,'
+ ' if(kar_jabatan="Sales Marketing",kar_nama,"") salesman,if(kar_jabatan="Marketing",kar_nama,"") marketing,0 nilaibyHna,0 nilaiblmppn,0 isecer,"" ISn3,"" kategori,"" subdepartemen,"" departemen,'
+ ' cast(if(kar_jabatan="Marketing",1,0) as signed) kunjunganmarketing,cast(if(kar_jabatan="Sales Marketing",1,0) as signed) kunjungansales,0 biayapromosi'

+ asuper2

+ ' FROM zkunjungan x INNER JOIN zkaryawan ON USER=kar_nama'
+ ' INNER JOIN tcabang ON kar_cabang=cbg_nama'
+ ' INNER JOIN customer y ON x.cus_kode=y.cus_kode AND cus_cabang=cbg_kode'
+ ' where tanggal between tg1() and date_add(tg2() , interval 1 day) ';


//  s:='select Cabang,fp_nomor Nomor,fp_tanggal Tanggal,Bulan,Tahun,cus_nama Outlet,fpd_brg_kode Kode,brg_nama Nama,'
//  + '  fpd_qty Qty, Nilai ,Kontrak,Group_Produk,fp_istax Pajak,brg_isProductfocus IsPf,Salesman,Marketing ,fpd_qty*HNA NilaiByHNA,'
//  + '  Nilaiblmppn '
//  + '  from penjualanall where fp_tanggal between '
//  + QuotD(startdate.Date)  + ' and '+ quotd(enddate.date)
//  + ' and fp_cus_kode like '+Quot(edtkode.Text+'%')
//  + ' and brg_nama like '+Quot('%'+edtnamabarang.Text+'%')
//  + afilter ;


        ds3.Close;
        sqlqry1.Connection := frmmenu.conn;
        sqlqry1.SQL.Text := s;
        ds3.open;

//
if frmmenu.KDUSER = 'SUPER' then
        Skolom :='Cabang,Nomor,Tanggal,Bulan,Tahun,Outlet,Kode,Nama,Qty,Nilai,Kontrak,Departemen,SubDepartemen,Kategori,Group_Produk,Pajak,IsPf,Salesman,Marketing,NilaiByHna,Nilaiblmppn,IsN3,Hpp,Margin,kunjunganmarketing,kunjungansales,isecer,Biayapromosi,FeeMarketing'
else
        Skolom :='Cabang,Nomor,Tanggal,Bulan,Tahun,Outlet,Kode,Nama,Qty,Nilai,Kontrak,Departemen,SubDepartemen,Kategori,Group_Produk,Pajak,IsPf,Salesman,Marketing,NilaiByHna,Nilaiblmppn,IsN3,kunjunganmarketing,kunjungansales,isecer,Biayapromosi,FeeMarketing';
        QueryToDBGrid(cxGrid1DBTableView1, s,skolom ,ds2);

           jmlkolom :=cxGrid1DBTableView1.ColumnCount-2;

        for i:=0 To jmlkolom do
        begin
          if ds3.Fields[i].DataType = ftFloat then
          begin
             ds3.Fields[i].Alignment := taRightJustify;
             TFloatField(ds3.Fields[i]).DisplayFormat := '###,###,###';
          end;

        end;
        cxGrid1DBTableView1.Columns[11].Summary.groupFooterKind:=skSum;
        cxGrid1DBTableView1.Columns[11].Summary.groupFooterFormat:='###,###,###,###';


        //  hitung;

          TcxDBPivotHelper(cxPivot).LoadFromCDS(ds3);
           SetPivotColumns(['Bulan']);
           SetPivotRow (['Outlet']);
           SetPivotData(['NilaiBlmPPn']);

end;
procedure TfrmListJual.loaddata2;
var
  asuper2,asuper,skolom,s,smargin: string ;
  afilter : string ;
  i,jmlkolom:integer;
begin

s:='drop table zk';
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);
s:= 'CREATE TABLE zk AS SELECT * FROM zkunjungan ';
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);


   s:='SET @tg1='+QuotD(startdate.DateTime);
   // xExecQuery(s,frmMenu.conn);
    EnsureConnected(frmMenu.conn);
    ExecSQLDirect(frmMenu.conn, s);
   s:='SET @tg2='+QuotD(enddate.DateTime);
   // xExecQuery(s,frmMenu.conn);
    EnsureConnected(frmMenu.conn);
    ExecSQLDirect(frmMenu.conn, s);

if frmmenu.KDUSER = 'SUPER' then
BEGIN
  s:='select Cabang,Nomor,Tanggal,Bulan,Tahun,Outlet,Kode,Nama,Qty,Nilai,Kontrak,Departemen,SubDepartemen,Kategori,Group_Produk,Pajak,IsPf,Salesman,Marketing,NilaiByHna,Nilaiblmppn,IsN3,kunjunganmarketing,kunjungansales, '
  + ' isecer,Biayapromosi,FeeMarketing,(Nilaiblmppn - Kontrak - Biayapromosi-Feemarketing) NilaiNet, '
  + ' hpp,margin-kontrak-biayapromosi-feemarketing margin,JenisCustomer'
  + '  from (select * from tampung2_2022 union select * from tampung2_2023 union select * from tampung2_2024) x '
  + ' left join vfpcus y on y.fp_nomor=x.nomor '
  + ' where tanggal between '+ QuotD2(startdate.Date) + ' and ' + QuotD2(enddate.Date);
 asuper2 := ' ,0 hpp,0 margin,"" JenisCustomer'
END
else
  s:='select * from (select *,(Nilaiblmppn - Kontrak - Biayapromosi-feemarketing) NilaiNet from tampung_2022 union select *, '
  + ' (Nilaiblmppn - Kontrak - Biayapromosi-feemarketing) NilaiNet from tampung_2023 union select *, (Nilaiblmppn - Kontrak - Biayapromosi-feemarketing) NilaiNet from tampung_2024) x '
  + ' left join vfpcus y on y.fp_nomor=x.nomor '
  + ' where tanggal between '+ QuotD2(startdate.Date) + ' and ' + QuotD2(enddate.Date) ;


s:=s  + ' union '
+ ' SELECT upper(kar_cabang) Cabang,"" Nomor,date_format(tanggal,"%Y-%m-%d") Tanggal,cast(date_format(tanggal,"%m") as signed)  bulan ,'
+ ' cast(date_format(tanggal,"%Y") as signed)  Tahun,cus_nama,"" Kode,"" Nama,0 qty,0 nilai  ,0 kontrak ,"" Departemen,"" SubDepartemen,"" Kategori,"" group_produk, 0 pajak,if(kar_jabatan="Marketing",1,0) ISpf,'
+ ' if(kar_jabatan="Sales Marketing",kar_nama,"") salesman,if(kar_jabatan="Marketing",kar_nama,"") marketing,0 nilaibyHna,0 nilaiblmppn,0 isecer,"" ISn3,'
+ ' cast(if(kar_jabatan="Marketing",1,0) as signed) kunjunganmarketing,cast(if(kar_jabatan="Sales Marketing",1,0) as signed) kunjungansales,0 biayapromosi,0 feemarketing,0 nilainet'

+ asuper2

+ ' FROM zk x INNER JOIN zkaryawan ON USER=kar_nama'
+ ' INNER JOIN tcabang ON kar_cabang=cbg_nama'
+ ' INNER JOIN customer y ON x.cus_kode=y.cus_kode AND cus_cabang=cbg_kode'
+ ' where tanggal between tg1() and date_add(tg2() , interval 1 day) ';
        ds3.Close;
        sqlqry1.Connection := frmmenu.conn;
        sqlqry1.SQL.Text := s;
        ds3.open;

if frmmenu.KDUSER = 'SUPER' then
        Skolom :='Cabang,Nomor,Tanggal,Bulan,Tahun,Outlet,Kode,Nama,Qty,Nilai,Kontrak,Departemen,SubDepartemen,Kategori,Group_Produk,Pajak,IsPf,Salesman,Marketing,NilaiByHna,Nilaiblmppn,IsN3,Hpp,Margin, '
        + ' kunjunganmarketing,kunjungansales,isecer,Biayapromosi,FeeMarketing,NilaiNet,JenisCustomer'
else
        Skolom :='Cabang,Nomor,Tanggal,Bulan,Tahun,Outlet,Kode,Nama,Qty,Nilai,Kontrak,Departemen,SubDepartemen,Kategori,Group_Produk,Pajak,IsPf,Salesman,Marketing,NilaiByHna,Nilaiblmppn,IsN3,kunjunganmarketing,kunjungansales,'
        + ' isecer,Biayapromosi,FeeMarketing,NilaiNet,JenisCustomer';
        QueryToDBGrid(cxGrid1DBTableView1, s,skolom ,ds2);

           jmlkolom :=cxGrid1DBTableView1.ColumnCount-2;

        for i:=0 To jmlkolom do
        begin
          if ds3.Fields[i].DataType = ftFloat then
          begin
             ds3.Fields[i].Alignment := taRightJustify;
             TFloatField(ds3.Fields[i]).DisplayFormat := '###,###,###';
          end;

        end;

//
      cxGrid1DBTableView1.Columns[9].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[9].Summary.FooterFormat:='###,###,###,###';
      cxGrid1DBTableView1.Columns[19].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[19].Summary.FooterFormat:='###,###,###,###';
           cxGrid1DBTableView1.Columns[20].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[20].Summary.FooterFormat:='###,###,###,###';
if frmmenu.KDUSER = 'SUPER' then
BEGIN
        cxGrid1DBTableView1.Columns[22].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[22].Summary.FooterFormat:='###,###,###,###';
        cxGrid1DBTableView1.Columns[23].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[23].Summary.FooterFormat:='###,###,###,###';
              cxGrid1DBTableView1.Columns[28].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[28].Summary.FooterFormat:='###,###,###,###';

end
else
begin
        cxGrid1DBTableView1.Columns[26].Summary.FooterKind:=skSum;
        cxGrid1DBTableView1.Columns[26].Summary.FooterFormat:='###,###,###,###';
end;

          TcxDBPivotHelper(cxPivot).LoadFromCDS(ds3);
           SetPivotColumns(['Bulan']);
           SetPivotRow (['Outlet']);
           SetPivotData(['NilaiBlmPPn']);


end;

procedure TfrmListJual.btnTampilClick(Sender: TObject);
begin
  if chkTampung.Checked then
      loaddata2
  else
    loaddata;

  end;

procedure TfrmListJual.cxPageControl1Click(Sender: TObject);
begin
IF PageControl1.Pages[2].Visible  then
begin
  PivotChartLink.GridChartView := cxGrdChart;
  PivotChartLink.PivotGrid := cxPivot;
end;
end;

procedure TfrmListJual.TeSpeedButton1Click(Sender: TObject);
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


procedure TfrmListJual.dttanggalChange(Sender: TObject);
begin
  enddate.DateTime := startdate.DateTime;
end;

function TfrmListJual.GetPivotChartLink: TcxPivotGridChartConnection;
begin
  If not Assigned(FPivotChartLink) then
    FPivotChartLink := TcxPivotGridChartConnection.Create(Self);
  Result := FPivotChartLink;
end;

procedure TfrmListJual.TeSpeedButton2Click(Sender: TObject);
begin
//  IF PageControl1.Pages[1].Visible  then
//     cxVCLPrinterPivot.Preview
//  else
//  if PageControl1.Pages[2].Visible  then
//    cxVCLPrinterChart.Preview;
end;

procedure TfrmListJual.SetPivotRow(ColumnSets: Array Of String);
begin
  TcxDBPivotHelper(cxPivot).SetRowColumns(ColumnSets);
end;

procedure TfrmListJual.SetPivotColumns(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetColColumns(ColumnSets);
end;

procedure TfrmListJual.SetPivotData(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetDataColumns(ColumnSets);
end;


procedure TfrmListJual.cxButton1Click(Sender: TObject);
begin
  With cxPivot.GetFieldByName('Outlet') do
  begin
    if SortBySummaryInfo.Field = nil then
    begin
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Nilai');
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('NilaiBlmPpn');
    end
    else
      SortBySummaryInfo.Field := nil;
  end;
  With cxPivot.GetFieldByName('salesman') do
  begin
    if SortBySummaryInfo.Field = nil then
       begin
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Nilai');
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('NilaiBlmPpn');
    end
    else
      SortBySummaryInfo.Field := nil;
  end;
    With cxPivot.GetFieldByName('marketing') do
  begin
    if SortBySummaryInfo.Field = nil then
      begin
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Nilai');
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('NilaiBlmPpn');
    end
    else
      SortBySummaryInfo.Field := nil;
  end;


    With cxPivot.GetFieldByName('Cabang') do
  begin
    if SortBySummaryInfo.Field = nil then
      begin
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Nilai');
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('NilaiBlmPpn');
    end
    else
      SortBySummaryInfo.Field := nil;
  end;
     With cxPivot.GetFieldByName('Group_Produk') do
  begin
    if SortBySummaryInfo.Field = nil then
   begin
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Nilai');
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('NilaiBlmPpn');
    end
    else
      SortBySummaryInfo.Field := nil;
  end;
     With cxPivot.GetFieldByName('Kategori') do
  begin
    if SortBySummaryInfo.Field = nil then
      begin
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Nilai');
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('NilaiBlmPpn');
    end
    else
      SortBySummaryInfo.Field := nil;
  end;
     With cxPivot.GetFieldByName('SubDepartemen') do
  begin
    if SortBySummaryInfo.Field = nil then
      begin
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Nilai');
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('NilaiBlmPpn');
    end
    else
      SortBySummaryInfo.Field := nil;
  end;

       With cxPivot.GetFieldByName('Departemen') do
  begin
    if SortBySummaryInfo.Field = nil then
       begin
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Nilai');
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('NilaiBlmPpn');
    end
    else
      SortBySummaryInfo.Field := nil;
  end;
  With cxPivot.GetFieldByName('Nama') do
  begin
    if SortBySummaryInfo.Field = nil then
       begin
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Nilai');
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('NilaiBlmPpn');
    end
    else
      SortBySummaryInfo.Field := nil;
  end;
end;

procedure TfrmListJual.edtkodeClickBtn(Sender: TObject);
var
  s:String;
  tsql:TmyQuery;
begin
   sqlbantuan:='select cus_kode Kode,cus_nama Customer,cus_alamat Alamat from customer';
   Application.CreateForm(Tfrmbantuan,frmbantuan);
   frmBantuan.SQLMaster := SQLbantuan;
   frmBantuan.ShowModal;


   if varglobal <> '' then
   begin
     edtkode.Text := varglobal;
     edtNama.Text := varglobal1;
   end;


end;


procedure TfrmListJual.cxButton2Click(Sender: TObject);
var
  s:String;
begin
  s:='call inserttampungan('+QuotD(startdate.DateTime)+','+quotd(enddate.datetime)+');';
  // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);
  ShowMessage('proses selesai');
end;

end.
