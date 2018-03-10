unit EmployeeDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, BaseDocked;

type
  TEmployeeForms = (efMain);

  TfrmEmployeeDrawer = class(TfrmBaseDocked2)
    pnlDock: TRzPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DOCKED_FORM: TEmployeeForms;
    procedure DockForm(ef: TEmployeeForms);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  EmployeeMain;

{ TfrmEmployeeDrawer }

procedure TfrmEmployeeDrawer.DockForm(ef: TEmployeeForms);
var
  frm: TForm;
  control: integer;
begin
  //if (pnlDockMain.ControlCount = 0) or (DOCKED_FORM <> fm) then
  begin
    control := 0;

    while control < pnlDock.ControlCount do
    begin
      if pnlDock.Controls[control] is TForm then
      begin
        (pnlDock.Controls[control] as TForm).Close;
        (pnlDock.Controls[control] as TForm).Free;
      end;

      Inc(control);
    end;

    // instantiate form
    case ef of
      efMain: frm := TfrmEmployeeMain.Create(nil);

      else
        frm := nil;
    end;

    if Assigned(frm) then
    begin
      DOCKED_FORM := ef;

      frm.ManualDock(pnlDocK);
      frm.Show;
    end;
  end;
end;

procedure TfrmEmployeeDrawer.FormShow(Sender: TObject);
begin
  inherited;
  DockForm(efMain);
end;

end.
