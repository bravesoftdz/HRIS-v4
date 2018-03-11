unit EmployeeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, JvExControls, JvLabel, Vcl.ExtCtrls, RzPanel, Vcl.DBCtrls,
  RzButton, RzRadChk, RzDBChk, RzDBCmbo, RzCmboBx;

type
  TfrmEmployeeMain = class(TfrmBase)
    RzGroupBox2: TRzGroupBox;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    edMiddlename: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edLastname: TRzDBEdit;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    RzGroupBox1: TRzGroupBox;
    JvLabel7: TJvLabel;
    RzDBEdit4: TRzDBEdit;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBMemo1: TRzDBMemo;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    JvLabel11: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    RzGroupBox3: TRzGroupBox;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    JvLabel16: TJvLabel;
    RzGroupBox4: TRzGroupBox;
    RzDBEdit8: TRzDBEdit;
    JvLabel17: TJvLabel;
    RzDBEdit9: TRzDBEdit;
    JvLabel18: TJvLabel;
    RzDBEdit10: TRzDBEdit;
    JvLabel14: TJvLabel;
    RzDBEdit11: TRzDBEdit;
    JvLabel15: TJvLabel;
    RzDBEdit12: TRzDBEdit;
    RzDBCheckBox1: TRzDBCheckBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzDBComboBox1: TRzDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  EmployeeData, FormsUtil;

procedure TfrmEmployeeMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  OpenDropdownDataSources(self,false);
end;

procedure TfrmEmployeeMain.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(self);
end;

end.
