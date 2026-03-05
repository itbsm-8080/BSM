{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}                           
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, SqlExpr, ComCtrls, jpeg, ExtCtrls, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeels, dxSkinsForm,
  dxGDIPlusClasses, dxSkinsdxBarPainter, cxGraphics, cxControls,
  cxLookAndFeelPainters, dxRibbonSkins, cxClasses, dxRibbon, dxBar,
  dxNavBarCollns, dxNavBarBase, dxNavBar, dxBarDBNav,
  dxSkinsdxRibbonPainter, cxPC,
  dxSkinsdxDockControlPainter, dxDockControl, dxDockPanel, dxSkinDarkRoom,
  dxSkinFoggy, dxSkinSeven, dxSkinSharp, dxSkinsDefaultPainters,
  dxSkinsdxNavBar2Painter, ShellAPI, MyAccess, MemDS, DBAccess;

type
  TfrmMenu = class(TForm)
    dxSkinController1: TdxSkinController;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    User1: TMenuItem;
    IdentitasPerusahaan1: TMenuItem;
    Relogin1: TMenuItem;
    Daftar1: TMenuItem;
    Persediaan1: TMenuItem;
    Pembelian1: TMenuItem;
    Barang1: TMenuItem;
    Katagori1: TMenuItem;
    Gudang1: TMenuItem;
    MutasiAntarGudang1: TMenuItem;
    MutasiantarCabang1: TMenuItem;
    PesananPembelian1: TMenuItem;
    FakturPembelian1: TMenuItem;
    PenerimaanBarang1: TMenuItem;
    PembayaranSupplier1: TMenuItem;
    Retu1: TMenuItem;
    KasBank1: TMenuItem;
    PenerimaanLainlain1: TMenuItem;
    PembayaranLainlain1: TMenuItem;
    Bukubank1: TMenuItem;
    Utility1: TMenuItem;
    utupPeriode1: TMenuItem;
    Costcenter1: TMenuItem;
    Salesman1: TMenuItem;
    Customer1: TMenuItem;
    Supplier1: TMenuItem;
    JenisCustomer1: TMenuItem;
    Image1: TImage;
    JurnalUmum1: TMenuItem;
    ListJurnal1: TMenuItem;
    Laporan1: TMenuItem;
    LapUmurHutang1: TMenuItem;
    AmbildataJurnal1: TMenuItem;
    SaldoHutang1: TMenuItem;
    HistoryStok1: TMenuItem;
    dxDockSite1: TdxDockSite;
    dxDockPanel1: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxNavBar2: TdxNavBar;
    dxNavBarGroup1: TdxNavBarGroup;
    dxNavBarGroup2: TdxNavBarGroup;
    dxNavBarGroup3: TdxNavBarGroup;
    dxNavBar2Group4: TdxNavBarGroup;
    dxNavBar2Group1: TdxNavBarGroup;
    dxNavBar2Group2: TdxNavBarGroup;
    dxUser: TdxNavBarItem;
    dxIdentitas: TdxNavBarItem;
    dxRelogin: TdxNavBarItem;
    dxCostcenter: TdxNavBarItem;
    dxSalesman: TdxNavBarItem;
    dxCustomer: TdxNavBarItem;
    dxSupplier: TdxNavBarItem;
    dxJenisCustomer: TdxNavBarItem;
    dxBarang: TdxNavBarItem;
    dxGudang: TdxNavBarItem;
    dxKategori: TdxNavBarItem;
    dxPenyesuaianStok: TdxNavBarItem;
    dxmutasigudang: TdxNavBarItem;
    dxMutasiCabang: TdxNavBarItem;
    dxPesananJual: TdxNavBarItem;
    dxPengiriman: TdxNavBarItem;
    dxFakturJual: TdxNavBarItem;
    dxPenerimaan: TdxNavBarItem;
    dxReturPenjualan: TdxNavBarItem;
    dxPesananBeli: TdxNavBarItem;
    dxPenerimaanBarang: TdxNavBarItem;
    dxFakturBeli: TdxNavBarItem;
    dxPembayaransup: TdxNavBarItem;
    dxReturBeli: TdxNavBarItem;
    dxBukuBank: TdxNavBarItem;
    dxPenerimaanlain: TdxNavBarItem;
    dxPembayaralain: TdxNavBarItem;
    dxJurnalUmum: TdxNavBarItem;
    dxMutasiIn: TdxNavBarItem;
    dxfeeCustomer: TdxNavBarItem;
    dxhitungstok: TdxNavBarItem;
    dxlistJual: TdxNavBarItem;
    dxListPersediaan: TdxNavBarItem;
    dxFakturBayangan: TdxNavBarItem;
    dxFakturPajak: TdxNavBarItem;
    dxListJurnal: TdxNavBarItem;
    dxPencairanGiro: TdxNavBarItem;
    dxbayarbiayapromosi: TdxNavBarItem;
    LapTransaksiHarianbySupplier1: TMenuItem;
    ProsesGaji1: TMenuItem;
    ProsesLabaRugi1: TMenuItem;
    OpenDialog1: TOpenDialog;
    CrosscheckKasdanBank1: TMenuItem;
    frmNeracaSaldo: TMenuItem;
    CekTransaksiKasdanBank1: TMenuItem;
    PostingJurnalBulanan1: TMenuItem;
    LaporanBiayaBulanan1: TMenuItem;
    KartuStok1: TMenuItem;
    CekMutasiBarang1: TMenuItem;
    LaporanNeraca1: TMenuItem;
    LaporanAnggaran1: TMenuItem;
    LapHargaBeliNew: TMenuItem;
    SettingHET1: TMenuItem;
    dxNavBar2Group3: TdxNavBarGroup;
    dxSetingPF: TdxNavBarItem;
    dxSettingGroupPF: TdxNavBarItem;
    Rekening1: TMenuItem;
    LaporanALLPf1: TMenuItem;
    LaporanAnalisaStokPF1: TMenuItem;
    Laporanlabarugiv21: TMenuItem;
    rytoconnect1: TMenuItem;
    LapPenjualanByitemAllCabang1: TMenuItem;
    AmbildataPenjualan1: TMenuItem;
    LapPenjualanbyItemvsPf1: TMenuItem;
    dxcreatepo: TdxNavBarItem;
    ExecuteSql1: TMenuItem;
    OpenDialog2: TOpenDialog;
    LapPersediaanAllCabang1: TMenuItem;
    LapPermintaanCabang1: TMenuItem;
    LapRekapPermintaanBarang1: TMenuItem;
    LapFakturOutstanding1: TMenuItem;
    dxkaryawan: TdxNavBarItem;
    VerifikasiAbsen1: TMenuItem;
    dxbayarRepack: TdxNavBarItem;
    LaporanPermintaanBarangvsRealisasi1: TMenuItem;
    tmr1: TTimer;
    DM: TMyQuery;
    procedure FileExit1Execute(Sender: TObject);
    function ShowForm(AFormClass: TFormClass): TForm;
    procedure Maximized1Click(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure bacafile;

    procedure Exit1Click(Sender: TObject);
    procedure frmUserClick(Sender: TObject);
    procedure frmRELoginClick(Sender: TObject);
    procedure dxNavBar1Item1Click(Sender: TObject);
    procedure dxGudangClick(Sender: TObject);
    procedure dxCostcenterClick(Sender: TObject);
    procedure dxSalesmanClick(Sender: TObject);
    procedure dxCustomerClick(Sender: TObject);
    procedure dxSupplierClick(Sender: TObject);
    procedure dxJenisCustomerClick(Sender: TObject);
    procedure dxReloginClick(Sender: TObject);
    procedure dxKategoriClick(Sender: TObject);
    procedure dxPesananJualClick(Sender: TObject);
    procedure dxBarangClick(Sender: TObject);
    procedure dxPesananBeliClick(Sender: TObject);
    procedure dxPenerimaanBarangClick(Sender: TObject);
    procedure dxFakturBeliClick(Sender: TObject);
    procedure dxMutasiCabangClick(Sender: TObject);
    procedure dxmutasigudangClick(Sender: TObject);
    procedure dxPembayaransupClick(Sender: TObject);
    procedure dxReturBeliClick(Sender: TObject);
    procedure dxDaftarRekeningClick(Sender: TObject);
    procedure dxPenerimaanlainClick(Sender: TObject);
    procedure dxPembayaralainClick(Sender: TObject);
    procedure dxHitungStokClick(Sender: TObject);
    procedure dxJurnalUmumClick(Sender: TObject);
    procedure dxBukuBankClick(Sender: TObject);
    procedure IdentitasPerusahaan1Click(Sender: TObject);
    procedure dxIdentitasClick(Sender: TObject);
    procedure User1Click(Sender: TObject);
    procedure Relogin1Click(Sender: TObject);
    procedure Costcenter1Click(Sender: TObject);
    procedure Salesman1Click(Sender: TObject);
    procedure Customer1Click(Sender: TObject);
    procedure Supplier1Click(Sender: TObject);
    procedure Barang1Click(Sender: TObject);
    procedure Katagori1Click(Sender: TObject);
    procedure Gudang1Click(Sender: TObject);
    procedure MutasiAntarGudang1Click(Sender: TObject);
    procedure MutasiantarCabang1Click(Sender: TObject);
    procedure PenerimaanBarang1Click(Sender: TObject);
    procedure FakturPembelian1Click(Sender: TObject);
    procedure PembayaranSupplier1Click(Sender: TObject);
    procedure Retu1Click(Sender: TObject);
    procedure PenerimaanLainlain1Click(Sender: TObject);
    procedure PembayaranLainlain1Click(Sender: TObject);
    procedure Bukubank1Click(Sender: TObject);
    procedure JurnalUmum1Click(Sender: TObject);
    procedure ListJurnal1Click(Sender: TObject);
    procedure dxListJurnalClick(Sender: TObject);
    procedure LapUmurHutang1Click(Sender: TObject);
    procedure AmbildataJurnal1Click(Sender: TObject);
    procedure CekTransaksiKasdanBank1Click(Sender: TObject);
    procedure CrosscheckKasdanBank1Click(Sender: TObject);
    procedure SaldoHutang1Click(Sender: TObject);
    procedure dxPenyesuaianStokClick(Sender: TObject);
    procedure HistoryStok1Click(Sender: TObject);
    procedure dxMutasiINClick(Sender: TObject);
    procedure dxDockPanel1AutoHideChanged(Sender: TdxCustomDockControl);
    procedure dxListPersediaanClick(Sender: TObject);
    procedure frmNeracaSaldoClick(Sender: TObject);
    procedure LaporanBiayaBulanan1Click(Sender: TObject);
    procedure LapTransaksiHarianbySupplier1Click(Sender: TObject);
    procedure PostingJurnalBulanan1Click(Sender: TObject);
    procedure ProsesGaji1Click(Sender: TObject);
    procedure ProsesLabaRugi1Click(Sender: TObject);
    procedure utupPeriode1Click(Sender: TObject);
    procedure KartuStok1Click(Sender: TObject);
    procedure CekMutasiBarang1Click(Sender: TObject);
    procedure LaporanNeraca1Click(Sender: TObject);
    procedure LaporanAnggaran1Click(Sender: TObject);
    procedure LapHargaBeliNewClick(Sender: TObject);
    procedure SettingHET1Click(Sender: TObject);
    procedure dxSettingGroupPFClick(Sender: TObject);
    procedure dxSetingPFClick(Sender: TObject);
    procedure Rekening1Click(Sender: TObject);
    procedure LaporanALLPf1Click(Sender: TObject);
    procedure LaporanAnalisaStokPF1Click(Sender: TObject);
    procedure Laporanlabarugiv21Click(Sender: TObject);
    procedure rytoconnect1Click(Sender: TObject);
    procedure LapPenjualanByitemAllCabang1Click(Sender: TObject);
    procedure AmbildataPenjualan1Click(Sender: TObject);
    procedure LapPenjualanbyItemvsPf1Click(Sender: TObject);
    procedure dxcreatepoClick(Sender: TObject);
    procedure ExecuteSql1Click(Sender: TObject);
    procedure LapPersediaanAllCabang1Click(Sender: TObject);
    procedure LapPermintaanCabang1Click(Sender: TObject);
    procedure LapRekapPermintaanBarang1Click(Sender: TObject);
    procedure LapFakturOutstanding1Click(Sender: TObject);
    procedure dxkaryawanClick(Sender: TObject);
    procedure VerifikasiAbsen1Click(Sender: TObject);
    procedure dxbayarRepackClick(Sender: TObject);
    procedure LaporanPermintaanBarangvsRealisasi1Click(Sender: TObject);
    procedure SembunyikanMenu(AMainMenu: TMainMenu);
    function ApplyMainMenuAccess(AMenuItem: TMenuItem): Boolean;
    procedure ApplyMainMenu(AMainMenu: TMainMenu);
    procedure HideMenuItem(AMenuItem: TMenuItem);
    procedure LoadHakUser;
    procedure ApplyHakAkses;
    procedure UpdateGroupVisibility;
    procedure tmrHeartbeatTimer(Sender: TObject);
  private
    { Private declarations }
    FaDatabase: string;
    FaHost: string;
    Fapassword: string;
    Fauser: string;
    Fapathimage : string;
    Faport: Integer;
  public
    { Public declarations }
//    conn: TSQLConnection;
    conn: TMyConnection;
    KDUSER, NMUSER, KDCABANG: String;
    otorisasi: Boolean;
    property aDatabase: string read FaDatabase write FaDatabase;
    property aHost: string read FaHost write FaHost;
    property apassword: string read Fapassword write Fapassword;
    property apathimage: string read Fapathimage write Fapathimage;
    property auser: string read Fauser write Fauser;
    property aport: Integer read Faport write Faport;
  end;

var

  frmMenu: TfrmMenu;

//  for help / bantuan...
  varglobal : string;
  varglobal1 : string;
  varglobal2 : string;
  sqlbantuan : string;
  sqlbantuan2 : string;
  sqlfilter : string;
  zVersi:string;
  hakUser: TStringList;
  ListHak: TStringList;


implementation
 uses Ulib,uModuleConnection,ufrmUser, UfrmLogin,ufrmBrowseGudang,ufrmBrowseCostCenter,
 ufrmBrowseSalesman,ufrmBrowseCustomer,ufrmBrowseSupplier,ufrmBrowseJC,ufrmBrowseSubBarang,
 ufrmBrowsePesanan,ufrmBrowseBarang,ufrmBrowsePO,ufrmBrowseBPB,ufrmBrowseInvoice,
 ufrmBrowseMutasiGudang,ufrmBrowseBayarSupplier,ufrmBrowseMutasiCabang,ufrmBrowseReturBeli,
 ufrmBrowserekening,ufrmBrowsePenerimaanLain,ufrmBrowsePembayaranLain,ufrmBrowseHitungStok,
 ufrmBrowseJurnalUmum,ufrmListKas,ufrmPerusahaan,ufrmBrowseJurnal2,ufrmlistIOS,ufrmProsesAmbilJurnal,
 ufrmListSaldoHutang,ufrmBrowseKoreksiStok,ufrmListMutasiStok2,ufrmBrowseMutasiCabang2,ufrmListTransaksiHarian2,
 ufrmProsesGaji,ufrmProsesLabaRugi,ufrmTutupPeriode,ufrmCekKasBank,ufrmNeracaSaldo,ufrmCekTransaksiKasBank,
 ufrmLapPersediaan,ufrmPostingJurnalBulanan,ufrmLapBiayaBulanan,ufrmBrowseKartuStok,ufrmCekMutasiBarang,ufrmLapLabaRugi,
 ufrmLapNeraca,ufrmLapAnggaran,ufrmLaporanChekin,ufrmBrowseHargaBeliNew,ufrmSettingHet,
 ufrmBrowseSubBarangPF,ufrmBrowseSetingBarangPF,ufrmlapallpf,ufrmlapallpf2,ufrmLaplabarugi2,
 ufrmlistjual,ufrmAmbildataPenjualan,ufrmlistjualPFvsRiil,ufrmCreatePo,ufrmLapPersediaanAll,
 ufrmListPermintaanBarang,ufrmLapRekapPermintaanBarang,ufrmListFOS,ufrmBrowseKaryawanAll,
  StrUtils,ufrmVerifikasiAbsensi,ufrmBrowseBayarRepack,ufrmBrowseBarangRealisasi;
{$R *.dfm}


procedure TfrmMenu.FileExit1Execute(Sender: TObject);
begin
  application.terminate;
end;

function TfrmMenu.ShowForm(AFormClass: TFormClass): TForm;
var
  aForm: TForm;
  i: Integer;
begin
  inherited;
  if ( not ceKVIEW(frmMenu.KDUSER, AFormClass.ClassName)) then
  begin
    MessageDlg('Anda tidak berhak Membuka di Modul ini', mtWarning, [mbOK],0);
    Exit;
  End;

  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i].ClassName = AFormClass.ClassName then
    begin
      Result := MDIChildren[i];
      // mdiChildrenTabs.TabIndex := GetTabSetIndex(Result);
      Exit;
    end;
  end;

  aForm := AFormClass.Create(Application);
  aForm.FormStyle := fsMDIChild;
  //  aForm.Position := poDefault;

  //  aForm.WindowState := wsMaximized;
  Result := (aForm as AFormClass);
