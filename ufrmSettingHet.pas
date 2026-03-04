unit ufrmSettingHet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, Grids, BaseGrid, AdvGrid, AdvCGrid,
  DBClient, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxSpinEdit, cxButtonEdit, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, AdvEdBtn, AdvCombo, cxCurrencyEdit,
  DateUtils, MyAccess;

type
  TfrmSettingHet = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    AdvPanel2: TAdvPanel;
    lbljudul: TLabel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    AdvPanel4: TAdvPanel;
    cxGrid: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    clNo: TcxGridDBColumn;
    clCustomer: TcxGridDBColumn;
    clNamaCustomer: TcxGridDBColumn;
    cxGrdDetail: TcxGridDBTableView;
    lvMaster: TcxGridLevel;
    clLastCostOld: TcxGridDBColumn;
    Label1: TLabel;
    Label4: TLabel;
    cbbBulan: TAdvComboBox;
    edtTahun: TComboBox;
    clHetOld: TcxGridDBColumn;
    clLastCostNew: TcxGridDBColumn;
    clHetNew: TcxGridDBColumn;
    clRatio: TcxGridDBColumn;
    clRatio2: TcxGridDBColumn;
    btnRefresh: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    clSupplier: TcxGridDBColumn;
    clPf: TcxGridDBColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxButton3: TcxButton;
    clkodesup: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure refreshdata;
    procedure initgrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure loaddata ;
    procedure simpandata;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function GetCDS: TClientDataSet;
    procedure clNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure cxGrdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxButton3Click(Sender: TObject);

  private
    FFLAGEDIT: Boolean;
    FID: string;


    { Private declarations }
  protected
    FCDS: TClientDataSet;
  public
    property CDS: TClientDataSet read GetCDS write FCDS;
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;
    { Public declarations }
  end;

var
  frmSettingHet: TfrmSettingHet;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure TfrmSettingHet.FormCreate(Sender: TObject);
begin
     TcxDBGridHelper(cxGrdMain).LoadFromCDS(CDS, False, False);
end;

procedure TfrmSettingHet.refreshdata;
begin
  FID:='';
  edtTahun.Text := FormatDateTime('yyyy',Date);
  initgrid;
end;
procedure TfrmSettingHet.initgrid;
begin
  CDS.EmptyDataSet;
  CDS.Append;
  CDS.Post;
end;

procedure TfrmSettingHet.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F8 then
  begin
      Release;
  end;


  if Key= VK_F10 then
  begin
    try
      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;
      
      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('Gagal Simpan');
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);
  end;
end;

procedure TfrmSettingHet.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;


procedure TfrmSettingHet.loaddata ;
var
  ssql,s: string;
  tsql2,tsql : TmyQuery;
  abulanold,atahunold,i:Integer;
  akhir,awal,akhirold,awalold : TDateTime;


begin
    if cbbBulan.itemindex =0 then
    begin
    akhirold := EndOfTheMonth(StrToDate('12/01/'+IntToStr(strtoint(edttahun.Text)-1)));
    awalold  :=StrToDate('12/01/'+IntToStr(strtoint(edttahun.Text)-1));
      abulanold := 12;
      atahunold := StrToInt(edtTahun.text)-1;
    end
    else
    begin
      abulanold := cbbbulan.ItemIndex;
      atahunold := StrToInt(edtTahun.text);
    akhirold := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex)+'/01/'+edttahun.Text));
    awalold  :=StrToDate(IntToStr(cbbBulan.itemindex)+'/01/'+edttahun.Text);
    end;

    akhir := EndOfTheMonth(StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text));
    awal  :=StrToDate(IntToStr(cbbBulan.itemindex+1)+'/01/'+edttahun.Text);

  s:= 'SELECT  kode,nama,Supplier,kdsup,pf,lastcostold,hetold,(hetold-lastcostold)/lastcostold*100 ratio,'
