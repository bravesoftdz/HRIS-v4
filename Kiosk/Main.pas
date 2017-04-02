unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzBmpBtn, RzButton, RefreshIntf,
  DockIntf;

type
  TfrmMain = class(TfrmBase, IDock)
    pnlTitle: TRzPanel;
    imgClose: TImage;
    lblCaption: TRzLabel;
    pnlMain: TRzPanel;
    pnlTimelog: TRzPanel;
    btnTimelog: TRzShapeButton;
    imgTimelog: TImage;
    pnlDockMain: TRzPanel;
    lblWelcome: TRzLabel;
    pnlLeave: TRzPanel;
    btnLeave: TRzShapeButton;
    imgLeaveBtn: TImage;
    pnlForApproval: TRzPanel;
    btnForApproval: TRzShapeButton;
    imgForApproval: TImage;
    RzPanel1: TRzPanel;
    btnSynchronise: TRzShapeButton;
    imgSynchronise: TImage;
    RzPanel2: TRzPanel;
    RzShapeButton2: TRzShapeButton;
    Image2: TImage;
    pnlUndertime: TRzPanel;
    btnUndertime: TRzShapeButton;
    imgUndertimeBtn: TImage;
    lblLocation: TRzLabel;
    procedure imgCloseClick(Sender: TObject);
    procedure btnTimelogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnForApprovalClick(Sender: TObject);
    procedure btnUndertimeClick(Sender: TObject);
    procedure btnSynchroniseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DockForm(const fm: TForms; const title: string = '');
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  TimelogYear, KioskGlobal, TimelogData, UndertimeDetails, ForApproval, SyncMain,
  TimelogPayPeriod;

procedure TfrmMain.DockForm(const fm: TForms; const title: string);
var
  frm: TForm;
  control: integer;
begin
  // if (pnlDockMain.ControlCount = 0) or ((pnlDockMain.ControlCount > 0) and
  //  ((pnlDockMain.Controls[0].ClassType <> frm.ClassType))) then

  begin
    control := 0;

    while control < pnlDockMain.ControlCount do
    begin
      if pnlDockMain.Controls[control] is TForm then
      begin
        (pnlDockMain.Controls[control] as TForm).Close;
        (pnlDockMain.Controls[control] as TForm).Free;
      end;

      Inc(control);
    end;

    pnlDockMain.Update;

    Application.ProcessMessages;

    // instantiate form
    case fm of
      fmTimelogYear: frm := TfrmTimelogYear.Create(Application);
      fmUndertime: frm := TfrmUndertimeDetails.Create(Application);
      fmForApproval: frm := TfrmForApproval.Create(Application);
      fmSynchronisation: frm := TfrmSyncMain.Create(Application);
      fmTimelogPayPeriod: frm := TfrmTimelogPayPeriod.Create(Application);
    else
      frm := TForm.Create(Application);
    end;

    frm.ManualDock(pnlDockMain);
    frm.Show;
  end;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  lblCaption.Caption := 'Kiosk ver. ' + kk.Version;
  lblWelcome.Caption := 'Welcome back ' + kk.Employee.FullName + '.';
  lblLocation.Caption := 'Location: ' + kk.GetLocationNameByCode(kk.LocationCode);

  dmTimelog := TdmTimelog.Create(self);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  inherited;
  DockForm(fmTimelogYear);
end;

procedure TfrmMain.btnTimelogClick(Sender: TObject);
begin
  inherited;
  DockForm(fmTimelogYear);
end;

procedure TfrmMain.btnUndertimeClick(Sender: TObject);
var
  intf: IRefresh;
begin
  inherited;
  with TfrmUndertimeDetails.Create(self) do
  begin
    ShowModal;

    if ModalResult = mrOk then
    begin
      if Supports(pnlDockMain.Controls[0] as TForm,IRefresh,intf) then
        intf.RefreshDisplay;
    end;

    Free;
  end;
end;

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TfrmMain.btnSynchroniseClick(Sender: TObject);
begin
  inherited;
  DockForm(fmSynchronisation);
end;

procedure TfrmMain.btnForApprovalClick(Sender: TObject);
begin
  inherited;
  DockForm(fmForApproval);
end;

end.