end;

procedure TfrmMenu.Maximized1Click(Sender: TObject);
begin
  if MDIChildCount <> 0 then
   ActiveMDIChild.WindowState := wsMaximized;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
var                                                    
  sql: String;
  tsql: TmyQuery;
  AppVersi, DbVersi: Double;  
begin
  dxNavBar2.Visible := False;
  SembunyikanMenu(MainMenu1);

  bacafile;
  StatusBar1.Panels[1].Text := 'Connected to ' + aHost;
  StatusBar1.Panels[2].Text := 'Database ' + aDatabase;

  conn := xCreateConnection(ctMySQL, aHost, aDatabase, auser, apassword, aport);

  ThousandSeparator := ',';
  ShortDateFormat := 'M/d/yyyy';
  DateSeparator := '/';
  DecimalSeparator := '.';
  Application.UpdateFormatSettings := True;
  zVersi := '1.0.61';
  StatusBar1.Panels[4].Text := 'Versi ' + zVersi;

  // cek versi
  sql := 'select versi from tversi where aplikasi = "Inventory"';
  tsql := xOpenQuery(sql, frmmenu.conn);
  AppVersi := StrToFloat(StringReplace(zVersi,'.','', [rfReplaceAll]));
  DbVersi := StrToFloat(StringReplace(tsql.FieldByName('versi').AsString,'.','',[rfReplaceAll]));
  
  if AppVersi < dbVersi then
    ShellExecute(Handle, 'open', PAnsiChar('Updateexe'), Nil, Nil, SW_SHOWNORMAL);

  frmLogin.Show;
