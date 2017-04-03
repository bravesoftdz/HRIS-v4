unit BaseCalendar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  RzPanel, Vcl.Grids, RzGrids, RzCmboBx, Vcl.ExtCtrls, Vcl.Mask, RzEdit,
  RzBtnEdt;

type
  TfrmBaseCalendar = class(TfrmBaseDocked)
    grCalendar: TRzStringGrid;
    cmbPeriod: TRzComboBox;
    pnlCalendar: TRzPanel;
    RzLabel16: TRzLabel;
    pnlColorLegend: TRzPanel;
    RzLabel8: TRzLabel;
    Shape8: TShape;
    Shape7: TShape;
    RzLabel7: TRzLabel;
    RzLabel6: TRzLabel;
    Shape6: TShape;
    RzLabel5: TRzLabel;
    Shape5: TShape;
    RzLabel4: TRzLabel;
    Shape4: TShape;
    RzLabel3: TRzLabel;
    Shape3: TShape;
    RzLabel2: TRzLabel;
    Shape2: TShape;
    RzLabel18: TRzLabel;
    bteFilter: TRzButtonEdit;
    procedure FormCreate(Sender: TObject);
    procedure cmbPeriodChange(Sender: TObject);
    procedure bteFilterButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteFilterAltBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure InitForm; virtual; abstract;
    procedure PopulateCalendar(const fetch: boolean = true); virtual; abstract;
    procedure PopulatePeriod; virtual; abstract;
    procedure InitCalendar; virtual; abstract;
    procedure ClearCalendar; virtual; abstract;
    procedure RefreshDisplay; virtual;
  end;

var
  frmBaseCalendar: TfrmBaseCalendar;

implementation

{$R *.dfm}

uses
  FilterSelect, ResourceFilter, TimeLogs;

procedure TfrmBaseCalendar.bteFilterAltBtnClick(Sender: TObject);
begin
  inherited;
  // clear the filter
  if resFilter.FilterType <> ftNone then
  begin
    resFilter.Clear;
    bteFilter.Clear;
    RefreshDisplay;
  end;
end;

procedure TfrmBaseCalendar.bteFilterButtonClick(Sender: TObject);
begin
  with TfrmFilterSelect.Create(nil) do
  begin
    ShowModal;

    if ModalResult = mrOK then
    begin
      bteFilter.Text := resFilter.FilterTypeName + ' - ' + resFilter.Name;
      RefreshDisplay;
    end;
  end;
end;

procedure TfrmBaseCalendar.cmbPeriodChange(Sender: TObject);
begin
  inherited;
  PopulateCalendar;
end;

procedure TfrmBaseCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  resFilter.Free;
end;

procedure TfrmBaseCalendar.FormCreate(Sender: TObject);
begin
  inherited;

  resFilter := TResourceFilter.Create;

  // Note: DO NOT mess with the sequence
  InitForm;
  PopulatePeriod;
  InitCalendar;
  PopulateCalendar;
end;

procedure TfrmBaseCalendar.RefreshDisplay;
begin
  tlogs.GroupNumber := 0;
  PopulateCalendar(false);
end;

end.
