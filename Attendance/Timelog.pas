unit Timelog;

interface

uses
  SysUtils, Graphics, DateUtils, Employee;

type
  TPeriod = (pdMorning,pdAfternoon,pdWholeDay);

type
  TLeave = class
  private
    FAmPm: string;
    FLeaveType: string;
    FLeaveTypeName: string;
    FReason: string;
    FRemarks: string;

    function GetHalfDay: boolean;
    function GetIsBusinessTrip: boolean;
  public
    property AmPm: string read FAmPm write FAmPm;
    property LeaveType: string read FLeaveType write FLeaveType;
    property LeaveTypeName: string read FLeaveTypeName write FLeaveTypeName;
    property IsHalfDay: boolean read GetHalfDay;
    property Reason: string read FReason write FReason;
    property Remarks: string read FRemarks write FRemarks;
    property IsBusinessTrip: boolean read GetIsBusinessTrip;

    constructor Create(const ap, tp, nm, rs, rm: string);
  end;

type
  TUndertime = class
  private
    FTimeFrom: string;
    FTimeUntil: string;
    FAmPM: string;
    FReason: string;
  public
    property TimeFrom: string read FTimeFrom write FTimeFrom;
    property TimeUntil: string read FTimeUntil write FTimeUntil;
    property AmPm: string read FAmPM write FAmPM;
    property Reason: string read FReason write FReason;

    constructor Create(const fr, ut, ap, rs: string);
  end;

type
  TOverride = class
  private
    FTimeIn: string;
    FTimeOut: string;
    FAmPM: string;
    FReason: string;
  public
    property TimeIn: string read FTimeIn write FTimeIn;
    property TimeOut: string read FTimeOut write FTimeOut;
    property AmPm: string read FAmPm write FAmPm;
    property Reason: string read FReason write FReason;

    constructor Create(const i, o, ap, rs: string);
  end;

type
  THoliday = class
  private
    FName: string;
    FIsNational: integer;

    function GetIsNational: boolean;

  public
    property Name: string read FName write FName;
    property IsNational: boolean read GetIsNational;

    constructor Create(const nm: string; const isNat: integer);
  end;

