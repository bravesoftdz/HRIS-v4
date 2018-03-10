unit EmployeeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, JvExControls, JvLabel, Vcl.ExtCtrls, RzPanel;

type
  TfrmEmployeeMain = class(TfrmBase)
    RzGroupBox2: TRzGroupBox;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    edMiddlename: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edLastname: TRzDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmployeeMain: TfrmEmployeeMain;

implementation

{$R *.dfm}

end.
