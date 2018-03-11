unit EmployeeDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, BaseDocked, EmployeeController, SaveIntf;

type
  TEmployeeForms = (efMain,efAddressAndContact);

  TfrmEmployeeDrawer = class(TfrmBaseDocked2,ISave)
    pnlDock: TRzPanel;
    pnlMenu: TRzPanel;
    urlMain: TRzURLLabel;
    urlAddressAndContact: TRzURLLabel;
    urlFamily: TRzURLLabel;
    urlPhoto: TRzURLLabel;
    procedure FormShow(Sender: TObject);
    procedure urlMainClick(Sender: TObject);
    procedure urlAddressAndContactClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    DOCKED_FORM: TEmployeeForms;
    Controller: TEmployeeController;
    procedure DockForm(ef: TEmployeeForms);
    procedure EnableControls;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;

    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AController: TEmployeeController); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  EmployeeMain, AddressAndContact;

{ TfrmEmployeeDrawer }

constructor TfrmEmployeeDrawer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Controller := TEmployeeController.Create;
  Controller.Add;
end;

procedure TfrmEmployeeDrawer.Cancel;
begin
  Controller.Cancel;
end;

constructor TfrmEmployeeDrawer.Create(AOwner: TComponent;
  const AController: TEmployeeController);
begin
  inherited Create(AOwner);
  Controller := AController;
end;

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
      efMain: frm := TfrmEmployeeMain.Create(self);
      efAddressAndContact: frm := TfrmAddressAndContact.Create(self);
      else frm := nil;
    end;

    // controller
    case ef of
      efMain: Controller.Selected := sdMain;
      efAddressAndContact: Controller.Selected := sdAddressAndContact;
      else Controller.Selected := sdNone;
    end;

    if not Controller.New then Controller.OnSelectionChanged;

    if Assigned(frm) then
    begin
      DOCKED_FORM := ef;

      frm.ManualDock(pnlDocK);
      frm.Show;
    end;
  end;
end;

procedure TfrmEmployeeDrawer.EnableControls;
begin
  pnlMenu.Enabled := not Controller.New;
end;

procedure TfrmEmployeeDrawer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(Controller);
end;

procedure TfrmEmployeeDrawer.FormShow(Sender: TObject);
begin
  inherited;
  DockForm(efMain);
  EnableControls;
end;

function TfrmEmployeeDrawer.Save: boolean;
begin
  Controller.Save;
  EnableControls;
end;

procedure TfrmEmployeeDrawer.urlAddressAndContactClick(Sender: TObject);
begin
  inherited;
  DockForm(efAddressAndContact);
end;

procedure TfrmEmployeeDrawer.urlMainClick(Sender: TObject);
begin
  inherited;
  DockForm(efMain);
end;

end.