type
  TTimelog = class(TObject)
  private
    FEmployee: TEmployee;
    FLocationCode: string;
    FDate: TDate;
    FTimeInAM: string;
    FTimeOutAM: string;
    FTimeInPM: string;
    FTimeOutPM: string;
    FTotalHoursAM: real;
    FTotalHoursPM: real;
    FLeaves: array of TLeave;
    FUndertimes: array of TUndertime;
    FOverrides: array of TOverride;
    FHoliday: THoliday;
    FHasConflict: boolean;

    function GetMaxHours: integer;
    function GetComplete: boolean;
    function GetHasLeave: boolean;
    function GetMonth: integer;
    function GetDay: integer;
    function GetYear: integer;
    function GetHasUndertime: boolean;
    function GetHasOverride: boolean;
    function GetIsSunday: boolean;
    function GetLeave(const i: integer): TLeave; overload;
    function GetLeave(const period: TPeriod): TLeave; overload;
    function GetUndertime(const i: integer): TUndertime; overload;
    function GetUndertime(const period: TPeriod): TUndertime; overload;
    function GetOverride(const i: integer): TOverride; overload;
    function GetOverride(const period: TPeriod): TOverride; overload;
    function GetIsEmpty: boolean;
    function GetNoLog: boolean;
    function GetIsHoliday: boolean;
    function GetLeaveCount: integer;
    function GetUndertimeCount: integer;
    function GetLeaveIsWholeDay: boolean;

  public
    property Employee: TEmployee read FEmployee write FEmployee;
    property LocationCode: string read FLocationCode write FLocationCode;
    property Date: TDate read FDate write FDate;
    property TimeInAM: string read FTimeInAM write FTimeInAM;
    property TimeOutAM: string read FTimeOutAM write FTimeOutAM;
    property TimeInPM: string read FTimeInPM write FTimeInPM;
    property TimeOutPM: string read FTimeOutPM write FTimeOutPM;
    property TotalHoursAM: real read FTotalHoursAM write FTotalHoursAM;
    property TotalHoursPM: real read FTotalHoursPM write FTotalHoursPM;
    property Complete: boolean read GetComplete;
    property MaxHours: integer read GetMaxHours;
    property Leaves1[const i: integer]: TLeave read GetLeave;
    property Leaves2[const p: TPeriod]: TLeave read GetLeave;
    property HasLeave: boolean read GetHasLeave;
    property Month: integer read GetMonth;
    property Day: integer read GetDay;
    property Year: integer read GetYear;
    property Undertimes1[const i: integer]: TUndertime read GetUndertime;
    property Undertimes2[const p: TPeriod]: TUndertime read GetUndertime;
    property HasUndertime: boolean read GetHasUndertime;
    property Ovride1[const i: integer]: TOverride read GetOverride;
    property Ovride2[const p: TPeriod]: TOverride read GetOverride;
    property HasOverride: boolean read GetHasOverride;
    property IsSunday: boolean read GetIsSunday;
    property Holiday: THoliday read FHoliday write FHoliday;
    property IsEmpty: boolean read GetIsEmpty;
    property NoLog: boolean read GetNoLog;
    property IsHoliday: boolean read GetIsHoliday;
    property LeaveCount: integer read GetLeaveCount;
    property UndertimeCount: integer read GetUndertimeCount;
    property LeaveIsWholeDay: boolean read GetLeaveIsWholeDay;
    property HasConflict: boolean read FHasConflict write FHasConflict;

    procedure AddLeave(const lv: TLeave);
    procedure ClearLeaves;
    procedure AddUndertime(const ut: TUndertime);
    procedure ClearUndertimes;
    procedure AddOverride(const ov: TOverride);
    procedure ClearOverrides;

    constructor Create;
  end;

var
  tlog: TTimelog;

implementation

constructor TLeave.Create(const ap, tp, nm, rs, rm: string);
begin
  FAmPm := ap;
  FLeaveType := tp;
  FLeaveTypeName := nm;
  FReason := rs;
  FRemarks := rm;
end;

function TLeave.GetHalfDay;
begin
  Result := FAmPM <> '';
end;

function TLeave.GetIsBusinessTrip: boolean;
begin
  Result := Trim(FLeaveType) = 'BT';
end;

constructor TTimelog.Create;
begin
  FUndertimes := [];
  FOverrides := [];
  FLeaves := [];
end;

procedure TTimelog.AddLeave(const lv: TLeave);
begin
  SetLength(FLeaves,Length(FLeaves) + 1);
  FLeaves[Length(FLeaves) - 1] := lv;
end;

procedure TTimelog.ClearLeaves;
begin
  FLeaves := [];
end;

procedure TTimelog.AddUndertime(const ut: TUndertime);
begin
  SetLength(FUndertimes,Length(FUndertimes) + 1);
  FUndertimes[Length(FUndertimes) - 1] := ut;
end;

procedure TTimelog.ClearUndertimes;
begin
  FUndertimes := [];
end;

procedure TTimelog.AddOverride(const ov: TOverride);
begin
  SetLength(FOverrides,Length(FOverrides) + 1);
  FOverrides[Length(FOverrides) - 1] := ov;
end;

procedure TTimelog.ClearOverrides;
begin
  FOverrides := [];
end;

function TTimelog.GetMaxHours: integer;
begin
  if DayOfTheWeek(FDate) = 6  then
    Result := 4
  else
    Result := 8;
end;

function TTimelog.GetComplete: boolean;
begin
  Result := FTotalHoursAM + FTotalHoursPM >= GetMaxHours;
end;

function TTimelog.GetHasLeave: boolean;
begin
  Result := Length(FLeaves) > 0;
end;

function TTimelog.GetMonth: integer;
begin
  Result := MonthOf(FDate);
end;

function TTimelog.GetDay: integer;
begin
  Result := DayOf(FDate);
