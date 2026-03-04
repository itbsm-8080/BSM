unit uFrmbantuan2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, Grids, BaseGrid, AdvGrid, DBAdvGrd, ExtCtrls,
  AdvPanel, FMTBcd, DB, DBClient, Provider, SqlExpr, AdvCombo, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, cxButtons,cxCurrencyEdit;

type
  TfrmBantuan2 = class(TForm)
    AdvPanel4: TAdvPanel;
    AdvPanel5: TAdvPanel;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ds2: TDataSource;
    btnOK: TcxButton;
    btnTutup: TcxButton;
    cxGrid: TcxGrid;
    cxGrdMaster: TcxGridDBTableView;
    cxGrdDetail: TcxGridDBTableView;
    lvMaster: TcxGridLevel;
    lvDetail: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure loadbantuan(afilter : string='') ;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTutupClick(Sender: TObject);
    procedure WriteMasterDetailGrid;
  private
    { Private declarations }
     Fanamaform: string;
    FCDSDetail: TClientDataset;
    FCDSMaster: TClientDataset;
    FMasterKeyField: String;
  public
    SQLMaster : string;
    SQLDetail : string;
     property anamaform: string read Fanamaform write Fanamaform;
    property CDSMaster: TClientDataset read FCDSMaster write FCDSMaster;
    property CDSDetail: TClientDataset read FCDSDetail write FCDSDetail;
    property MasterKeyField: String read FMasterKeyField write FMasterKeyField;    
    { Public declarations }
  end;

var
  frmBantuan2: TfrmBantuan2;

implementation
  uses MAIN,ulib;
{$R *.dfm}

procedure TfrmBantuan2.FormShow(Sender: TObject);
begin
    loadbantuan;
end;

procedure TfrmBantuan2.loadbantuan(afilter : string='') ;
var

  i:integer;
begin

    If SQLMaster <> '' then
     CDSMaster := cOpenCDS(SQLMaster,Self);
      If SQLDetail <> '' then
        CDSDetail := cOpenCDS(SQLDetail,Self);
    WriteMasterDetailGrid;

//   If not Assigned(cxGrdmaster.DataController.DataSource) then
//    begin
//      cxGrdmaster.DataController.DataSource := TDataSource.Create(Self);
//    end;
//    cxGrdmaster.DataController.DataSource.DataSet := CDSMaster;
//    cxGrdmaster.DataController.CreateAllItems(True);
//
//     for i:=0 to cxGrdMaster.ColumnCount-1 do
//  begin
//    if (cxGrdMaster.Columns[i].DataBinding.ValueType = 'Float')
//    or (cxGrdMaster.Columns[i].DataBinding.ValueType = 'Currency')
//    then
//    begin
//      cxGrdMaster.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
//      TcxCurrencyEditProperties(cxGrdMaster.Columns[i].Properties).DisplayFormat := ',0.00;(,0.00)'
//    end;
//  end;
end;

procedure TfrmBantuan2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=caFree;
end;

procedure TfrmBantuan2.btnTutupClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmBantuan2.WriteMasterDetailGrid;
var //i:Integer;
  lvl:TcxGridLevel;
  i : integer;
begin
  cxGrid.RootLevelOptions.DetailTabsPosition := dtpNone;
  lvl := cxGrid.Levels.Add;
  LvMaster.Options.DetailTabsPosition := dtpTop;

  lvl.GridView := cxGrdDetail;
  lvDetail.GridView := nil;

  Try
    If not Assigned(cxGrdmaster.DataController.DataSource) then
    begin
      cxGrdmaster.DataController.DataSource := TDataSource.Create(Self);
    end;
    cxGrdmaster.DataController.DataSource.DataSet := CDSMaster;
    cxGrdmaster.DataController.KeyFieldNames      := MasterKeyField ;
    cxGrdmaster.DataController.CreateAllItems(True);

    If not Assigned(cxGrdDetail.DataController.DataSource) then
    begin
      cxGrdDetail.DataController.DataSource := TDataSource.Create(Self);
    end;
    cxGrdDetail.DataController.DataSource.DataSet := CDSDetail;
    cxGrdDetail.DataController.MasterKeyFieldNames := MasterKeyField;
    cxGrdDetail.DataController.DetailKeyFieldNames := MasterKeyField;
    cxGrdDetail.DataController.CreateAllItems(True);

    lvDetail.GridView := cxGrdDetail;
       for i:=0 to cxGrdMaster.ColumnCount-1 do
  begin
    if (cxGrdMaster.Columns[i].DataBinding.ValueType = 'Float')
    or (cxGrdMaster.Columns[i].DataBinding.ValueType = 'Currency')
    then
    begin
      cxGrdMaster.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxGrdMaster.Columns[i].Properties).DisplayFormat := ',0.00;(,0.00)'
    end;
  end;
  for i:=0 to cxGrdDetail.ColumnCount-1 do
  begin
    if (cxGrdDetail.Columns[i].DataBinding.ValueType = 'Float')
    or (cxGrdDetail.Columns[i].DataBinding.ValueType = 'Currency')
    then
    begin
      cxGrdDetail.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxGrdDetail.Columns[i].Properties).DisplayFormat := ',0.00;(,0.00)'
    end;
  end;
  Finally
    lvl.Free;
    //cxGrid.RootLevelOptions.DetailTabsPosition := dtptop;
  end;

  If not Assigned(CDSDetail) then lvDetail.Visible := False;
end;


end.
