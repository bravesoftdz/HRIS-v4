unit FilterSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzButton, Vcl.ComCtrls, RzTreeVw;

type
  TfrmFilterSelect = class(TfrmBasePopup)
    pnlSearch: TRzPanel;
    pnlSelect: TRzPanel;
    btnSelect: TRzShapeButton;
    pnlCancel: TRzPanel;
    btnCancel: TRzShapeButton;
    tvFilter: TRzTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tvFilterDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure PopulateTree;
  protected
    { Public declarations }
  end;

var
  frmFilterSelect: TfrmFilterSelect;

implementation

{$R *.dfm}

uses
  TimelogData,Filter;

procedure TfrmFilterSelect.PopulateTree;
var
  i, cnt: integer;

  function GetParentNode: TTreeNode;
  var
    n: integer;
  begin
    Result := nil;
    for n := 0 to tvFilter.Items.Count - 1 do
      if Assigned(TFilter(tvFilter.Items[n].Data)) then
      begin
        Result := tvFilter.Items[n];
        Exit;
      end;
  end;

begin
  {with tvFilter do
  begin
    Items.Clear;

    cnt := Length(groups) - 1;

    // loop through the list and insert items with no parent first
    for i := 0 to cnt do
      if not groups[i].HasParent then
        Items.AddObject(nil,groups[i].GroupName,groups[i]);

    // loop through the list and insert child items (with parent)
    for i := 0 to cnt do
      if groups[i].HasParent then
        Items.AddChildObject(GetParentNode,groups[i].GroupName,groups[i]);

    FullExpand;
  end;  }
end;

procedure TfrmFilterSelect.tvFilterDblClick(Sender: TObject);
begin
  inherited;
  if Assigned(tvFilter.Selected.Data) then ModalResult := mrOk;
end;

procedure TfrmFilterSelect.btnSelectClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmFilterSelect.FormClose(Sender: TObject; var Action: TCloseAction);
var
  selFilter: TFilter;
begin
  if ModalResult = mrOK then
  begin
    selFilter := TFilter(tvFilter.Selected.Data);
    if Assigned(selFilter) then
    begin
      filtr.FilterType := selFilter.FilterType;
      filtr.Value := selFilter.Value;
    end;
  end;
  inherited;
end;

procedure TfrmFilterSelect.FormCreate(Sender: TObject);
begin

  PopulateTree;

  inherited;
end;

procedure TfrmFilterSelect.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then ModalResult := mrOK;
  inherited;
end;

procedure TfrmFilterSelect.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.