end;

procedure TfrmMenu.bacafile;
var
  ltemp: TStringList;
begin
  ltemp := TStringList.Create;
  ltemp.loadfromfile(ExtractFileDir(application.ExeName) + '\' + 'default.cfg');

  aHost      := ltemp[0];
  aDatabase  := ltemp[1];
  auser      := ltemp[2];
  apassword  := ltemp[3];
  apathimage := ltemp [5];
  aport := StrToInt(ltemp[6]);
  ltemp.free;
end;


procedure TfrmMenu.Exit1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmMenu.frmUserClick(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Master User' then
 begin
    ShowForm(TfrmUser).Show;
 end;
    ActiveMDIChild.WindowState := wsMaximized;

end;

procedure TfrmMenu.frmRELoginClick(Sender: TObject);
var
  i : Integer;
begin
   for i := 0 to MDIChildCount - 1 do
  begin
      MDIChildren[i].Release;
  end;
   Self.Enabled := False;
   frmlogin.edtuser.Clear;
   frmlogin.edtPassword.Clear;
   frmLogin.Show;

end;


procedure TfrmMenu.dxNavBar1Item1Click(Sender: TObject);
begin
frmUserClick(self);
end;

procedure TfrmMenu.dxGudangClick(Sender: TObject);
begin
   if ActiveMDIChild.Caption <> 'Browse Gudang' then
 begin
    ShowForm(TfrmBrowseGudang).Show;
 end;
//    ActiveMDIChild.WindowState := wsMaximized;

end;

procedure TfrmMenu.dxCostcenterClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Cost Center' then
 begin
    ShowForm(TfrmBrowseCostCenter).Show;
 end;
end;

procedure TfrmMenu.dxSalesmanClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Salesman' then
 begin
    ShowForm(TfrmBrowseSalesman).Show;
 end;

end;

procedure TfrmMenu.dxCustomerClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Customer' then
 begin
    ShowForm(TfrmBrowseCustomer).Show;
 end;

end;

procedure TfrmMenu.dxSupplierClick(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Browse Supplier' then
 begin
    ShowForm(TfrmBrowseSupplier).Show;
 end;

end;

procedure TfrmMenu.dxJenisCustomerClick(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Browse Jenis Customer' then
 begin
    ShowForm(TfrmBrowseJC).Show;
 end;

end;

procedure TfrmMenu.dxReloginClick(Sender: TObject);
var
  i : Integer;
begin
   for i := 0 to MDIChildCount - 1 do
  begin
      MDIChildren[i].Release;
  end;
   Self.Enabled := False;
   frmlogin.edtuser.Clear;
   frmlogin.edtPassword.Clear;
   frmLogin.Show;

end;


procedure TfrmMenu.dxKategoriClick(Sender: TObject);
begin
   if ActiveMDIChild.Caption <> 'Browse SubBarang' then
 begin
    ShowForm(TfrmBrowseSubBarang).Show;
 end;
end;

procedure TfrmMenu.dxPesananJualClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Pesanan' then
 begin
    ShowForm(TfrmBrowsePesanan).Show;
 end;
end;

procedure TfrmMenu.dxBarangClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Barang' then
 begin
    ShowForm(TfrmBrowseBarang).Show;
 end;
end;

procedure TfrmMenu.dxPesananBeliClick(Sender: TObject);
begin
      if ActiveMDIChild.Caption <> 'Browse PO' then
 begin
    ShowForm(TfrmBrowsePO).Show;
 end;
end;

procedure TfrmMenu.dxPenerimaanBarangClick(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Browse BPB' then
 begin
    ShowForm(TfrmBrowseBPB).Show;
 end;
end;

procedure TfrmMenu.dxFakturBeliClick(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Browse Invoice' then
 begin
    ShowForm(TfrmBrowseInvoice).Show;
 end;

end;

procedure TfrmMenu.dxMutasiCabangClick(Sender: TObject);
begin
     if ActiveMDIChild.Caption <> 'Browse Mutasi Cabang' then
 begin
    ShowForm(TfrmBrowseMutasiCabang).Show;
 end;

end;

procedure TfrmMenu.dxmutasigudangClick(Sender: TObject);
begin
   if ActiveMDIChild.Caption <> 'Browse Mutasi Gudang' then
 begin
    ShowForm(TfrmBrowseMutasiGudang).Show;
 end;

end;

procedure TfrmMenu.dxPembayaransupClick(Sender: TObject);
begin
   if ActiveMDIChild.Caption <> 'Browse Pembayaran Supplier' then
 begin
    ShowForm(TfrmBrowseBayarSupplier).Show;
 end;

end;

procedure TfrmMenu.dxReturBeliClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Retur Beli' then
 begin
    ShowForm(TfrmBrowseReturBeli).Show;
 end;

end;

procedure TfrmMenu.dxDaftarRekeningClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Rekening' then
 begin
    ShowForm(TfrmBrowseRekening).Show;
 end;

end;

procedure TfrmMenu.dxPenerimaanlainClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Penerimaan Lain Lain' then
 begin
    ShowForm(TfrmBrowsePenerimaanLain).Show;
 end;

end;

procedure TfrmMenu.dxPembayaralainClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Pembayaran Lain Lain' then
 begin
    ShowForm(TfrmBrowsePembayaranLain).Show;
 end;

end;

procedure TfrmMenu.dxHitungStokClick(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Browse Hitung Stok' then
 begin
    ShowForm(TfrmBrowseHitungStok).Show;
 end;

end;

procedure TfrmMenu.dxJurnalUmumClick(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Browse Jurnal Umum' then
 begin
    ShowForm(TfrmBrowseJurnalUmum).Show;
 end;

end;

procedure TfrmMenu.dxBukuBankClick(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Buku Bank' then
 begin
    ShowForm(TfrmListkas).Show;
 end;

end;

procedure TfrmMenu.IdentitasPerusahaan1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Identitas Perusahaan' then
 begin
    ShowForm(TfrmPerusahaan).Show;
 end;
    ActiveMDIChild.WindowState := wsMaximized;

end;

procedure TfrmMenu.dxIdentitasClick(Sender: TObject);
begin
IdentitasPerusahaan1Click(Self);
end;

procedure TfrmMenu.User1Click(Sender: TObject);
begin
  frmUserClick(Self);
end;

procedure TfrmMenu.Relogin1Click(Sender: TObject);
var
  i : Integer;
begin
   for i := 0 to MDIChildCount - 1 do
  begin
      MDIChildren[i].Release;
  end;
   Self.Enabled := False;
   frmlogin.edtuser.Clear;
   frmlogin.edtPassword.Clear;
   frmLogin.Show;

end;

procedure TfrmMenu.Costcenter1Click(Sender: TObject);
begin
   dxCostcenterClick(Self);
end;

procedure TfrmMenu.Salesman1Click(Sender: TObject);
begin
dxSalesmanClick(Self);
end;

procedure TfrmMenu.Customer1Click(Sender: TObject);
begin
dxCustomerClick(self);
end;

procedure TfrmMenu.Supplier1Click(Sender: TObject);
begin
dxSupplierClick(Self);
end;

procedure TfrmMenu.Barang1Click(Sender: TObject);
begin
dxBarangClick(Self);
end;

procedure TfrmMenu.Katagori1Click(Sender: TObject);
begin
dxKategoriClick(Self);
end;

procedure TfrmMenu.Gudang1Click(Sender: TObject);
begin
dxGudangClick(Self);
end;

procedure TfrmMenu.MutasiAntarGudang1Click(Sender: TObject);
begin
dxmutasigudangClick(self);
end;

procedure TfrmMenu.MutasiantarCabang1Click(Sender: TObject);
begin
dxMutasiCabangClick(Self);
end;

procedure TfrmMenu.PenerimaanBarang1Click(Sender: TObject);
begin
dxPenerimaanBarangClick(self);
end;

procedure TfrmMenu.FakturPembelian1Click(Sender: TObject);
begin
dxFakturBeliClick(self);
end;

procedure TfrmMenu.PembayaranSupplier1Click(Sender: TObject);
begin
dxPembayaransupClick(Self);
end;

procedure TfrmMenu.Retu1Click(Sender: TObject);
begin
dxReturBeliClick(self);
end;

procedure TfrmMenu.PenerimaanLainlain1Click(Sender: TObject);
begin
dxPenerimaanlainClick(Self);
end;

procedure TfrmMenu.PembayaranLainlain1Click(Sender: TObject);
begin
dxPembayaralainClick(Self);
end;

procedure TfrmMenu.Bukubank1Click(Sender: TObject);
begin
dxBukuBankClick(Self);
end;

procedure TfrmMenu.JurnalUmum1Click(Sender: TObject);
begin
dxJurnalUmumClick(Self);

end;

procedure TfrmMenu.ListJurnal1Click(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Browse Jurnal2' then
 begin
    ShowForm(TfrmBrowseJurnal2).Show;
 end;

end;

procedure TfrmMenu.dxListJurnalClick(Sender: TObject);
begin
 ListJurnal1Click(self);
end;

procedure TfrmMenu.LapUmurHutang1Click(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Lap. Umur Hutang' then
 begin
    ShowForm(TfrmListIOS).Show;
 end;

end;

procedure TfrmMenu.AmbildataJurnal1Click(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Proses Ambil data Jurnal Keuangan' then
 begin
    ShowForm(TfrmProsesAmbilJurnal).Show;
 end;

end;

procedure TfrmMenu.CekTransaksiKasdanBank1Click(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Cek Transaksi Kas dan Bank' then
 begin
    ShowForm(TfrmCektransaksiKasBank).Show;
 end;

end;

procedure TfrmMenu.CrosscheckKasdanBank1Click(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Cek Kas dan Bank' then
 begin
    ShowForm(TfrmCekKasBank).Show;
 end;

end;

procedure TfrmMenu.SaldoHutang1Click(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Saldo Hutang' then
 begin
    ShowForm(TfrmListSaldoHutang).Show;
 end;

end;

procedure TfrmMenu.dxPenyesuaianStokClick(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Koreksi Stok' then
 begin
    ShowForm(Tfrmbrowsekoreksistok).Show;
 end;

end;

procedure TfrmMenu.HistoryStok1Click(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'History Stok' then
 begin
    ShowForm(TfrmListMutasiStok2).Show;
 end;

end;

procedure TfrmMenu.dxMutasiINClick(Sender: TObject);
begin
    if ActiveMDIChild.Caption <> 'Browse Mutasi Cabang In' then
 begin
    ShowForm(TfrmBrowseMutasiCabang2).Show;
 end;
end;

procedure TfrmMenu.dxDockPanel1AutoHideChanged(
  Sender: TdxCustomDockControl);
begin
if dxDockPanel1.AutoHide then
   dxDockSite1.Width := 24
else
   dxDockSite1.Width := 200;
end;

procedure TfrmMenu.dxListPersediaanClick(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Laporan Persediaan' then
 begin
    ShowForm(TfrmLapPersediaan).Show;
 end;

end;

procedure TfrmMenu.frmNeracaSaldoClick(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Neraca Saldo' then
  begin
    ShowForm(TfrmNeracaSaldo).Show;
  end;
end;

procedure TfrmMenu.LaporanBiayaBulanan1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Laporan Biaya Bulanan' then
  begin
    ShowForm(TfrmLapBiayaBulanan).Show;
  end;
end;

procedure TfrmMenu.LapTransaksiHarianbySupplier1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'List Transaksi Harian by Customer' then
  begin
    ShowForm(TfrmListTransaksiHarian2).Show;
  end;
end;

procedure TfrmMenu.PostingJurnalBulanan1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Posting Jurnal Bulanan' then
  begin
    ShowForm(TfrmPostingJurnalBulanan).Show;
  end;
end;

procedure TfrmMenu.ProsesGaji1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Proses Gaji' then
  begin
    ShowForm(TfrmProsesGaji).Show;
  end;
end;

procedure TfrmMenu.ProsesLabaRugi1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Laporan Laba Rugi' then
  begin
    ShowForm(TfrmLaplabarugi).Show;
  end;
end;

procedure TfrmMenu.utupPeriode1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Proses Tutup Periode' then
  begin
    ShowForm(TfrmTutupPeriode).Show;
  end;
end;

procedure TfrmMenu.KartuStok1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Browse Kartu Stok' then
  begin
    ShowForm(TfrmBrowseKartuStok).Show;
  end;
end;

procedure TfrmMenu.CekMutasiBarang1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Cek Mutasi Barang' then
  begin
    ShowForm(TfrmCekmutasiBarang).Show;
  end;
end;

procedure TfrmMenu.LaporanNeraca1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Laporan Neraca' then
  begin
    ShowForm(TfrmLapNeraca).Show;
  end;
end;

procedure TfrmMenu.LaporanAnggaran1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Laporan Anggaran' then
  begin
    ShowForm(TfrmLapAnggaran).Show;
  end;
end;

procedure TfrmMenu.LapHargaBeliNewClick(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Browse Harga Beli New' then
  begin
    ShowForm(TfrmBrowseHargaBeliNew).Show;
  end;
end;

procedure TfrmMenu.SettingHET1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Setting HET' then
  begin
    ShowForm(TfrmSettingHET).Show;
  end;
end;

procedure TfrmMenu.dxSettingGroupPFClick(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Browse Group PF' then
  begin
    ShowForm(TfrmBrowseSubBarangPF).Show;
  end;
end;

procedure TfrmMenu.dxSetingPFClick(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Browse Seting Barang PF' then
  begin
    ShowForm(TfrmBrowseSetingBarangPF).Show;
  end;
end;

procedure TfrmMenu.Rekening1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Daftar Rekening' then
  begin
    ShowForm(TfrmBrowserekening).Show;
  end;
end;

procedure TfrmMenu.LaporanALLPf1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Laporan ALL PF' then
  begin
    ShowForm(TfrmLapAllPf).Show;
  end;
end;

procedure TfrmMenu.LaporanAnalisaStokPF1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Laporan Analisa Stok Product Focus' then
  begin
    ShowForm(TfrmLapAllPf2).Show;
  end;
end;

procedure TfrmMenu.Laporanlabarugiv21Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Laporan Laba rugi versi 2' then
  begin
    ShowForm(TfrmLapLabaRugi2).Show;
  end;
end;

procedure TfrmMenu.rytoconnect1Click(Sender: TObject);
begin
  try
    frmmenu.conn := xCreateConnection(ctMySQL, frmmenu.aHost, frmmenu.aDatabase, frmmenu.auser, frmmenu.apassword);
  except
  end;
end;

procedure TfrmMenu.LapPenjualanByitemAllCabang1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'List Jual per Item' then
  begin
    ShowForm(Tfrmlistjual).Show;
  end;
end;

procedure TfrmMenu.AmbildataPenjualan1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Ambil data Penjualan' then
  begin
    ShowForm(Tfrmambildatapenjualan).Show;
  end;
end;

procedure TfrmMenu.LapPenjualanbyItemvsPf1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'List Jual per Item' then
  begin
    ShowForm(TfrmlistjualPFvsRiil).Show;
  end;
end;

procedure TfrmMenu.dxcreatepoClick(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Create PO Otomatis' then
  begin
    ShowForm(Tfrmcreatepo).Show;
  end;
end;

procedure TfrmMenu.ExecuteSql1Click(Sender: TObject);
var
  tt: TStrings;
  i: Integer;
  a: String;
begin
  if OpenDialog2.Execute then
  begin
    tt := TStringList.Create;
    tt.LoadFromFile(OpenDialog2.FileName);
    try
      try
        a := ' ';

        for i:=0 to tt.Count -1 do
        begin
          a:=a+tt[i];
          
          if RightStr(a,1) = ';' then
          begin
            // xExecQuery(a,frmMenu.conn);
            EnsureConnected(frmMenu.conn);
            ExecSQLDirect(frmMenu.conn, a);
            a := ' ';
          end;
        end;
      finally
        tt.Free;
      end;
    except
      ShowMessage('gagal import');
      // xRollback(frmMenu.conn);
      Exit;
    end;

    // xCommit(frmMenu.conn);
    ShowMessage('Import data berhasil');
  end;
end;

procedure TfrmMenu.LapPersediaanAllCabang1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Lap Persediaan All Cabang' then
  begin
    ShowForm(TfrmLapPersediaanAll).Show;
  end;
end;

procedure TfrmMenu.LapPermintaanCabang1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Lap. Permintaan Barang' then
  begin
    ShowForm(TfrmListPermintaanbarang).Show;
  end;
end;

procedure TfrmMenu.LapRekapPermintaanBarang1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Lap. Rekap Permintaan Barang' then
  begin
    ShowForm(TfrmLapRekapPermintaanBarang).Show;
  end;
end;

procedure TfrmMenu.LapFakturOutstanding1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'List Faktur Outstanding' then
  begin
    ShowForm(TfrmListFOS).Show;
  end;
end;

procedure TfrmMenu.dxkaryawanClick(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Browse Karyawan' then
  begin
    ShowForm(TfrmBrowseKaryawanAll).Show;
  end;
end;

procedure TfrmMenu.VerifikasiAbsen1Click(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Verifikasi Absensi' then
  begin
    ShowForm(TfrmVerifikasiAbsensi).Show;
  end;
end;

procedure TfrmMenu.dxbayarRepackClick(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Browse Bayar Repack' then
  begin
    ShowForm(TfrmBrowseBayarRepack).Show;
  end;
end;

procedure TfrmMenu.LaporanPermintaanBarangvsRealisasi1Click(
  Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'Laporan Permintaan Barang vs Realisasi' then
 begin
    ShowForm(TfrmBrowseBarangRealisasi).Show;
 end;
end;

procedure TfrmMenu.SembunyikanMenu(AMainMenu: TMainMenu);
var
  i: Integer;
begin
  for i := 0 to AMainMenu.Items.Count - 1 do
    HideMenuItem(AMainMenu.Items[i]);
end;

procedure TfrmMenu.HideMenuItem(AMenuItem: TMenuItem);
var
  i: Integer;
begin
  AMenuItem.Visible := False;

  for i := 0 to AMenuItem.Count - 1 do
    HideMenuItem(AMenuItem.Items[i]);
end;

function TfrmMenu.ApplyMainMenuAccess(AMenuItem: TMenuItem): Boolean;
var
  i: Integer;
  ChildVisible: Boolean;
  HasAccess: Boolean;
begin
  ChildVisible := False;

  for i := 0 to AMenuItem.Count - 1 do
    if ApplyMainMenuAccess(AMenuItem.Items[i]) then
      ChildVisible := True;

  HasAccess := hakUser.IndexOf(AMenuItem.Name) >= 0;

  if AMenuItem.Count = 0 then
    AMenuItem.Visible := HasAccess
  else
    AMenuItem.Visible := ChildVisible;

  Result := AMenuItem.Visible;
end;


procedure TfrmMenu.ApplyMainMenu(AMainMenu: TMainMenu);
var
  i: Integer;
begin
  for i := 0 to AMainMenu.Items.Count - 1 do
    ApplyMainMenuAccess(AMainMenu.Items[i]);
end;

procedure TfrmMenu.tmrHeartbeatTimer(Sender: TObject);
begin
  try
    if conn.Connected then
      conn.Ping
    else
      conn.Connect;
  except
    on E: Exception do
    begin
      try
        conn.Disconnect;
        conn.Connect;
      except
        // sengaja dikosongkan biar user tidak panik
      end;
    end;
  end;
end;

procedure TfrmMenu.LoadHakUser;
begin
  ListHak := TStringList.Create;
  hakUser := TStringList.Create;
  DM.Connection := conn;
  with DM do
  begin
    Close;
    SQL.Text := 'select men_menu_name, men_menu_name2 from tmenu inner join thakuser on men_id=hak_men_id where hak_user_kode = :u';
    ParamByName('u').AsString := KDUSER;
    Open;

    while not Eof do
    begin
      ListHak.Add(FieldByName('men_menu_name').AsString);
      hakUser.Add(FieldByName('men_menu_name2').AsString);
      Next;
    end;
  end;
end;

procedure TfrmMenu.ApplyHakAkses;
var
  i: Integer;
begin
  for i := 0 to dxNavBar2.Items.Count - 1 do
  begin
    dxNavBar2.Items[i].Visible :=
      ListHak.IndexOf(dxNavBar2.Items[i].Name) <> -1;
  end;
end;

procedure TfrmMenu.UpdateGroupVisibility;
var
  i, j: Integer;
  AdaVisible: Boolean;
begin
  for i := 0 to dxNavBar2.Groups.Count - 1 do
  begin
    AdaVisible := False;

    for j := 0 to dxNavBar2.Groups[i].LinkCount - 1 do
    begin
      if dxNavBar2.Groups[i].Links[j].Item.Visible then
      begin
        AdaVisible := True;
        Break;
      end;
    end;

    dxNavBar2.Groups[i].Visible := AdaVisible;
  end;
end;

end.
