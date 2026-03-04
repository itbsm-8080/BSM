unit ufrmNeracaSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCxBrowse, Menus, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FMTBcd, Provider, SqlExpr, ImgList,
  ComCtrls, StdCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, AdvCombo,DateUtils;

type
  TfrmNeracaSaldo = class(TfrmCxBrowse)
    PopupMenu1: TPopupMenu;
    LihatFakturPenjualan1: TMenuItem;
    Label3: TLabel;
    cbbBulan: TAdvComboBox;
    edtTahun: TComboBox;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
  private

    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmNeracaSaldo: TfrmNeracaSaldo;

implementation
   uses Ulib, MAIN, uModuleConnection,ufrmPembayaranLain,
  ufrmBayarSupplier;
{$R *.dfm}

procedure TfrmNeracaSaldo.btnRefreshClick(Sender: TObject);
var
  xdebet,xkredit,xsaldo : Double;
  i:integer;
  awal : TDateTime;
  akhir : TDateTime;
begin
  awal := startdate.DateTime;
  akhir := enddate.DateTime;
//    if  cbbBulan.itemindex <> 11 then
//    begin
//        awal := StrToDate(IntToStr(cbbBulan.itemindex +1)+'/01/'+edttahun.Text) ;
//        akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1 )+'/01/'+edttahun.Text));
//    end
//    else
//    begin
//        awal := StrToDate('01/01/'+edttahun.Text);
//        akhir:=EndOfTheMonth(StrToDate('01/01/'+edttahun.Text));
//    end;

 Self.SQLMaster :=' select rek_kode Kode,rek_nama Rekening,SaldoAwal,Debet,Kredit,saldoawal+debet-kredit Akhir from ( '
                + ' select rek_kode,rek_nama ,'
                + ' IFNULL(('
                + ' SELECT SUM(jurd_debet-jurd_kredit)'
                + ' FROM tjurnalitem'
                + ' INNER JOIN tjurnal ON jur_no=jurd_jur_no'
                + ' WHERE jurd_rek_kode=rek_kode AND jur_tanggal <'+quotd(awal)+' ),0) SaldoAwal,'
                + ' IFNULL(('
                + ' SELECT SUM(jurd_debet)'
                + ' FROM tjurnalitem'
                + ' INNER JOIN tjurnal ON jur_no=jurd_jur_no'
                + ' WHERE jurd_rek_kode=rek_kode AND jur_tanggal BETWEEN '+quotd(awal)+' AND '+quotd(akhir)+'),0) debet, IFNULL(('
                + ' SELECT SUM(jurd_kredit)'
                + ' FROM tjurnalitem'
                + ' INNER JOIN tjurnal ON jur_no=jurd_jur_no'
                + ' WHERE jurd_rek_kode=rek_kode AND jur_tanggal BETWEEN '+quotd(awal) +' AND '+quotd(akhir)+'),0) kredit'
                + ' from trekening inner join'
                + ' tkelompok on kol_id=rek_kol_id'
                + ' where isneraca=1'
                + ' order by kol_id) final ';


   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=200;
    cxGrdMaster.Columns[2].Width :=100;
    cxGrdMaster.Columns[3].Width :=100;
    cxGrdMaster.Columns[4].Width :=100;

end;

procedure TfrmNeracaSaldo.FormShow(Sender: TObject);
begin
  ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;

  edttahun.text :=  FormatDateTime('yyyy',Date);
  cbbBulan.ItemIndex := 0;
  btnRefreshClick(Self);
end;

procedure TfrmNeracaSaldo.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;


end.
