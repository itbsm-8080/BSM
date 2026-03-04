unit ufrmPostingJurnalBulanan;

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
  AdvCombo,DateUtils, cxPC;

type
  TfrmPostingJurnalBulanan = class(TForm)
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
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    private
      { Private declarations }
     protected
  public
    { Public declarations }
  end;

var
  frmPostingJurnalBulanan: TfrmPostingJurnalBulanan;

implementation

uses MAIN,uModuleConnection,uFrmbantuan,Ulib,uReport;

{$R *.dfm}

procedure TfrmPostingJurnalBulanan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TfrmPostingJurnalBulanan.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     SelectNext(ActiveControl,True,True);
end;



procedure TfrmPostingJurnalBulanan.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmPostingJurnalBulanan.cxButton1Click(Sender: TObject);
var
  s:string;
  akhir : TDateTime;
begin
  akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text));
if  CheckBox4.Checked then
begin
    s:= 'CALL jurnal_bdpjogja('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_bdpsolo('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  'CALL jurnal_bdponline('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  'CALL jurnal_bdpmadiun('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  'CALL jurnal_bdppurwokerto('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  'CALL jurnal_bdpsemarang('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  'CALL jurnal_bdpsby('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  'CALL jurnal_bdpcrb('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);

    s:= s +  'CALL jurnal_bdplab('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  'CALL jurnal_bdpjakarta('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_KoreksiPusat('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);

    s:= s +  ' CALL jurnal_KoreksiJogja('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_KoreksiSolo('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_Koreksionline('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_Koreksimadiun('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_Koreksipurwokerto('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_Koreksisemarang('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_Koreksisby('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_Koreksicrb('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_Koreksilab('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' CALL jurnal_Koreksijakarta('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_pembelian('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_pemusnahanJogja('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_PemusnahanSolo('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_pemusnahanonline('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_Pemusnahanmadiun('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_Pemusnahanpurwokerto('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_Pemusnahansemarang('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_Pemusnahansby('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_Pemusnahancrb('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_Pemusnahanlab('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_Pemusnahanjakarta('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    EnsureConnected(frmMenu.conn);
    ExecSQLDirect(frmMenu.conn, s);
end;
if CheckBox2.Checked then
begin
    s:= ' call jurnal_penjualanJogja('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_penjualanSolo('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_penjualanOnline('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_penjualanMadiun('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_penjualanpurwokerto('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_penjualansemarang('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_penjualansby('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_penjualancrb('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_penjualanlab('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_penjualanjakarta('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    EnsureConnected(frmMenu.conn);
    ExecSQLDirect(frmMenu.conn, s);
end;
if CheckBox3.Checked then
begin
    s:=  ' call jurnal_returpembelian('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualanJogja('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualanSolo('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualanOnline('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualanMadiun('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualanpurwokerto('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualansemarang('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualansby('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualancrb('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualanlab('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';
    // xExecQuery(s,frmMenu.conn);
    //EnsureConnected(frmMenu.conn);
    //ExecSQLDirect(frmMenu.conn, s);
    s:= s +  ' call jurnal_returpenjualanjakarta('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

    EnsureConnected(frmMenu.conn);

    ExecSQLDirect(frmMenu.conn, s);
end;

if CheckBox1.Checked then
begin
      //---------------------------------------------------jeda dulu

      s:=  ' call jurnal_mutasisolonew('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

      s:= s+  ' call jurnal_mutasipusatnew('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

      s:=  s+ ' call jurnal_mutasijogja('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

  //    s:= s +  ' call jurnal_mutasionline('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

      s:=  s + ' call jurnal_mutasimadiun('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

      s:= s +  ' call jurnal_mutasipurwokerto('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

      s:=  s + ' call jurnal_mutasisemarang('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

      s:=  s + ' call jurnal_mutasisby('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

      s:=  s + ' call jurnal_mutasicrbnew('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

//      s:=  s + ' call jurnal_mutasilab('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

      s:=  s + ' call jurnal_mutasijakarta('+IntToStr(cbbBulan.itemindex+1)+','+edttahun.Text+','+quotd(akhir)+');';

      EnsureConnected(frmMenu.conn);
      ExecSQLDirect(frmMenu.conn, s);
end;

// xCommit(frmMenu.conn);
ShowMessage('Proses posting jurnal selesai');

end;

end.
