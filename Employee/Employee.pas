unit Employee;

interface

type
  TEmployee = class
  private
    FIdNumber: string;
    FLastName: string;
    FFirstName: string;
    function GetName: string;
  public
    property IdNumber: string read FIdNumber write FIdNumber;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Name: string read GetName;
  end;

implementation

{ TEmployee }

function TEmployee.GetName: string;
begin
  Result := FFirstName + ' ' + FLastName;
end;

end.


