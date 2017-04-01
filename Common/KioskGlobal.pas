unit KioskGlobal;

interface

uses
  User, SysUtils, DateUtils, PayrollCode, Location, Employee;

type
  TKioskGlobal = class
  private
    FCurrentDate: TDate;
    FUser: TUser;
    FEmployee: TEmployee;
    FVersion: string;
    FLocationCode: string;
    FAppImagesPath: string;
    FMaximumUndertime: integer; // in minutes
    FActivePayrollCodes: array of TPayrollCode;
    FLocations: array of TLocation;

    function GetTimeInAM: double;
    function GetTimeOutAM: double;
    function GetTimeInPM: double;
    function GetTimeOutPM: double;
    function GetPayrollCode(const i: integer): TPayrollCode;
    function GetActivePayrollCount: integer;
    function GetLocation(const i: integer): TLocation;
    function GetLocationCount: integer;

  public
    property CurrentDate: TDate read FCurrentDate write FCurrentDate;
    property User: TUser read FUser write FUser;
    property Employee: TEmployee read FEmployee write FEmployee;
    property Version: string read FVersion write FVersion;
    property LocationCode: string read FLocationCode write FLocationCode;
    property AppImagesPath: string read FAppImagesPath write FAppImagesPath;
    property MaximumUndertime: integer read FMaximumUndertime write FMaximumUndertime;
    property TimeInAM: double read GetTimeInAM;
    property TimeOutAM: double read GetTimeOutAM;
    property TimeInPM: double read GetTimeInPM;
    property TimeOutPM: double read GetTimeOutPM;
    property ActivePayrollCodes[const i: integer]: TPayrollCode read GetPayrollCode;
    property ActivePayrollCount: integer read GetActivePayrollCount;
    property Locations[const i: integer]: TLocation read GetLocation;
    property LocationCount: integer read GetLocationCount;

    procedure AddActivePayrollCode(const pc: TPayrollCode);
    procedure AddLocation(const loc: TLocation);

    function GetLocationNameByCode(const code: string): string;

    constructor Create;
  end;

var
  kk: TKioskGlobal;

implementation

constructor TKioskGlobal.Create;
begin
  if kk = nil then
  begin
    FUser := TUser.Create;
    FEmployee := TEmployee.Create;

    kk := self
  end
  else
    Abort;
end;

procedure TKioskGlobal.AddActivePayrollCode(const pc: TPayrollCode);
begin
  SetLength(FActivePayrollCodes,Length(FActivePayrollCodes) + 1);
  FActivePayrollCodes[Length(FActivePayrollCodes) - 1] := pc;
end;

procedure TKioskGlobal.AddLocation(const loc: TLocation);
begin
  SetLength(FLocations,Length(FLocations) + 1);
  FLocations[Length(FLocations) - 1] := loc;
end;

function TKioskGlobal.GetTimeInAM: double;
begin
  if DayOfTheWeek(FCurrentDate) = DaySaturday then
    Result := EncodeTime(8,0,0,0)
  else
    Result := EncodeTime(8,30,0,0);
end;

function TKioskGlobal.GetTimeOutAM: double;
begin
  Result := EncodeTime(12,0,0,0);
end;

function TKioskGlobal.GetTimeInPM: double;
begin
  Result := EncodeTime(13,0,0,0);
end;

function TKioskGlobal.GetTimeOutPM: double;
begin
  Result := EncodeTime(17,30,0,0);
end;

function TKioskGlobal.GetPayrollCode(const i: integer): TPayrollCode;
begin
  Result := FActivePayrollCodes[i];
end;

function TKioskGlobal.GetActivePayrollCount: integer;
begin
  Result := Length(FActivePayrollCodes);
end;

function TKioskGlobal.GetLocation(const i: Integer): TLocation;
begin
  Result := FLocations[i];
end;

function TKioskGlobal.GetLocationNameByCode(const code: string): string;
var
  loc: TLocation;
begin
  Result := 'Unknown';

  for loc in FLocations do
    if code = Trim(loc.LocationCode) then
    begin
      Result := loc.LocationName;
      Exit;
    end;
end;

function TKioskGlobal.GetLocationCount: integer;
begin
  Result := Length(FLocations);
end;


end.
