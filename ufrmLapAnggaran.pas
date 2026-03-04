unit ufrmLapAnggaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,  AdvGrid, ComCtrls, StdCtrls, AdvEdit, ExtCtrls,
  AdvPanel, AdvCGrid, BaseGrid,SqlExpr, DBAdvGrd, DB, DBClient, Provider,
  FMTBcd, RAWPrinter, StrUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxSpinEdit, cxCalendar, Menus, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxButtonEdit, cxCurrencyEdit,ExcelXP,ComObj,
  AdvCombo,DateUtils, cxPC, cxGridBandedTableView, cxGridDBBandedTableView,
  cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxDBTL, cxTLData, MyAccess,
  MemDS, DBAccess;

type
  TfrmLapAnggaran = class(TForm)
    AdvPanel1: TAdvPanel;
    lbljudul: TLabel;
    AdvPanel2: TAdvPanel;
    AdvPanel3: TAdvPanel;
    Label3: TLabel;
    RAWPrinter1: TRAWPrinter;
    AdvPanel4: TAdvPanel;
    cxButton8: TcxButton;
    PopupMenu1: TPopupMenu;
    HapusRecord1: TMenuItem;
    OpenDialog1: TOpenDialog;
    edtTahun: TComboBox;
    Button2: TButton;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    MainMenu1: TMainMenu;
    cxButton7: TcxButton;
    SaveDialog1: TSaveDialog;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dtstprvdr1: TDataSetProvider;
    ds2: TDataSource;
    ds3: TClientDataSet;
    sqlqry2: TSQLQuery;
    cxStyle3: TcxStyle;
    Label1: TLabel;
    cbbBulan: TAdvComboBox;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    SQLQuery2: TSQLQuery;
    MainMenu2: TMainMenu;
    cxDBtreelist1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn6: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn7: TcxDBTreeListColumn;
    cxDBTreeList2: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListColumn5: TcxDBTreeListColumn;
    cxDBTreeListColumn6: TcxDBTreeListColumn;
    savedlg: TSaveDialog;
    sqlqry1: TMyQuery;
    SQLQuery1: TMyQuery;
    procedure Button2Click(Sender: TObject);
    procedure loaddata ;
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    function GetCDS: TClientDataSet;
    function GetCDS2: TClientDataSet;

    procedure FormCreate(Sender: TObject);
    procedure initgrid;
    procedure cxDBTreeList1cxDBTreeListColumn4TcxTreeListColumnSummaryFooterSummaryItems0GetText(
      Sender: TcxTreeListSummaryItem; const AValue: Variant;
      var AText: String);
    function getparentid(akode:string): integer;
    private
     buttonSelected  : integer;
     FID : STRING;
     FFLAGEDIT: Boolean;
     xtotal : Double;
      { Private declarations }
     protected
        FCDS: TClientDataSet;
        FCDS2: TClientDataSet;
  public
     property CDS: TClientDataSet read GetCDS write FCDS;
     property CDS2: TClientDataSet read GetCDS2 write FCDS2;
    property ID: string read FID write FID;
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    { Public declarations }
  end;

var
  frmLapAnggaran: TfrmLapAnggaran;

implementation

uses MAIN,uModuleConnection,uFrmbantuan,Ulib,uReport,cxgridExportlink,cxTLExportLink;

{$R *.dfm}


procedure TfrmLapAnggaran.Button2Click(Sender: TObject);
begin
loaddata;
end;

procedure TfrmLapAnggaran.loaddata ;
var
  s,ssql :string;
  tsql : TmyQuery;
  akhir,awal : TDateTime;
  aparentid,atahunlalu,abulanlalu,i:integer;

  atotal :Double;
begin
  if cbbBulan.itemindex+1 = 1 then
  begin
    atahunlalu := StrToInt(edtTahun.Text)-1 ;
    abulanlalu := 12;
  end
  else
  begin
    atahunlalu := StrToInt(edtTahun.Text) ;
    abulanlalu := cbbBulan.itemindex;
  end;
    akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text));
    awal  :=StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text);

  ssql := 'delete from tampunganggaran ';
  // xExecQuery(ssql,frmMenu.conn);
  EnsureConnected(frmMenu.conn);
  ExecSQLDirect(frmMenu.conn, ssql);
  // xCommit(frmMenu.conn);
  ssql := 'alter table tampunganggaran AUTO_INCREMENT=1 ';
  // xExecQuery(ssql,frmMenu.conn);
  EnsureConnected(frmMenu.conn);
  ExecSQLDirect(frmMenu.conn, ssql);
  // xCommit(frmMenu.conn);

