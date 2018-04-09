unit Employee;

interface

type
  TEmployee = class
  private
    FIdNum: string;
    FFirstName: string;
    FLastName: string;
    FLocationCode: string;
    FDepartmentCode: string;
    FPositionTypeCode: string;

    function GetFullName: string;
  public
    property IdNum: string read FIdNum write FIdNum;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property LocationCode: string read FLocationCode write FLocationCode;
    property DepartmentCode: string read FDepartmentCode write FDepartmentCode;
    property PositionTypeCode: string read FPositionTypeCode write FPositionTypeCode;
    property FullName: string read GetFullName;

    constructor Create;
    destructor Destroy; reintroduce;
  end;

var
  empl: TEmployee;

implementation

constructor TEmployee.Create;
begin
  if empl <> nil then empl := self
  else inherited Create;
end;

destructor TEmployee.Destroy;
begin
  if empl = self then
    empl := nil;
end;

function TEmployee.GetFullName;
begin
  Result := FLastName + ', ' + FFirstName;
end;

end.