+ ' lastcostnew,if(hetnew>0 ,hetnew,hetold) hetnew,(if(hetnew>0 ,hetnew,hetold)-lastcostnew)/lastcostnew*100 ratio2 FROM ('
+ ' SELECT brg_kode kode,brg_nama Nama,brg_isproductfocus pf,'
+ ' (select sup_nama from tsupplier inner join tinv_hdr on inv_sup_kode=sup_kode '
+ ' inner join tinv_dtl on invd_inv_nomor=inv_nomor where invd_brg_kode=brg_kode order by inv_tanggal desc limit 1) Supplier, '
+ ' (select sup_kode from tsupplier inner join tinv_hdr on inv_sup_kode=sup_kode '
+ ' inner join tinv_dtl on invd_inv_nomor=inv_nomor where invd_brg_kode=brg_kode order by inv_tanggal desc limit 1) kdsup, '
+ ' (SELECT mst_hargabeli FROM tmasterstok INNER JOIN tbpb_hdr ON bpb_nomor=mst_noreferensi INNER JOIN tpo_hdr ON po_nomor=bpb_po_nomor'
+ ' INNER JOIN tsupplier ON po_sup_kode=sup_kode AND sup_internal=0'
+ ' WHERE mst_brg_kode=a.brg_Kode and mst_tanggal < '+quotd(akhirold)+' ORDER BY mst_tanggal DESC LIMIT 1) lastcostold,'
+ ' (SELECT het_harga FROM thetbulanan WHERE bulan ='+inttostr(abulanold)+' AND tahun ='+inttostr(atahunold)+' AND het_kode=brg_kode) hetold,'
+ ' (SELECT mst_hargabeli FROM tmasterstok INNER JOIN tbpb_hdr ON bpb_nomor=mst_noreferensi INNER JOIN tpo_hdr ON po_nomor=bpb_po_nomor'
+ ' INNER JOIN tsupplier ON po_sup_kode=sup_kode AND sup_internal=0'
+ ' WHERE mst_brg_kode=a.brg_Kode and mst_tanggal < '+quotd(akhir)+' ORDER BY mst_tanggal DESC LIMIT 1) lastcostnew,'
+ ' (SELECT het_harga FROM thetbulanan WHERE bulan ='+inttostr(cbbBulan.ItemIndex+1)+' AND tahun = '+edtTahun.Text+' AND het_kode=brg_kode) hetnew'
+ ' from tbarang a'
+ ' HAVING lastcostold IS NOT NULL ) final WHERE lastcostnew <> lastcostold ';
tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    if not Eof then
    begin
    CDS.EmptyDataSet;
    while  not Eof do
    begin
      CDS.Append;
      CDS.FieldByName('kode').AsString := fieldbyname('kode').AsString;
      CDS.FieldByName('nama').AsString  := fieldbyname('nama').AsString;
      CDS.FieldByName('supplier').AsString  := fieldbyname('supplier').AsString;
      CDS.FieldByName('kdsup').AsString  := fieldbyname('kdsup').AsString;      
      CDS.FieldByName('pf').AsString  := fieldbyname('pf').AsString;
      CDS.FieldByName('lastcostold').asfloat  := fieldbyname('lastcostold').AsFloat;
      CDS.FieldByName('hetold').asfloat  := fieldbyname('hetold').AsFloat;
      CDS.FieldByName('ratio').asfloat  := fieldbyname('ratio').AsFloat;
      CDS.FieldByName('lastcostNew').asfloat  := fieldbyname('lastcostNew').AsFloat;
      CDS.FieldByName('HETNew').asfloat  := fieldbyname('HetNew').AsFloat;
      CDS.FieldByName('ratio2').asfloat  := fieldbyname('ratio2').AsFloat;

      CDS.Post;
      i:=i+1;
      next;
    end;
   end;
  finally
    Free;
  end;



end;


end;


procedure TfrmSettingHet.simpandata;
var
  s:string;
  i:integer;
  tt:TStrings;
  fid : integer;
begin


end;


procedure TfrmSettingHet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

procedure TfrmSettingHet.cxButton1Click(Sender: TObject);
begin
    try

      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('Gagal Simpan');
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);
end;

procedure TfrmSettingHet.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmSettingHet.cxButton2Click(Sender: TObject);
begin
   try

      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('Gagal Simpan');
     // xRollback(frmMenu.conn);
     Exit;
   end;
    // xCommit(frmMenu.conn);
    Release;
end;
procedure TfrmSettingHet.FormShow(Sender: TObject);
begin
refreshdata;
end;

function TfrmSettingHet.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'No', ftInteger, False);
    zAddField(FCDS, 'Kode', ftString, False,20);
    zAddField(FCDS, 'Nama', ftstring, False,100);
    zAddField(FCDS, 'Supplier', ftstring, False,100);
    zAddField(FCDS, 'kdsup', ftstring, False,20);
    zAddField(FCDS, 'Pf', ftstring, False,10);
    zAddField(FCDS, 'LastCostOld', ftFloat, False);
    zAddField(FCDS, 'HETOld', ftFloat, False);
    zAddField(FCDS, 'ratio', ftFloat, False);
    zAddField(FCDS, 'LastCostNew', ftFloat, False);
    zAddField(FCDS, 'HETNew', ftFloat, False);
    zAddField(FCDS, 'ratio2', ftFloat, False);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

procedure TfrmSettingHet.clNoGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  If Assigned(ARecord) then
  begin
    AText := Inttostr(ARecord.Index+1);
  end;
end;

procedure TfrmSettingHet.cxGrdMainKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
if key = VK_DELETE then
begin
  If CDS.Eof then exit;
  CDS.Delete;
  If CDS.Eof then initgrid;
end;
end;

procedure TfrmSettingHet.btnRefreshClick(Sender: TObject);
begin
   loaddata;
end;

procedure TfrmSettingHet.cxGrdMainStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  AColumn : TcxCustomGridTableItem;  
begin
  AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('PF');

  if (AColumn <> nil)  and (ARecord <> nil) and (AItem <> nil) and
     (cVarToFloat(ARecord.Values[AColumn.Index]) > 0) then
    AStyle := cxStyle2;
end;

procedure TfrmSettingHet.cxButton3Click(Sender: TObject);
VAR
  aup:Double;
begin
   cds.First;
    while  not cds.Eof do
    begin
       If CDS.State <> dsEdit then
       CDS.Edit;
       if CDS.FieldByName('pf').AsString <> '1' then
       begin
         aup := StrToFloat(getnama('tsupplier','sup_kode',CDS.fieldbyname('kdsup').AsString,'sup_upHET'));
         CDS.FieldByName('HETNew').AsFloat :=CDS.FieldByName('LastCostNew').AsFloat*(100+aUp)/100;
         CDS.FieldByName('ratio2').AsFloat :=aup;
       end;
       cds.Next;
    end;


end;

end.
