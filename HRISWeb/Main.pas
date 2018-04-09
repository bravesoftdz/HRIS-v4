unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniGUIFrame;

type
  TWebFrames = (frEmployeeDrawer,frTagRegistrationList,frShipList,frReportSettings);

  TMainForm = class(TUniForm)
    DockPanel: TUniPanel;
    lblWelcomeUser: TUniLabel;
    LogoutLabel: TUniLabel;
    ProfileLabel: TUniLabel;
    UniLabel2: TUniLabel;
    UniSimplePanel1: TUniSimplePanel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure LogoutLabelClick(Sender: TObject);
    procedure lblShipsClick(Sender: TObject);
    procedure ProfileLabelClick(Sender: TObject);
  private
    { Private declarations }
    procedure DockFrame(frame: TWebFrames);
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, EmployeeDrawer;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.DockFrame(frame: TWebFrames);
var
  LFrame: TUniFrame;
begin
  // clear the dock panel
  if DockPanel.ControlCount <> 0 then (DockPanel.Controls[0] as TUniFrame).Free;

  case frame of
    frEmployeeDrawer: LFrame := TEmployeeDrawerFrame.Create(self);
  end;

  // dock the new frame
  LFrame.Parent := DockPanel;
  LFrame.Show;
end;

procedure TMainForm.LogoutLabelClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ProfileLabelClick(Sender: TObject);
begin
  DockFrame(frEmployeeDrawer);
end;

procedure TMainForm.lblShipsClick(Sender: TObject);
begin
  DockFrame(frShipList);
end;

procedure TMainForm.UniFormAfterShow(Sender: TObject);
begin
  lblWelcomeUser.Caption := 'Welcome back ' + UniMainModule.User.FirstName + '.';
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
