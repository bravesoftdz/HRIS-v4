unit EmployeePAF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid;

type
  TfrmEmployeePAF = class(TfrmBase)
    grSearch: TRzDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  EmployeeData;

end.
