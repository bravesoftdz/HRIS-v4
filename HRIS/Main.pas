unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, RzPanel,
  JvPageList, JvNavigationPane, JvExControls, RzButton, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, AppConstants, Vcl.StdCtrls, RzLabel,
  JvImageList, RzStatus, DockIntf, RzLstBox, Vcl.AppEvnts, Generics.Collections, RzTabs,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Buttons;

type
  TfrmMain = class(TForm,IDock)
    pnlTitle: TRzPanel;
    imgClose: TImage;
    lblCaption: TRzLabel;
    pnlMain: TRzPanel;
    pnlDockMain: TRzPanel;
    mmMain: TMainMenu;
    File1: TMenuItem;
    Save1: TMenuItem;
    alMain: TActionList;
    acSave: TAction;
    acAddClient: TAction;
    Newclient1: TMenuItem;
    acNewLoan: TAction;
    Newloan1: TMenuItem;
    acGenericNew: TAction;
    New1: TMenuItem;
    lblDate: TLabel;
    lblVersion: TLabel;
    Client1: TMenuItem;
    Loan1: TMenuItem;
    Selectclient1: TMenuItem;
    acSelectClient: TAction;
    Newpayment1: TMenuItem;
    acNewPayment: TAction;
    Payment1: TMenuItem;
    Selectclient2: TMenuItem;
    acAddActiveLoan: TAction;
    imgMinimize: TImage;
    pcMenu: TRzPageControl;
    tsHome: TRzTabSheet;
    tsAdministration: TRzTabSheet;
    pnlAddClient: TRzPanel;
    imgAddEmployee: TImage;
    pnlCancel: TRzPanel;
    imgCancel: TImage;
    pnlNewLoan: TRzPanel;
    imgNewLoan: TImage;
    pnlPayment: TRzPanel;
    imgNewPayment: TImage;
    pnlSave: TRzPanel;
    imgSave: TImage;
    lblWelcome: TRzLabel;
    pnlBank: TRzPanel;
    imgBanks: TImage;
    pnlCompetitor: TRzPanel;
    imgCompetitor: TImage;
    pnlDesignationList: TRzPanel;
    imgDesignationList: TImage;
    pnlEmployer: TRzPanel;
    imgEmployer: TImage;
    pnlGroups: TRzPanel;
    imgGroups: TImage;
    pnlLoanCancellationReasonList: TRzPanel;
    imgLoanCancellationReasonList: TImage;
    pnlLoanClass: TRzPanel;
    imgLoanClass: TImage;
    pnlLoanType: TRzPanel;
    imgLoanType: TImage;
    pnlPurpose: TRzPanel;
    imgPurpose: TImage;
    pnlRejectionReasonList: TRzPanel;
    imgRejectionReasonList: TImage;
    pnlSettings: TRzPanel;
    imgSettings: TImage;
    pnlAcctType: TRzPanel;
    imgAcctType: TImage;
    pnlChargeTypes: TRzPanel;
    imgChargeTypes: TImage;
    pnlInfoSources: TRzPanel;
    imgInfoSources: TImage;
    pnlLoanClosureReasonsList: TRzPanel;
    imgLoanClosureReasonsList: TImage;
    procedure FormCreate(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCloseClick(Sender: TObject);
    procedure imgAddEmployeeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAddEmployeeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSaveClick(Sender: TObject);
    procedure imgCancelClick(Sender: TObject);
    procedure acGenericNewExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgMinimizeClick(Sender: TObject);
    procedure imgAddEmployeeClick(Sender: TObject);
  private
    { Private declarations }
    DOCKED_FORM: TForms;
    procedure SetCaptions;
    procedure Cancel;
    procedure Save;
  public
    { Public declarations }
    procedure DockForm(const fm: TForms; const title: string = '');
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  EmployeeDrawer, NewIntf, SaveIntf, FormsUtil, HRISDialogs;

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

procedure TfrmMain.DockForm(const fm: TForms; const title: string);
var
  frm: TForm;
  control: integer;
begin
  //if (pnlDockMain.ControlCount = 0) or (DOCKED_FORM <> fm) then
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

    // instantiate form
    case fm of
      fmEmployeeDrawer: frm := TfrmEmployeeDrawer.Create(Application);

      else
        frm := nil;
    end;

    if Assigned(frm) then
    begin
      DOCKED_FORM := fm;

      frm.ManualDock(pnlDockMain);
      frm.Show;
    end;
  end;
end;

procedure TfrmMain.Save;
var
  intf: ISave;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm, ISave, intf) then
        if intf.Save then
          ShowConfirmationBox2;
  except
    on e: Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.Cancel;
var
  intf: ISave;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm, ISave, intf) then
        intf.Cancel;
  except
    on e: Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DOCKED_FORM := fmNone;

  Height := 700; // for some reason form keeps on resizing...

  // hide menu bar
  Self.Menu := nil;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  SetCaptions;
end;

procedure TfrmMain.imgAddEmployeeClick(Sender: TObject);
begin
  DockForm(fmEmployeeDrawer);
end;

procedure TfrmMain.imgAddEmployeeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ButtonDown(Sender);
end;

procedure TfrmMain.imgAddEmployeeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ButtonUp(Sender);
end;

procedure TfrmMain.imgCancelClick(Sender: TObject);
begin
  Cancel;
end;

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Cancel;
  Application.Terminate;
end;

procedure TfrmMain.imgMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmMain.imgSaveClick(Sender: TObject);
begin
  Save;
end;

procedure TfrmMain.acGenericNewExecute(Sender: TObject);
var
  intf: INew;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,INew,intf) then
        intf.New;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.SetCaptions;
begin
//  lblCaption.Caption := ifn.AppName + ' - ' + ifn.AppDescription;
//  lblWelcome.Caption := 'Welcome back ' + ifn.User.Name + '.';
//  lblDate.Caption := 'Today is ' + FormatDateTime('mmmm dd, yyyy', ifn.AppDate);
//  lblLocation.Caption := 'Location: ' + ifn.GetLocationNameByCode(ifn.LocationCode);
//  lblVersion.Caption := 'Version ' + ifn.Version;
end;

end.
