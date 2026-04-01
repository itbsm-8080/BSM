unit ufrmBrowseBarang;

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
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, MyAccess;

type
  TfrmBrowseBarang = class(TfrmCxBrowse)
    cxButton5: TcxButton;
    SaveDialog1: TSaveDialog;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxGrdMasterStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseBarang: TfrmBrowseBarang;

implementation
   uses ufrmbarang,Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowseBarang.btnRefreshClick(Sender: TObject);
begin

  Self.SQLMaster := 'select *,stok_pusat/Avgsales TOR from ('
+ ' select brg_kode Kode ,brg_nama Nama,brg_satuan Satuan,ktg_nama Kategori, gr_nama Tipe,brg_hrgjual HargaJual, (select sum(mst_stok_in-mst_stok_out) from tmasterstok where mst_brg_kode=brg_kode) Stok ,'
+ ' (select sum(mst_stok_in-mst_stok_out) from tmasterstok where mst_brg_kode=brg_kode and mst_gdg_kode <> "WH-10") StokTnpRepack , brg_min_stok Min,brg_lastcost Lastcost,brg_hrgbeli HargaBeli , '
+ ' if((select count(*) from tbarangkomposisi where bk_brg_kode=brg_kode)>0 ,"Ada","") Komposisi, '
+ '  ifnull(sum(mst_stok_in-mst_stok_out) ,0) Stok_Pusat,avgsales,brg_tgl_beli Beli_Terakhir,if(brg_isaktif=1,"Aktif","Tidak Aktif") Status'
+ '  from tbarang'
+ '  inner join tkategori on ktg_kode=brg_ktg_kode'
+ '  inner join tgroup on gr_kode=brg_gr_kode'
+ '  LEFT JOIN tmasterstok ON mst_brg_kode=brg_kode'
+ '  LEFT JOIN ('
+ '  SELECT mutcd_brg_kode,ifnull(SUM(mutcd_qty),0)/3 avgsales FROM tmutcab_dtl inner join tmutcab_hdr on mutc_nomor=mutcd_mutc_nomor'
+ '  WHERE mutc_tanggal >= DATE_ADD(now() , INTERVAL -90 DAY)'
+ '  GROUP BY mutcd_brg_kode) a ON a.mutcd_brg_kode=brg_kode'
+ '  GROUP BY brg_kode) final';

//  select brg_kode Kode ,brg_nama Nama,brg_satuan Satuan,ktg_nama Kategori,'
//                  + ' gr_nama Tipe,brg_hrgjual HargaJual,'
//                  + ' (select sum(mst_stok_in-mst_stok_out) from tmasterstok where mst_brg_kode=brg_kode) Stok ,'
//                  + ' (select sum(mst_stok_in-mst_stok_out) from tmasterstok where mst_brg_kode=brg_kode and mst_gdg_kode <> "WH-10") StokTnpRepack ,'
//                  + ' brg_min_stok Min,brg_lastcost Lastcost,brg_hrgbeli HargaBeli ,'
//                  + ' if((select count(*) from tbarangkomposisi where bk_brg_kode=brg_kode)>0 ,"Ada","") Komposisi,'
//                  + ' brg_ijinedar IjinEdar,brg_produsen Produsen , brg_berlaku Berlaku '
//                  + ' from tbarang '
//                  + ' inner join tkategori on ktg_kode=brg_ktg_kode'
//                  + ' inner join tgroup on gr_kode=brg_gr_kode';

//  Self.SQLMaster := 'select brg_kode Kode ,brg_nama Nama,brg_satuan Satuan,ktg_nama Kategori,'
//  + ' gr_nama Tipe,brg_hrgjual HargaJual,brg_Stok Stok '
//  + ' from tbarang '
//  + ' inner join tkategori on ktg_kode=brg_ktg_kode'
//  + ' inner join tgroup on gr_kode=brg_gr_kode';

Self.SQLDetail := ' select distinct invd_brg_kode Kode,invd_inv_nomor Nomor, inv_tanggal Tanggal,'
                + ' inv_sup_kode Kode_Sup , Sup_nama Supplier,invd_qty Qty,invd_harga Harga,invd_discpr Disc,(100-invd_discpr)*invd_harga/100 Harga_Net'
                + ' from tinv_dtl '
                + ' inner join tinv_hdr on inv_nomor=invd_inv_nomor'
                + ' inner join tsupplier on sup_kode=inv_sup_kode'
                + ' order by invd_brg_kode,invd_inv_nomor ' ;
 Self.MasterKeyField := 'Kode';
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=80;
    cxGrdMaster.Columns[1].Width :=200;
    cxGrdMaster.Columns[3].Width :=150;
    cxGrdMaster.Columns[5].Width :=80;
    cxGrdMaster.Columns[6].Width :=80;

