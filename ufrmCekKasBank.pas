unit ufrmCekKasBank;

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
  cxDBExtLookupComboBox, AdvCombo;

type
  TfrmCekKasBank = class(TfrmCxBrowse)
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
  frmCekKasBank: TfrmCekKasBank;

implementation
   uses Ulib, MAIN, uModuleConnection,ufrmPembayaranLain,
  ufrmBayarSupplier;
{$R *.dfm}

procedure TfrmCekKasBank.btnRefreshClick(Sender: TObject);
var
  xdebet,xkredit,xsaldo : Double;
  i:integer;
  awal : TDateTime;
begin
    if  cbbBulan.itemindex <> 11 then
        awal := StrToDate(IntToStr(cbbBulan.itemindex +1)+'/01/'+edttahun.Text)
    else
        awal := StrToDate('01/01/'+edttahun.Text);

 Self.SQLMaster :='select rek_kode,rek_nama,sum(jurd_debet-jurd_kredit) Pusat, '
                + ' (select ifnull(sum(jurd_debet-jurd_kredit),0) from bsmcabang.tjurnalitem inner join bsmcabang.tjurnal '
                + ' on jur_no=jurd_jur_no inner join bsmcabang.trekening on rek_kode=jurd_rek_kode and rek_isaktif=1 where jur_tanggal < '+quotd(awal)+' and jurd_rek_kode=a.rek_kode ) Solo,'
                + ' (select ifnull(sum(jurd_debet-jurd_kredit),0) from bsmcabang2.tjurnalitem inner join bsmcabang2.tjurnal '
                + ' on jur_no=jurd_jur_no inner join bsmcabang2.trekening on rek_kode=jurd_rek_kode and rek_isaktif=1 where jur_tanggal < '+quotd(awal)+' and jurd_rek_kode=a.rek_kode ) Jogja, '
                + ' (select ifnull(sum(jurd_debet-jurd_kredit),0) from bsmcabang3.tjurnalitem inner join bsmcabang3.tjurnal '
                + ' on jur_no=jurd_jur_no inner join bsmcabang3.trekening on rek_kode=jurd_rek_kode and rek_isaktif=1 where jur_tanggal < '+quotd(awal)+' and jurd_rek_kode=a.rek_kode ) Madiun,'
                + ' (select ifnull(sum(jurd_debet-jurd_kredit),0) from bsmcabang4.tjurnalitem inner join bsmcabang4.tjurnal '
                + ' on jur_no=jurd_jur_no inner join bsmcabang4.trekening on rek_kode=jurd_rek_kode and rek_isaktif=1 where jur_tanggal < '+quotd(awal)+' and jurd_rek_kode=a.rek_kode ) Purwokerto,'
                + ' (select ifnull(sum(jurd_debet-jurd_kredit),0) from bsmcabang5.tjurnalitem inner join bsmcabang5.tjurnal '
                + ' on jur_no=jurd_jur_no inner join bsmcabang5.trekening on rek_kode=jurd_rek_kode and rek_isaktif=1 where jur_tanggal < '+quotd(awal)+' and jurd_rek_kode=a.rek_kode ) Semarang,'
                + ' (select ifnull(sum(jurd_debet-jurd_kredit),0) from bsmcabang6.tjurnalitem inner join bsmcabang6.tjurnal '
                + ' on jur_no=jurd_jur_no inner join bsmcabang6.trekening on rek_kode=jurd_rek_kode and rek_isaktif=1 where jur_tanggal < '+quotd(awal)+' and jurd_rek_kode=a.rek_kode ) Surabaya,'
                + ' (select ifnull(sum(jurd_debet-jurd_kredit),0) from bsmcabang9.tjurnalitem inner join bsmcabang9.tjurnal '
                + ' on jur_no=jurd_jur_no inner join bsmcabang9.trekening on rek_kode=jurd_rek_kode and rek_isaktif=1 where jur_tanggal < '+quotd(awal)+' and jurd_rek_kode=a.rek_kode ) Online'
                + ' from BSM.trekening a inner join BSM.tjurnalitem b on jurd_rek_kode=rek_Kode '
                + ' inner join BSM.tjurnal c on jur_no=jurd_jur_no '
                + ' where jur_tanggal < '+quotd(awal)
                + ' and rek_kol_id=1 and rek_isaktif=1 and rek_kode not like "13%"'
                + ' group by rek_kode,rek_nama ';


   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=200;
    cxGrdMaster.Columns[2].Width :=100;
    cxGrdMaster.Columns[3].Width :=100;
    cxGrdMaster.Columns[4].Width :=100;

end;

procedure TfrmCekKasBank.FormShow(Sender: TObject);
begin
  ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;

  edttahun.text :=  FormatDateTime('yyyy',Date);
  cbbBulan.ItemIndex := 0;
  btnRefreshClick(Self);
end;

procedure TfrmCekKasBank.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;


end.
