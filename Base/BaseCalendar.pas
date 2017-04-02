unit BaseCalendar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Grids, RzGrids, RzCmboBx;

type
  TfrmBaseCalendar = class(TfrmBaseDocked)
    grCalendar: TRzStringGrid;
    cmbPeriod: TRzComboBox;
    pnlCalendar: TRzPanel;
    procedure FormCreate(Sender: TObject);
    procedure cmbPeriodChange(Sender: TObject);
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
  end;

var
  frmBaseCalendar: TfrmBaseCalendar;

implementation

{$R *.dfm}

procedure TfrmBaseCalendar.cmbPeriodChange(Sender: TObject);
begin
  inherited;
  PopulateCalendar;
end;

procedure TfrmBaseCalendar.FormCreate(Sender: TObject);
begin
  inherited;
  // Note: DO NOT mess with the sequence
  InitForm;
  PopulatePeriod;
  InitCalendar;
  PopulateCalendar;
end;

end.
