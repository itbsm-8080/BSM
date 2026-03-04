unit ufrmAmbilDataPenjualan;

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
  AdvCombo,DateUtils, cxPC, DBAccess, MyAccess;

type
  TfrmAmbilDataPenjualan = class(TForm)
    AdvPanel1: TAdvPanel;
    lbljudul: TLabel;
    AdvPanel2: TAdvPanel;
    Label3: TLabel;
    Label5: TLabel;
    RAWPrinter1: TRAWPrinter;
    AdvPanel4: TAdvPanel;
    cxButton8: TcxButton;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    PopupMenu1: TPopupMenu;
    HapusRecord1: TMenuItem;
    OpenDialog1: TOpenDialog;
    cbbBulan: TAdvComboBox;
    edtTahun: TComboBox;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    MainMenu1: TMainMenu;
    Label1: TLabel;
    cxExtLookupCabang: TcxExtLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function GetCDSCabang: TClientDataset;
    procedure cxExtLookupCabangPropertiesEditValueChanged(Sender: TObject);
    private
        FCDScabang: TClientDataset;
        conn1 : TMyConnection;
        acabang : string;
      { Private declarations }
     protected
  public
    property CDSCabang: TClientDataset read GetCDSCabang write FCDSCabang;
    { Public declarations }
  end;

var
  frmAmbilDataPenjualan: TfrmAmbilDataPenjualan;

implementation

uses MAIN,uModuleConnection,uFrmbantuan,Ulib,uReport;

{$R *.dfm}

procedure TfrmAmbilDataPenjualan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TfrmAmbilDataPenjualan.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     SelectNext(ActiveControl,True,True);
end;



procedure TfrmAmbilDataPenjualan.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmAmbilDataPenjualan.cxButton1Click(Sender: TObject);
var
  s:string;
  akhir : TDateTime;
  tsql:TmyQuery;
    tt:TStrings;
    i:integer;
begin
  akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text));
s:='SELECT '+Quot(acabang)+'CABANG,fp_nomor,fp_tanggal,fp_istax,MONTH(fp_tanggal) Bulan,YEAR(fp_tanggal) Tahun,fp_cus_kode,fpd_brg_kode,'
+ ' brg_nama,'
+ ' sum((fpd_qty-ifnull(retjd_qty,0))) Qty,fpd_harga,sum((100-fpd_discpr)*(fpd_harga*(fpd_qty-ifnull(retjd_qty,0)))/100*if(fp_istax=1,if(fp_tanggal<"2022/04/01",1.1,1.11),1)) Nilai,'
+ ' sum((100-fpd_discpr)*(fpd_harga*(fpd_qty-ifnull(retjd_qty,0)))/100) Nilai_Belum_ppn,'
+ ' brg_isproductfocus,cus_nama ,(SELECT sls_nama FROM tsalesman INNER join tsalescustomer ON sls_kode=sc_sls_kode where sc_cus_kode=fp_cus_kode) Marketing'
+ ' ,(SELECT pmh_nama FROM tprodukmarketing_hdr  INNER JOIN tprodukmarketing_dtl ON pmd_pmh_nomor=pmh_nomor where pmd_brg_kode=brg_kode limit 1) Group_produk'
+ ' ,fpd_cn*((100-fpd_discpr)*fpd_harga/100)*(fpd_qty)/100 Kontrak,sls_nama salesman'
+ ' FROM tfp_hdr INNER JOIN tfp_dtl ON fp_nomor=fpd_fp_nomor'
+ ' INNER JOIN tbarang ON brg_kode=fpd_brg_kode'
+ ' INNER JOIN tcustomer ON cus_kode=fp_cus_kode'
+ ' LEFT JOIN Tretj_hdr on retj_fp_nomor=fp_nomor'
+ ' left join tretj_dtl on retjd_retj_nomor=retj_nomor and retjd_brg_kode=fpd_brg_kode and fpd_expired=retjd_expired'
+ ' left join tdo_hdr on fp_do_nomor=do_nomor'
+ ' left join tso_hdr on do_so_nomor=so_nomor'
+ ' left join tsalesman on sls_kode = so_sls_kode'
+ ' where month(fp_tanggal)='+IntToStr(cbbBulan.ItemIndex+1)
+ ' and year(fp_tanggal)='+ edtTahun.Text
+ ' group by fp_nomor,fp_tanggal ,month(fp_tanggal),year(fp_tanggal) ,cus_nama,brg_kode ,brg_nama';
 tt := tstringlist.Create;