end;

function TTimelog.GetYear: integer;
begin
  Result := YearOf(FDate);
end;

function TTimelog.GetHasUndertime: boolean;
begin
  Result := Length(FUndertimes) > 0;
end;

function TTimelog.GetHasOverride: boolean;
begin
  Result := Length(FOverrides) > 0;
end;

function TTimelog.GetIsSunday: boolean;
begin
  Result := DayOfTheWeek(FDate) = DaySunday;
end;

function TTimelog.GetLeave(const i: Integer): TLeave;
begin
  Result := FLeaves[i];
end;

function TTimeLog.GetLeave(const period: TPeriod): TLeave;
var
  i, cnt: integer;
  pd: string;
  lv: TLeave;
begin
  lv := nil;

  cnt := Length(FLeaves) - 1;

  if period = pdMorning then pd := 'A'
  else if period = pdAfternoon then pd := 'P'
  else pd := '';

  for i := 0 to cnt do
  begin
    if FLeaves[i].FAmPM = pd then
      lv := FLeaves[i];
  end;

  Result := lv;
end;

function TTimeLog.GetUndertime(const i: Integer): TUndertime;
begin
  Result := FUndertimes[i];
end;

function TTimeLog.GetUndertime(const period: TPeriod): TUndertime;
var
  i, cnt: integer;
  pd: string;
  ut: TUndertime;
begin
  ut := TUndertime.Create('','','','');

  cnt := Length(FUndertimes) - 1;

  if period = pdMorning then pd := 'A' else pd := 'P';

  for i := 0 to cnt do
  begin
    if FUndertimes[i].FAmPM = pd then
      ut := FUndertimes[i];
  end;

  Result := ut;
end;

function TTimelog.GetOverride(const i: Integer): TOverride;
begin
  Result := FOverrides[i];
end;

function TTimeLog.GetOverride(const period: TPeriod): TOverride;
var
  i, cnt: integer;
  pd: string;
  ov: TOverride;
begin
  ov := TOverride.Create('','','','');

  cnt := Length(FOverrides) - 1;

  if period = pdMorning then pd := 'A' else pd := 'P';

  for i := 0 to cnt do
  begin
    if FOverrides[i].FAmPM = pd then
      ov := FOverrides[i];
  end;

  Result := ov;
end;

function TTimelog.GetIsEmpty: boolean;
begin
  Result := (GetNoLog) and (not GetHasLeave) and (not GetHasUndertime)
                and (not GetHasUndertime) and (not GetIsHoliday)
                and (not GetHasOverride);
end;

function TTimelog.GetNoLog: boolean;
begin
  Result := ((FTimeInAM = '') and (FTimeOutAM = '')
                and (FTimeInPM = '') and (FTimeOutPM = ''))
                and (not GetHasOverride);
end;

function TTimelog.GetIsHoliday: boolean;
begin
  Result := Assigned(FHoliday);
end;

function TTimelog.GetLeaveCount: integer;
begin
  Result := Length(FLeaves);
end;

function TTimelog.GetUndertimeCount: integer;
begin
  Result := Length(FUndertimes);
end;

function TTimelog.GetLeaveIsWholeDay: boolean;
var
  i, cnt: integer;
begin
  Result := false;
  cnt := Length(FLeaves) - 1;
  for i := 0 to cnt do
  begin
    if FLeaves[i].FAmPm = '' then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

constructor TUndertime.Create(const fr, ut, ap, rs: string);
begin
  FTimeFrom := fr;
  FTimeUntil := ut;
  FAmPM := ap;
  FReason := rs;
end;

constructor TOverride.Create(const i, o, ap, rs: string);
begin
  FTimeIn := i;
  FTimeOut := o;
  FAmPM := ap;
  FReason := rs;
end;

constructor THoliday.Create(const nm: string; const isNat: Integer);
begin
  FName := nm;
  FIsNational := isNat;
end;

function THoliday.GetIsNational: boolean;
begin
  Result := FIsNational = 1;
end;

end.