// piutang
  ssql := 'select cbg_nama,cbg_database,cbg_kode from tcabang where cbg_aktif=0';
  tsql := xOpenQuery(ssql,frmMenu.conn);

  with tsql do
  begin
    try
      while not Eof do
      begin
        s:='insert into tampunganggaran (grup,keterangan,target,realisasi,status,ratio) select "Piutang" Grup, "Piutang '+fields[0].AsString+' ",sum(piutang),sum(inkaso),0,sum(inkaso)/sum(piutang)*100 from ( '
              +  ' SELECT salesman, SUM(IF (( '
              +  ' SELECT COUNT(*) '
              +  ' FROM '+fields[1].AsString+'.tjatuhtempofp'
              +  ' WHERE jt_fp_nomor=nomor) > 0, ('
              +  ' SELECT SUM(jt_nilai)'
              +  ' FROM '+fields[1].AsString+'.tjatuhtempofp'
              +  ' WHERE jt_fp_nomor=nomor AND jt_tanggaljt <= '+quotd(akhir)+'), total)) - IFNULL(('
              +  ' SELECT SUM(bayar_cash+bayar_transfer+giro+potongan+ppn+pph- IFNULL(('
              +  ' SELECT SUM(bycd_bayar)'
              +  ' FROM '+fields[1].AsString+'.tbayarcus_dtl'
              +  ' INNER JOIN '+fields[1].AsString+'.tfp_hdr ON fp_nomor=bycd_fp_nomor and fp_nomor like '+ Quot(Fields[2].AsString+'%')
              +  ' WHERE bycd_byc_nomor=xx.nomor AND fp_jthtempo > '+quotd(akhir)+'),0))'
              +  ' FROM '+fields[1].AsString+'.pembayaran xx'
              +  ' WHERE salesman=a.salesman  AND tanggal < '+quotd(awal)+'),0) - IFNULL(('
              +  ' SELECT SUM(retur)'
              +  ' FROM '+fields[1].AsString+'.retur '
              +  ' WHERE salesman=a.salesman AND tanggal < '+quotd(awal)+'),0) piutang,'
              +  ' (SELECT SUM(bycd_bayar)'
              +  ' FROM '+fields[1].AsString+'.tbayarcus_dtl'
              +  ' INNER JOIN '+fields[1].AsString+'.tbayarcus_hdr ON byc_nomor=bycd_byc_nomor'
              +  ' INNER JOIN '+fields[1].AsString+'.tfp_hdr ON fp_nomor=bycd_fp_nomor and fp_nomor like '+ Quot(Fields[2].AsString+'%')
              +  ' INNER JOIN '+fields[1].AsString+'.tdo_hdr ON do_nomor=fp_do_nomor'
              +  ' INNER JOIN '+fields[1].AsString+'.tso_hdr ON so_nomor=do_so_nomor'
              +  ' WHERE so_sls_kode=a.salesman AND fp_tanggal < '+quotd(awal)+' AND fp_jthtempo > '+quotd(akhir)+' AND MONTH(byc_tanggal)='+IntToStr(cbbBulan.itemindex+1)+') tunai2, ('
              +  ' SELECT SUM(IFNULL(bayar_cash,0)+ IFNULL(bayar_transfer,0)+ IFNULL(giro,0)+ IFNULL(potongan,0)+ IFNULL(pph,0)+ IFNULL(ppn,0))'
              +  ' FROM '+fields[1].AsString+'.pembayaran '
              +  ' WHERE MONTH(tanggal)='+IntToStr(cbbBulan.itemindex+1)+' AND YEAR(tanggal)='+edttahun.text+' AND salesman=a.salesman) inkaso'
              +  ' FROM '+fields[1].AsString+'.penjualan a'
              +  ' INNER JOIN '+fields[1].AsString+'.tfp_hdr ON fp_nomor=nomor ' // and fp_nomor like '+ Quot(Fields[2].AsString+'%')
              +  ' WHERE tanggal < '+ quotd(awal)+ ' AND fp_jthtempo <= '+quotd(akhir)
              +  ' GROUP BY salesman) a WHERE Salesman <> "SLS-999"';
             // xExecQuery(s,frmMenu.conn);
            EnsureConnected(frmMenu.conn);
            ExecSQLDirect(frmMenu.conn, s);
             // xCommit(frmMenu.conn);

             aparentid := getparentid('Piutang '+fields[0].AsString);
             s:=' insert into tampunganggaran (grup,keterangan,target,realisasi,status,ratio,parent_id)  '
              + ' SELECT "Piutang '+fields[0].AsString+'" Grup, cus_nama customer, IF(piutang<0,0,PIUTANG) piutang, ifnull(inkaso,0) inkaso ,0, ifnull(inkaso,0)/ IF(piutang<0,0,PIUTANG) *100,'+IntToStr(aparentid)
              + ' FROM ('
              + ' SELECT customer, SUM(IF (('
              + ' SELECT COUNT(*)'
              + ' FROM '+fields[1].AsString+'.tjatuhtempofp'
              + ' WHERE jt_fp_nomor=nomor) > 0, ('
              + ' SELECT SUM(jt_nilai)'
              + ' FROM '+fields[1].AsString+'.tjatuhtempofp'
              + ' WHERE jt_fp_nomor=nomor AND jt_tanggaljt <= '+quotd(akhir)+'), total)) - IFNULL(('
              + ' SELECT SUM(bayar_cash+bayar_transfer+giro+potongan+ppn+pph- IFNULL(('
              + ' SELECT SUM(bycd_bayar)'
              + ' FROM '+fields[1].AsString+'.tbayarcus_dtl'
              + ' INNER JOIN '+fields[1].AsString+'.tfp_hdr ON fp_nomor=bycd_fp_nomor and fp_nomor like '+ Quot(Fields[2].AsString+'%')
              + ' WHERE bycd_byc_nomor=xx.nomor AND fp_jthtempo > '+quotd(akhir)+'),0))'
              + ' FROM '+fields[1].AsString+'.pembayaran xx'
              + ' WHERE customer=a.customer '
              + ' AND tanggal < '+quotd(awal)+'),0) - IFNULL(('
              + ' SELECT SUM(retur)'
              + ' FROM '+fields[1].AsString+'.retur'
              + ' WHERE customer=a.customer '
              + ' AND tanggal < '+quotd(awal)+'),0) piutang, ('
              + ' SELECT SUM(bycd_bayar)'
              + ' FROM '+fields[1].AsString+'.tbayarcus_dtl'
              + ' INNER JOIN '+fields[1].AsString+'.tbayarcus_hdr ON byc_nomor=bycd_byc_nomor'
              + ' INNER JOIN '+fields[1].AsString+'.tfp_hdr ON fp_nomor=bycd_fp_nomor and fp_nomor like '+ Quot(Fields[2].AsString+'%')
              + ' WHERE fp_cus_kode=a.customer AND fp_tanggal < '+quotd(awal)+' AND fp_jthtempo > '+quotd(akhir)+' AND MONTH(byc_tanggal)='+IntToStr(cbbBulan.itemindex+1)+') tunai2, ('
              + ' SELECT SUM(IFNULL(bayar_cash,0)+ IFNULL(bayar_transfer,0)+ IFNULL(giro,0)+ IFNULL(potongan,0)+ IFNULL(pph,0)+ IFNULL(ppn,0))'
              + ' FROM '+fields[1].AsString+'.pembayaran'
              + ' WHERE MONTH(tanggal)='+IntToStr(cbbBulan.itemindex+1)+' AND YEAR(tanggal)= '+edttahun.text+' AND customer=a.customer) inkaso'
              + ' FROM '+fields[1].AsString+'.penjualan a'
              + ' INNER JOIN '+fields[1].AsString+'.tfp_hdr ON fp_nomor=nomor '
              + ' WHERE tanggal < '+quotd(awal)+' AND fp_jthtempo <= '+quotd(akhir)
              + ' AND a.salesman <> "SLS-999" '
              + ' GROUP BY customer'
              + ' ) a inner join '+fields[1].AsString+'.tcustomer on customer =cus_kode'
              + ' where ifnull(inkaso,0) > 1 or ifnull(piutang,0) > 1 '
              + ' union '
              + ' select GRUP,KETERANGAN,TARGET,INKASO,STATUS,TARGET/INKASO*100,'+IntToStr(aparentid)+ ' FROM ('
              + ' select "Piutang Solo" GRUP,cus_nama KETERANGAN,0 TARGET,'
              + ' ('
              + ' SELECT SUM(IFNULL(bayar_cash,0)+ IFNULL(bayar_transfer,0)+ IFNULL(giro,0)+ IFNULL(potongan,0)+ IFNULL(pph,0)+ IFNULL(ppn,0))'
              + ' FROM '+fields[1].AsString+'.pembayaran'
              + ' WHERE MONTH(tanggal)='+IntToStr(cbbBulan.itemindex+1)+' AND YEAR(tanggal)= '+edttahun.text+' AND customer=a.cus_kode) inkaso,0 STATUS'
              + ' from '+fields[1].AsString+'.tcustomer a'
              + ' where cus_kode not in (select distinct customer from '+fields[1].AsString+'.penjualan'
              + ' WHERE tanggal < '+quotd(awal)+' ) ) A WHERE IFNULL(INKASO ,0) > 0';
             // xExecQuery(s,frmMenu.conn);
            EnsureConnected(frmMenu.conn);
            ExecSQLDirect(frmMenu.conn, s);
             // xCommit(frmMenu.conn);

        Next;
      end;
    finally
      Free;
    end;
  end;
