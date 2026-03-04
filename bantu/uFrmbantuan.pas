unit uFrmbantuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, Grids, BaseGrid, AdvGrid, DBAdvGrd, ExtCtrls,
  AdvPanel, FMTBcd, DB, DBClient, Provider, SqlExpr, AdvCombo, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, cxButtons,cxCurrencyEdit, cxCheckBox;

type
  TfrmBantuan = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure loadbantuan(afilter : string='') ;
    procedure dbgridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTutupClick(Sender: TObject);
    procedure cxGrdMasterKeyPress(Sender: TObject; var Key: Char);

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrdMasterCellClick(Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
    AShift: TShiftState; var AHandled: Boolean);
    function GetSelectedRows: TStringList;
  private
    { Private declarations }
     Fanamaform: string;
    FCDSMaster: TClientDataset;
    FSelectedRows: TStringList;
    FCheckState: array of Boolean;
  public
    SQLMaster : string;
    isMultiple: Boolean;
     property anamaform: string read Fanamaform write Fanamaform;
    property CDSMaster: TClientDataset read FCDSMaster write FCDSMaster;
    property SelectedRows: TStringList read FSelectedRows;
    { Public declarations }
  end;

var
  frmBantuan: TfrmBantuan;

implementation
  uses MAIN,ulib;
{$R *.dfm}

function TfrmBantuan.GetSelectedRows: TStringList;
begin
  Result := FSelectedRows;
end;

procedure TfrmBantuan.FormCreate(Sender: TObject);
begin
  FSelectedRows := TStringList.Create;
  isMultiple := False;
end;

procedure TfrmBantuan.FormDestroy(Sender: TObject);
begin
  FSelectedRows.Free;
  SetLength(FCheckState, 0);
end;

procedure TfrmBantuan.FormShow(Sender: TObject);
begin
    loadbantuan;
end;

procedure TfrmBantuan.loadbantuan(afilter : string='') ;
var
  i:integer;
  colCheck: TcxGridColumn;
begin

    If SQLMaster <> '' then
    CDSMaster := cOpenCDS(SQLMaster,Self);

   If not Assigned(cxGrdmaster.DataController.DataSource) then
    begin
      cxGrdmaster.DataController.DataSource := TDataSource.Create(Self);
    end;
    cxGrdmaster.DataController.DataSource.DataSet := CDSMaster;
    cxGrdmaster.DataController.CreateAllItems(True);

    if isMultiple then
    begin
      colCheck := cxGrdMaster.CreateColumn;
      colCheck.Caption := 'Pilih';
      colCheck.DataBinding.ValueType := 'Boolean';
      colCheck.Visible := True;
      colCheck.VisibleForCustomization := True;
      colCheck.Index := 0;

      colCheck.PropertiesClass := TcxCheckBoxProperties;
      with TcxCheckBoxProperties(colCheck.Properties) do
      begin
        AllowGrayed := False;
        ValueChecked := True;
        ValueUnchecked := False;
        NullStyle := nssUnchecked;
        ImmediatePost := True;
      end;

      cxGrdMaster.OnCellClick := cxGrdMasterCellClick;

      SetLength(FCheckState, CDSMaster.RecordCount);
      for i := 0 to CDSMaster.RecordCount - 1 do
        FCheckState[i] := False;

      FSelectedRows.Clear;
    end;

     for i:=0 to cxGrdMaster.ColumnCount-1 do
  begin

    if (cxGrdMaster.Columns[i].Index = 0) and isMultiple then Continue;

    if (cxGrdMaster.Columns[i].DataBinding.ValueType = 'Float')
    or (cxGrdMaster.Columns[i].DataBinding.ValueType = 'Currency')
    then
    begin
      cxGrdMaster.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxGrdMaster.Columns[i].Properties).DisplayFormat := ',0.00;(,0.00)'
    end;
  end;
end;

procedure TfrmBantuan.cxGrdMasterCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  ARowIndex: Integer;
begin
  if (ACellViewInfo.Item <> nil) and (ACellViewInfo.Item.Index = 0) then
  begin
    ARowIndex := ACellViewInfo.GridRecord.RecordIndex;

    if (ARowIndex >= 0) and (ARowIndex < Length(FCheckState)) then
    begin
      FCheckState[ARowIndex] := not FCheckState[ARowIndex];

      cxGrdMaster.DataController.Values[ARowIndex, 0] := FCheckState[ARowIndex];
    end;

    AHandled := True;
  end;
end;

procedure TfrmBantuan.dbgridDblClick(Sender: TObject);
var
  i: Integer;
  var1, var12: string;
begin
  if isMultiple then
  begin
    varglobal := '';
    varglobal1 := '';
    FSelectedRows.Clear;

    for i := 0 to Length(FCheckState) - 1 do
    begin
      if FCheckState[i] then
      begin

        CDSMaster.RecNo := i + 1;

        var1 := CDSMaster.Fields[0].AsString;
        var12 := CDSMaster.Fields[1].AsString;

        if (var1 <> '') and (var12 <> '') then
        begin

          FSelectedRows.Add(var1 + '|' + var12);

          if varglobal = '' then
          begin
            varglobal := var1;
            varglobal1 := var12;
          end;
        end;
      end;
    end;
  end
  else
  begin
    varglobal:=CDSMaster.Fields[0].AsString;
    varglobal1:=CDSMaster.Fields[1].AsString;
  end;
//   varglobal2:=ClientDataSet1.Fields[2].AsString;
    close;
end;

procedure TfrmBantuan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=caFree;
end;

procedure TfrmBantuan.btnTutupClick(Sender: TObject);
begin
      varglobal := '';
      varglobal1 := '';
      FSelectedRows.Clear;
      Close;
end;

procedure TfrmBantuan.cxGrdMasterKeyPress(Sender: TObject; var Key: Char);
begin
   { if Key=Chr(13) then
   begin
   varglobal:=CDSMaster.Fields[0].AsString;
    varglobal1:=CDSMaster.Fields[1].AsString;
//   varglobal2:=ClientDataSet1.Fields[2].AsString;
    close;
   end; }
    if Key = Chr(13) then  // Enter
    begin
      dbgridDblClick(Sender);
    end;
end;

end.