end;

procedure TfrmBrowseBarang.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowseBarang.cxButton2Click(Sender: TObject);
var
  frmBarang: TfrmBarang;
begin
  inherited;
    if ActiveMDIChild.Caption <> 'Master Barang' then
   begin
      frmBarang  := frmmenu.ShowForm(TfrmBarang) as TfrmBarang;
      frmBarang.edtKode.SetFocus;
      frmBarang.edtKode.Text := IntToStr(frmBarang.getmaxkode);
      frmBarang.cxLookupJenisGroup.EditValue := 1;
   end;
   frmBarang.Show;
end;

procedure TfrmBrowseBarang.cxButton1Click(Sender: TObject);
var
  frmBarang: TfrmBarang;
begin
  inherited;
  If CDSMaster.FieldByname('KODE').IsNull then exit;
  if ActiveMDIChild.Caption <> 'Master CostCenter' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmBarang  := frmmenu.ShowForm(TfrmBarang) as TfrmBarang;
      frmBarang.ID := CDSMaster.FieldByname('KODE').AsString;
      frmBarang.FLAGEDIT := True;
      frmBarang.edtKode.Text := CDSMaster.FieldByname('KODE').AsString;
      frmBarang.loaddata(CDSMaster.FieldByname('KODE').AsString);
      frmBarang.edtKode.Enabled := False;
   end;
   frmBarang.Show;
end;

procedure TfrmBrowseBarang.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmBrowseBarang.cxButton4Click(Sender: TObject);
var
  s:string;
begin
  inherited;
     try
       if not cekdelete(frmMenu.KDUSER,'frmBarang') then
      begin
         MessageDlg('Anda tidak berhak Menghapus di Modul ini',mtWarning, [mbOK],0);
         Exit;
      End;
      if MessageDlg('Yakin ingin hapus ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;
       s:='delete from tbarang '
        + ' where brg_kode = ' + quot(CDSMaster.FieldByname('KODE').AsString) + ';' ;
      // xExecQuery(s,frmMenu.conn);
EnsureConnected(frmMenu.conn);
ExecSQLDirect(frmMenu.conn, s);


      CDSMaster.Delete;
   except
     MessageDlg('Gagal Hapus',mtError, [mbOK],0);
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);

end;

procedure TfrmBrowseBarang.cxButton5Click(Sender: TObject);
var
  s:string;
  tsql:TmyQuery;
  tt:tstrings;
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    s:='select * from tbarang where brg_kode='
    +quot(CDSMaster.FieldByname('KODE').AsString);
    tt := TStringList.Create;
    tsql:= xOpenQuery(s,frmMenu.conn);
    with tsql do
    begin
      try
          s :=  ' insert ignore into tbarang '
             + ' (brg_kode,brg_nama,brg_satuan,brg_gr_kode,brg_ktg_kode,brg_gdg_DEFAULT,brg_sup_kode ,'
             + ' brg_hrgjual,brg_hrgbeli,brg_isaktif,brg_isstok,brg_isexpired,date_create,user_create'
             + ' ) '
             + ' values ( '
             + Quot(fieldbyname('brg_kode').AsString) + ','
             + Quot(fieldbyname('brg_nama').AsString) + ','
             + Quot(fieldbyname('brg_satuan').AsString) + ','
             + Quot(fieldbyname('brg_gr_kode').AsString) + ','
             + Quot(fieldbyname('brg_ktg_kode').AsString) + ','
             + Quot(fieldbyname('brg_gdg_default').AsString) + ','
             + Quot(fieldbyname('brg_sup_kode').AsString) + ','
             + FloatToStr(fieldbyname('brg_hrgjual').Asfloat) + ','
             + FloatToStr(fieldbyname('brg_hrgjual').Asfloat) + ',1,1,0,'
             + QuotD(cGetServerTime,True) + ','
             + Quot(frmMenu.KDUSER)+');';
         tt.Append(s);



      finally
        free;
      end;
    end;
       tt.SaveToFile(SaveDialog1.FileName);
  END;


end;

procedure TfrmBrowseBarang.cxGrdMasterStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  AColumn : TcxCustomGridTableItem;
  AColumn2 : TcxCustomGridTableItem;

begin
  AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('Stok');
  AColumn2 := (Sender as TcxGridDBTableView).GetColumnByFieldName('Min');

  if (AColumn <> nil)  and (ARecord <> nil) and (AItem <> nil) and
     (cVarToFloat(ARecord.Values[AColumn.Index]) <= (cVarToFloat(ARecord.Values[AColumn2.Index]))) then
    AStyle := cxStyle2;
end;

end.
