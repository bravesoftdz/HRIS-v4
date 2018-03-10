unit EmployeeController;

interface

uses
  SysUtils, Employee, BaseActionIntf;

type
  TEmployeeController = class(TInterfacedObject,IBaseAction)
  private
    FEmployee: TEmployee;
  public
    property Employee: TEmployee read FEmployee write FEmployee;

    procedure Save;
    procedure Add;
    procedure Cancel;
    procedure Delete;

    constructor Create;
    destructor Destroy;
  end;

implementation

{ TEmployeeController }

uses
  EmployeeData;

procedure TEmployeeController.Add;
begin

end;

procedure TEmployeeController.Cancel;
begin

end;

constructor TEmployeeController.Create;
begin
  inherited;
  FEmployee := TEmployee.Create;
end;

procedure TEmployeeController.Delete;
begin

end;

destructor TEmployeeController.Destroy;
begin
  FreeAndNil(FEmployee);
end;

procedure TEmployeeController.Save;
begin

end;

end.
