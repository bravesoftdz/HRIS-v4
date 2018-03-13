unit EmployeeDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, BaseDocked, EmployeeController, SaveIntf, Employee;

type
  TEmployeeForms = (efMain,efAddressAndContact,efFamily);

  TfrmEmployeeDrawer = class(TfrmBaseDocked2,ISave)
    pnlDock: TRzPanel;
    pnlMenu: TRzPanel;
    urlMain: TRzURLLabel;
    urlAddressAndContact: TRzURLLabel;
    urlFamily: TRzURLLabel;
    urlPhoto: TRzURLLabel;
    lblIdNumber: TRzLabel;
    urlPAFRecords: TRzURLLabel;
    urlPayroll: TRzURLLabel;
    procedure FormShow(Sender: TObject);
    procedure urlMainClick(Sender: TObject);
    procedure urlAddressAndContactClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure urlFamilyClick(Sender: TObject);
  private
    { Private declarations }
    DOCKED_FORM: TEmployeeForms;
    Controller: TEmployeeController;
    procedure DockForm(ef: TEmployeeForms);
    procedure EnableControls;
    procedure SetTitle;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;

    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AEmployee: TEmployee); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  EmployeeMain, AddressAndContact, FamilyAndRelatives;

{ TfrmEmployeeDrawer }

constructor TfrmEmployeeDrawer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmEmployeeDrawer.Cancel;
begin
  Controller.Cancel;
end;

constructor TfrmEmployeeDrawer.Create(AOwner: TComponent;
  const AEmployee: TEmployee);
begin
  inherited Create(AOwner);
  Controller := TEmployeeController.Create;

  if Assigned(AEmployee) then
  begin
  Controller.Employee := AEmployee;
  Controller.Action := eaEditing;
  end
  else Controller.Add;
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
      efMain: frm := TfrmEmployeeMain.Create(self,Controller.Employee);
      efAddressAndContact: frm := TfrmAddressAndContact.Create(self);
      efFamily: frm := TfrmFamilyAndRelatives.Create(self,Controller);
      else frm := nil;
    end;

    // controller
    case ef of
      efMain: Controller.Selected := sdMain;
      efAddressAndContact: Controller.Selected := sdAddressAndContact;
      efFamily: Controller.Selected := sdFamily;
      else Controller.Selected := sdNone;
    end;

    if Controller.Action = eaEditing then Controller.OnSelectionChanged;

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
  pnlMenu.Enabled := Controller.IsEditing;
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
  SetTitle;
end;

function TfrmEmployeeDrawer.Save: boolean;
begin
  Result := Controller.Save;

  EnableControls;
  SetTitle;
end;

procedure TfrmEmployeeDrawer.SetTitle;
begin
  if Assigned(Controller.Employee) then
  begin
    lblTitle.Caption := Controller.Employee.Name;
    lblIdNumber.Caption := 'ID Number: ' + Controller.Employee.IdNumber;
  end;
end;

procedure TfrmEmployeeDrawer.urlAddressAndContactClick(Sender: TObject);
begin
  inherited;
  DockForm(efAddressAndContact);
end;

procedure TfrmEmployeeDrawer.urlFamilyClick(Sender: TObject);
begin
  inherited;
  DockForm(efFamily);
end;

procedure TfrmEmployeeDrawer.urlMainClick(Sender: TObject);
begin
  inherited;
  DockForm(efMain);
end;

end.