// hutang

   s:='insert into tampunganggaran  (grup,keterangan,target,realisasi,status,ratio) SELECT grup,Keterangan,ifnull(Target,0) Target,ifnull(Realisasi,0) Realisasi,1,ifnull(Realisasi,0)/ifnull(Target,0)*100 Ratio FROM ( '
      + ' select if(sup_internal=1,"Hutang Internal ","Hutang External") Grup,SUP_NAMA Keterangan,sum((select sum(sisa_hutang-ifnull(bayar,0)-ifnull(retur,0)) target from ('
      +  ' SELECT *'
      +  ' FROM ('
      +  ' SELECT inv_Nomor Nomor,inv_tanggal Tanggal,inv_jthtempo JthTempo, IF(inv_istax=1,"PPN","Non PPN") Tax,'
      +  ' inv_sup_kode Kode,sup_nama Supplier,'
      +  ' inv_nobukti NoBukti,inv_amount Total,inv_amount sisa_hutang,'
      +  ' (select sum(bysd_bayar) from tbayarsuP_dtl inner join tbayarsup_hdr on bys_nomor=bysd_bys_nomor'
      +  ' inner join tinv_hdr on bysd_inv_nomor=inv_nomor'
      +  ' where bys_tanggal  < '+ quotd(awal)+ ' and bysd_inv_nomor=z.inv_nomor)'
      +  ' bayar, ('
      +  ' SELECT SUM(ret_amount)'
      +  ' FROM tret_hdr'
      +  ' WHERE ret_inv_nomor =z.inv_nomor) Retur, DATEDIFF('+quotd(akhir)+',inv_jthtempo) Overdue'
      +  ' FROM tinv_hdr z'
      +  ' inner JOIN tsupplier zz ON inv_sup_kode=sup_kode'
      +  ' ) final WHERE Overdue >=0 and tanggal < '+quotd(awal)+' )  final2 where kode=zz.sup_kode)) Target,'
      +  ' sum((SELECT sum(bys_nilai) FROM TBAYARSUP_HDR inner join tsupplier on sup_kode=bys_sup_kode'
      +  ' where bys_tanggal between '+quotd(awal)+' and '+quotd(akhir)+' and bys_sup_kode=zz.SUP_Kode)) Realisasi'
      +  ' from tsupplier zz'