tsql := xOpenQuery(s,conn1);
with tsql do
begin
  try
     s:='delete from penjualanall where cabang='+ Quot(fields[0].AsString)
     + ' and bulan='+IntToStr(cbbBulan.ItemIndex+1)
     + ' and tahun='+edtTahun.Text
     + ';';
     tt.append(s);
    while not eof do
    begin
          s:='insert into penjualanall (cabang,'
     +  '	fp_nomor ,'
     + ' 	fp_tanggal, '
     + ' 	fp_istax, '
     + ' 	bulan, '
     + ' 	tahun, '
     + ' 	fp_cus_kode, '
     + ' 	fpd_brg_kode, '
     + ' 	brg_nama, '
     + ' 	fpd_qty, '
     + ' 	fpd_harga, '
     + ' 	nilai, '
     + '  nilaiblmppn,'
     + ' 	brg_isproductfocus, '
     + ' 	cus_nama, '
     + ' 	marketing, '
     + ' 	group_produk, '
     + ' 	kontrak, '
     + ' 	salesman) values ('
     + quot(fields[0].asstring)+ ','
     + quot(fields[1].asstring) + ','
     + quotd(fields[2].asdatetime)+','
     + fields[3].asstring+','
     + fields[4].asstring+','
     + fields[5].asstring+','
     + quot(fields[6].asstring)+','
     + quot(fields[7].asstring)+','
     + quot(fields[8].asstring)+','
     + fields[9].asstring+','
     + fields[10].asstring+','
     + fields[11].asstring+','
     + fields[12].asstring+','
     + fields[13].asstring+','
     + quot(fields[14].asstring)+','
     + quot(fields[15].asstring)+','
     + quot(fields[16].asstring)+','
     + fields[17].asstring+','
     + quot(fields[18].asstring)+');';
     tt.append(s);
      next;
    end;
  finally
    free;
  end;

end;

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
     s:='update penjualanall inner join tbarangpf on bpf_brg_kode=fpd_brg_kode set het=bpf_het,hna=bpf_hna,group_produk=bpf_grup'
     + ' where bulan ='+inttostr(cbbBulan.ItemIndex+1)
     + ' and tahun='+edtTahun.Text
     + ' and  cabang='+ Quot(acabang)
     +';';
      // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);
      showmessage('proses selesai');

end;

procedure TfrmAmbilDataPenjualan.FormCreate(Sender: TObject);
begin
  with TcxExtLookupHelper(cxExtLookupCabang.Properties) do
    LoadFromCDS(CDSCabang, 'Kode','Nama',['Kode'],Self);
end;

function TfrmAmbilDataPenjualan.GetCDScabang: TClientDataset;
var s:String;
begin
  If not Assigned(FCDScabang) then
  begin
    S := 'select cbg_nama as Nama, cbg_kode Kode'
        +' from tcabang where cbg_aktif=0';

    FCDScabang := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDScabang;
end;
procedure TfrmAmbilDataPenjualan.cxExtLookupCabangPropertiesEditValueChanged(
  Sender: TObject);
  var
    s,ahost,aDatabase,aUser,aPassword :string;
    tsql:TmyQuery;
begin

   s:='select cbg_database,cbg_server,cbg_nama from tcabang where cbg_kode='+ quot(cxExtLookupCabang.EditValue)+';';
   tsql:=xOpenQuery(s,frmmenu.conn);
   with tsql do
   begin
     try
       if not eof then
       begin
         ahost := fields[1].AsString;
         adatabase := fields[0].AsString;
         acabang := fields[2].asstring;
       end;
     finally
       free;
     end;
   end;
conn1 := xCreateConnection(ctMySQL,aHost,aDatabase,'root','password');

end;

end.

