unit PafMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel, Vcl.Mask, RzEdit, RzBtnEdt,
  Vcl.DBCtrls, RzDBEdit, RzButton, RzRadChk, RzDBCmbo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, PafController, SaveIntf, RzDBChk;

type
  TfrmPafMain = class(TfrmBaseDocked2,ISave)
    edEmployee: TRzButtonEdit;
    JvLabel7: TJvLabel;
    JvLabel1: TJvLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    JvLabel5: TJvLabel;
    RzDBMemo1: TRzDBMemo;
    RzGroupBox3: TRzGroupBox;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzDBLookupComboBox5: TRzDBLookupComboBox;
    RzDBLookupComboBox6: TRzDBLookupComboBox;
    JvLabel2: TJvLabel;
    RzGroupBox1: TRzGroupBox;
    pnlDetail: TRzPanel;
    grSearch: TRzDBGrid;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    JvLabel11: TJvLabel;
    lblTotalAllowance: TJvLabel;
    lblSummary: TJvLabel;
    lblChanges: TJvLabel;
    pnlNew: TRzPanel;
    btnNew: TRzShapeButton;
    RzPanel1: TRzPanel;
    RzShapeButton1: TRzShapeButton;
    RzPanel2: TRzPanel;
    RzShapeButton2: TRzShapeButton;
    RzDBCheckBox1: TRzDBCheckBox;
    RzPanel3: TRzPanel;
    procedure edEmployeeButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Controller: TPafController;
    procedure SetEmployeeName;
    procedure RefreshForm;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
  end;

implementation

{$R *.dfm}

uses
  PafData, EmployeeSearch, Employee, FormsUtil;

procedure TfrmPafMain.Cancel;
begin

end;

procedure TfrmPafMain.edEmployeeButtonClick(Sender: TObject);
var
  LEmployee: TEmployee;
begin
  LEmployee := TEmployee.Create;

  with TfrmEmployeeSearch.Create(nil,LEmployee) do
  try
    ShowModal;
    if ModalResult = mrOK then
    begin
      Controller.Employee := LEmployee;
      Controller.Add;
      SetEmployeeName;
    end
    else LEmployee.Free;
  finally
    Free;
  end;
end;

procedure TfrmPafMain.FormCreate(Sender: TObject);
begin
  inherited;
  Controller := TPafController.Create;
  Controller.OnUpdate := RefreshForm;
end;

procedure TfrmPafMain.FormDestroy(Sender: TObject);
begin
  inherited;
  Controller.Free;
end;

procedure TfrmPafMain.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(self);
end;

procedure TfrmPafMain.RefreshForm;
begin
  lblTotalAllowance.Caption := FormatCurr('###,###,##0.00',Controller.TotalAllowance);
  lblChanges.Caption := Controller.Changes;
end;

function TfrmPafMain.Save: boolean;
begin
  Result := Controller.Save;
end;

procedure TfrmPafMain.SetEmployeeName;
begin
  edEmployee.Text := Controller.Employee.NameSurnameFirst;
end;

end.