//      +  ' where sup_internal=1'
      +  ' group by sup_kode) FINAL2'
      +  ' WHERE ifnull(TARGET,0) > 0 or ifnull(realisasi,0) > 0';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);

 // biaya
     s:= 'insert into tampunganggaran  (grup,keterangan,target,realisasi,status,ratio) '
       + ' select grup,keterangan,target,realisasi,status,realisasi/target*100 ratio from ('
        + ' SELECt "Biaya Biaya" Grup,rek_nama Keterangan,'
        + ' ( SELECt sum(jurd_debet-jurd_kredit) from tjurnalitem'
        + ' inner join tjurnal on jur_no=jurd_jur_no'
        + ' inner join trekening on rek_kode=jurd_rek_kode'
        + ' where month(jur_tanggal)='+inttostr(abulanlalu)+' and year(jur_tanggal)='+ IntToStr(atahunlalu)
        + ' and rek_kode=zz.rek_kode) target,'
        + ' ( SELECt sum(jurd_debet-jurd_kredit) from tjurnalitem'
        + ' inner join tjurnal on jur_no=jurd_jur_no'
        + ' inner join trekening on rek_kode=jurd_rek_kode'
        + ' where month(jur_tanggal)='+inttostr(cbbBulan.itemindex+1)+' and year(jur_tanggal)='+edtTahun.Text
        + ' and rek_kode=zz.rek_kode) realisasi,1 status'
        + ' from trekening zz where rek_kol_id in (12,13)'
        + ' order by rek_urutan) a'
        + ' where realisasi is not null or target is not null';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);

