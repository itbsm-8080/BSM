unit ufrmCekTransaksiKasBank;

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
  TfrmCekTransaksiKasBank = class(TfrmCxBrowse)
    PopupMenu1: TPopupMenu;
    LihatFakturPenjualan1: TMenuItem;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
  private

    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmCekTransaksiKasBank: TfrmCekTransaksiKasBank;

implementation
   uses Ulib, MAIN, uModuleConnection,ufrmPembayaranLain,
  ufrmBayarSupplier;
{$R *.dfm}

procedure TfrmCekTransaksiKasBank.btnRefreshClick(Sender: TObject);
var
  xdebet,xkredit,xsaldo : Double;
  i:integer;
  awal : TDateTime;
begin


 Self.SQLMaster :='select jurd_rek_kode,rek_nama,'
+ ' sum(jurd_kredit) Kredit_Pusat,sum(jurd_debet) Debet_Pusat,'
+ ' (select sum(jurd_kredit) from bsmcabang.tjurnalitem a inner join bsmcabang.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Kredit_solo,'
+ ' (select sum(jurd_debet) from bsmcabang.tjurnalitem a inner join bsmcabang.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Debet_solo,'
+ ' (select sum(jurd_kredit) from bsmcabang2.tjurnalitem a inner join bsmcabang2.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Kredit_Jogja,'
+ ' (select sum(jurd_debet) from bsmcabang2.tjurnalitem a inner join bsmcabang2.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Debet_Jogja,'
+ ' (select sum(jurd_kredit) from bsmcabang3.tjurnalitem a inner join bsmcabang3.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Kredit_Madiun,'
+ ' (select sum(jurd_debet) from bsmcabang3.tjurnalitem a inner join bsmcabang3.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Debet_Madiun,'
+ ' (select sum(jurd_kredit) from bsmcabang4.tjurnalitem a inner join bsmcabang4.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Kredit_Pwkt,'
+ ' (select sum(jurd_debet) from bsmcabang4.tjurnalitem a inner join bsmcabang4.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Debet_Pwkt,'
+ ' (select sum(jurd_kredit) from bsmcabang5.tjurnalitem a inner join bsmcabang5.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Kredit_Semarang,'
+ ' (select sum(jurd_debet) from bsmcabang5.tjurnalitem a inner join bsmcabang5.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Debet_Semarang,'
+ ' (select sum(jurd_kredit) from bsmcabang6.tjurnalitem a inner join bsmcabang6.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Kredit_Sby,'
+ ' (select sum(jurd_debet) from bsmcabang6.tjurnalitem a inner join bsmcabang6.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Debet_Sby,'
+ ' (select sum(jurd_kredit) from bsmcabang9.tjurnalitem a inner join bsmcabang9.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Kredit_Online,'
+ ' (select sum(jurd_debet) from bsmcabang9.tjurnalitem a inner join bsmcabang9.tjurnal on jur_no=jurd_jur_no where a.jurd_rek_kode=x.jurd_rek_kode and jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)+ ') Debet_Online'
+ ' FROM bsm.tjurnalitem x inner join bsm.trekening y on'
+ ' rek_kode=jurd_rek_kode'
+ ' inner join bsm.tjurnal z on x.jurd_jur_no=z.jur_no'
+ ' where jur_tanggal between '+quotd(startdate.DateTime)+' and '+ QuotD(enddate.DateTime)
+ ' and rek_kol_id=1 and rek_isaktif=1 and rek_kode not like "13%"'
+ ' group by jurd_rek_kode';


   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=200;
    cxGrdMaster.Columns[2].Width :=100;
    cxGrdMaster.Columns[3].Width :=100;
    cxGrdMaster.Columns[4].Width :=100;

end;

procedure TfrmCekTransaksiKasBank.FormShow(Sender: TObject);
begin
  ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  startdate.date := date;
  enddate.date := date;
  btnRefreshClick(Self);
end;

procedure TfrmCekTransaksiKasBank.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;


end.