//hutang pada pihak ke 3
     s:= 'insert into tampunganggaran  (grup,keterangan,target,realisasi,status,ratio) '
       + ' select grup,keterangan,target,realisasi,status,realisasi/target*100 ratio from ('
        + ' SELECt "Pihak Ke 3" Grup,rek_nama Keterangan,'
        + ' ( SELECt sum(jurd_debet-jurd_kredit) from tjurnalitem'
        + ' inner join tjurnal on jur_no=jurd_jur_no'
        + ' inner join trekening on rek_kode=jurd_rek_kode'
        + ' where month(jur_tanggal)='+inttostr(abulanlalu)+' and year(jur_tanggal)='+ IntToStr(atahunlalu)
        + ' and rek_kode=zz.rek_kode) target,'
        + ' ( SELECt sum(jurd_debet-jurd_kredit) from tjurnalitem'
        + ' inner join tjurnal on jur_no=jurd_jur_no'
        + ' inner join trekening on rek_kode=jurd_rek_kode'
        + ' where month(jur_tanggal)='+inttostr(cbbBulan.itemindex+1)+' and year(jur_tanggal)='+edtTahun.Text
        + ' and rek_kode=zz.rek_kode) realisasi,1 status'
        + ' from trekening zz where rek_kode like ' + Quot('19.003%')
        + ' order by rek_urutan) a'
        + ' where realisasi is not null or target is not null';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);

      s := 'insert into tampunganggaran (grup,keterangan,target,realisasi,status,ratio)'
          + ' select grup,grup,sum(target),sum(realisasi),status,sum(realisasi)/sum(target)*100  from tampunganggaran '
          + ' where parent_id is null '
          + ' group by grup';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);

      s:= 'update tampunganggaran set parent_id=id+1000 where grup=keterangan ';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);

      s:= 'update tampunganggaran z'
        + ' inner join (select * from tampunganggaran where grup=keterangan) a on z.grup=a.grup'
        + ' set z.parent_id=a.id'
        + ' where z.parent_id is null';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);

      s:='insert into tampunganggaran (grup,keterangan,target,realisasi,status,ratio)'
        + ' select "All" ,"All Anggaran",sum(target),sum(realisasi),status,sum(realisasi)/sum(target) *100  from tampunganggaran where grup=keterangan and status=1';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);
      s:='update tampunganggaran set parent_id=id+2000 where grup="All"';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);
      s:='update tampunganggaran z'
        + ' inner join (select * from tampunganggaran where grup="All") a on 1=1'
        + ' set z.parent_id=a.id'
        + ' where z.grup=z.keterangan';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);
      s:='insert into tampunganggaran (grup,keterangan,target,realisasi,Status,ratio,parent_id) '
        + ' select "Hutang","Hutang",suM(TARGET),SUM(REALISASI),1,SUM(REALISASI)/SUM(TARGET)*100,PARENT_ID from tampunganggaran where keterangan like "Hutang%"';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);
      s:= ' update tampunganggaran z '
        + ' inner join (select * from tampunganggaran where grup="Hutang") a on 1=1'
        + ' set z.parent_id=a.id'
        + ' where z.keterangan in ("Hutang External","Hutang Internal")';
      // xExecQuery(s,frmMenu.conn);
      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
      // xCommit(frmMenu.conn);

    initgrid;

//    external
//     s:='insert into tampunganggaran  SELECT Keterangan,Target,Realisasi,1,Realisasi/Target*100 Ratio FROM ( '
//      + ' select concat("Hutang Supplier External ",SUP_NAMA) Keterangan,sum((select sum(sisa_hutang-ifnull(bayar,0)-ifnull(retur,0)) target from ('
//      +  ' SELECT *'
//      +  ' FROM ('
//      +  ' SELECT inv_Nomor Nomor,inv_tanggal Tanggal,inv_jthtempo JthTempo, IF(inv_istax=1,"PPN","Non PPN") Tax,'
//      +  ' inv_sup_kode Kode,sup_nama Supplier,'
//      +  ' inv_nobukti NoBukti,inv_amount Total,inv_amount sisa_hutang,'
//      +  ' (select sum(bysd_bayar) from tbayarsuP_dtl inner join tbayarsup_hdr on bys_nomor=bysd_bys_nomor'
//      +  ' inner join tinv_hdr on bysd_inv_nomor=inv_nomor'
//      +  ' where bys_tanggal  < '+ quotd(awal)+ ' and bysd_inv_nomor=z.inv_nomor)'
//      +  ' bayar, ('
//      +  ' SELECT SUM(ret_amount)'
//      +  ' FROM tret_hdr'
//      +  ' WHERE ret_inv_nomor =z.inv_nomor) Retur, DATEDIFF('+quotd(akhir)+',inv_jthtempo) Overdue'
//      +  ' FROM tinv_hdr z'
//      +  ' inner JOIN tsupplier zz ON inv_sup_kode=sup_kode'
//      +  ' ) final WHERE Overdue >=0 and tanggal < '+quotd(awal)+' )  final2 where kode=zz.sup_kode)) Target,'
//      +  ' sum((SELECT sum(bys_nilai) FROM TBAYARSUP_HDR inner join tsupplier on sup_kode=bys_sup_kode'
//      +  ' where bys_tanggal between '+quotd(awal)+' and '+quotd(akhir)+' and bys_sup_kode=zz.SUP_Kode)) Realisasi'
//      +  ' from tsupplier zz'
//      +  ' where sup_internal=0'
//      +  ' group by sup_kode) FINAL2';
//      // xExecQuery(s,frmMenu.conn);
//        EnsureConnected(frmMenu.conn);
//        ExecSQLDirect(frmMenu.conn, s);
//      xCommit(frmMenu.conn);


end;

procedure TfrmLapAnggaran.cxButton7Click(Sender: TObject);
begin
  if SaveDlg.Execute then
  begin
      cxExportTLToExcel(SaveDlg.FileName,  cxDBtreelist2);
      showmessage('Data PEMASUKAN berhasil diexport ');
  END;
  if SaveDlg.Execute then
  begin
      cxExportTLToExcel(SaveDlg.FileName,  cxDBtreelist1);
      showmessage('Data ANGGARAN berhasil diexport ');
  END;
end;



procedure TfrmLapAnggaran.cxButton8Click(Sender: TObject);
begin
Release;
end;

function Tfrmlapanggaran.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'id', ftInteger, False);
    zAddField(FCDS, 'parent_id', ftInteger, False);
    zAddField(FCDS, 'grup', ftstring, False, 100);
    zAddField(FCDS, 'Keterangan', ftstring, False, 200);
    zAddField(FCDS, 'Target', ftfloat, False);
    zAddField(FCDS, 'Realisasi', ftfloat, False);
    zAddField(FCDS, 'Ratio', ftfloat, False);

    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function Tfrmlapanggaran.GetCDS2: TClientDataSet;
begin
  If not Assigned(FCDS2) then
  begin
    FCDS2 := TClientDataSet.Create(Self);
    zAddField(FCDS2, 'id', ftInteger, False);
    zAddField(FCDS2, 'parent_id', ftInteger, False);
    zAddField(FCDS2, 'grup', ftstring, False, 100);
    zAddField(FCDS2, 'Keterangan', ftstring, False, 200);
    zAddField(FCDS2, 'Target', ftfloat, False);
    zAddField(FCDS2, 'Realisasi', ftfloat, False);
    zAddField(FCDS2, 'Ratio', ftfloat, False);

    FCDS2.CreateDataSet;
  end;
  Result := FCDS2;
end;

procedure TfrmLapAnggaran.FormCreate(Sender: TObject);
begin
   TcxDBTreeHelper(cxDBTreeList1).LoadFromCDS(CDS,'id','parent_id', False);
   TcxDBTreeHelper(cxDBTreeList2).LoadFromCDS(CDS2,'id','parent_id', False);
end;

procedure TfrmLapAnggaran.initgrid;
var
  s:string;
  tsql:TmyQuery;
  AColumn: TcxDBTreeListColumn;
  AProperties: TcxDateEditProperties;

begin
      CDS.EmptyDataSet;
      s:=' select grup,keterangan,target,realisasi,ratio,id,parent_id from tampunganggaran where status=1 order by id desc';
     tsql := xOpenQuery(s,frmMenu.conn) ;
     with tsql do
     begin
       try
         while not Eof do
         begin
            CDS.Append;
            CDS.FieldByName('grup').asstring    := Fields[0].asstring;
            CDS.FieldByName('keterangan').AsString     := Fields[1].AsString;
            CDS.FieldByName('target').AsFloat  := Fields[2].AsFloat;
            CDS.FieldByName('realisasi').AsFloat  := Fields[3].AsFloat;
            CDS.FieldByName('ratio').AsFloat  := Fields[4].AsFloat;
            CDS.FieldByName('id').asinteger  := Fields[5].asinteger;
            CDS.FieldByName('parent_id').asinteger  := Fields[6].asinteger;

            CDS.Post;

           Next;
         end;
       finally
         free;
       end;
     end;

      CDS2.EmptyDataSet;
      s:=' select grup,keterangan,target,realisasi,ratio,id,parent_id from tampunganggaran where status=0 order by grup';
     tsql := xOpenQuery(s,frmMenu.conn) ;
     with tsql do
     begin
       try
         while not Eof do
         begin
            CDS2.Append;
            CDS2.FieldByName('grup').asstring    := Fields[0].asstring;
            CDS2.FieldByName('keterangan').AsString     := Fields[1].AsString;
            CDS2.FieldByName('target').AsFloat  := Fields[2].AsFloat;
            CDS2.FieldByName('realisasi').AsFloat  := Fields[3].AsFloat;
            CDS2.FieldByName('ratio').AsFloat  := Fields[4].AsFloat;
            CDS2.FieldByName('id').asinteger  := Fields[5].asinteger;
            CDS2.FieldByName('parent_id').asinteger  := Fields[6].asinteger;

            CDS2.Post;

           Next;
         end;
       finally
         free;
       end;
     end;

end;


procedure TfrmLapAnggaran.cxDBTreeList1cxDBTreeListColumn4TcxTreeListColumnSummaryFooterSummaryItems0GetText(
  Sender: TcxTreeListSummaryItem; const AValue: Variant;
  var AText: String);
  var
    capaibulanini :double;
begin
  capaibulanini := 0;
  try
    if cVarToFloat(TcxDBTreeHelper(cxDBTreeList1).GetFooterSummary('Target')) > 0  then
            capaibulanini :=cVarToFloat(TcxDBTreeHelper(cxDBTreeList1).GetFooterSummary('realisasi'))/ cVarToFloat(TcxDBTreeHelper(cxDBTreeList1).GetFooterSummary('Target'))*100;
    AText := FormatFloat('###.##',capaibulanini);
  except
  end;
end;


function Tfrmlapanggaran.getparentid(akode:string): integer;
var
  s:string;
  tsql :TmyQuery;
begin
  result :=0;
  s:='select id from tampunganggaran where keterangan='+ Quot(akode) ;
  tsql := xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
      if not eof then
      Result :=Fields[0].AsInteger;
    finally
      Free;
    end;
  end;

end;

end.
