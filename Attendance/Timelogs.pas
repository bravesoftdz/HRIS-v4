unit Timelogs;

interface

uses
  Timelog, SysUtils;

type TCalendarViewOption = (cvoSimple,cvoGraphical);
type TPeriodView = (pvYear,pvPayroll);

type
  TConflict = class(TTimelog)

  end;

type
  TTimeLogs = class
  private
    FLogs: array of TTimelog;
    FViewOption: TCalendarViewOption;
    FGroupNumber: integer;
    FRecordsPerGroup: integer;
    FCurrentIndex: integer;
    FPeriodView: TPeriodView;
    FConflictLogs: array of TConflict;

    function GetLog(const i: integer): TTimelog;
    function GetLogCount: integer;
    function LogExists(const log: TTimelog): boolean;
    function GetConflict(const i: integer): TConflict;

  public
    procedure Retrieve(const fromDate, toDate: TDate; const idNum, branchCode: string);
    procedure AddLog(const log: TTimelog);
    procedure Clear;
    procedure AddConflict(const conflict: TConflict);

    property Logs[const i: integer]: TTimelog read GetLog;
    property LogsCount: integer read GetLogCount;
    property ViewOption: TCalendarViewOption read FViewOption write FViewOption;
    property GroupNumber: integer read FGroupNumber write FGroupNumber;
    property RecordsPerGroup: integer read FRecordsPerGroup;
    property CurrentIndex: integer read FCurrentIndex write FCurrentIndex;
    property PeriodView: TPeriodView read FPeriodView write FPeriodView;
    property Conflicts[const i: integer]: TConflict read GetConflict;

    constructor Create;
  end;

var
  tlogs: TTimeLogs;

implementation

uses
  TimelogData, KioskGlobal;

constructor TTimeLogs.Create;
begin
  if tlogs <> nil then tlogs := self
  else inherited Create;

  FGroupNumber := 0;
  FRecordsPerGroup := 12;
end;

procedure TTimeLogs.Retrieve(const fromDate, toDate: TDate; const idNum, branchCode: string);
begin
  with dmTimelog.dstLogs do
  begin
    try
      Parameters.ParamByName('@date_from').Value := fromDate;
      Parameters.ParamByName('@date_until').Value := toDate;
      Parameters.ParamByName('@id_num').Value := idNum;
      Parameters.ParamByName('@branch_code').Value := branchCode;
      Open;
    finally
      Close;
    end;
  end;
end;

procedure TTimeLogs.AddConflict(const conflict: TConflict);
begin
  SetLength(FConflictLogs,Length(FConflictLogs) + 1);
  FConflictLogs[Length(FConflictLogs) - 1] := conflict;
end;

procedure TTimeLogs.AddLog(const log: TTimelog);
begin
  if not LogExists(log) then
  begin
    SetLength(FLogs,Length(FLogs) + 1);
    FLogs[Length(FLogs) - 1] := log;
  end;
end;

procedure TTimeLogs.Clear;
begin
  FLogs := [];
end;

function TTimeLogs.GetConflict(const i: integer): TConflict;
begin
  Result := FConflictLogs[i];
end;

function TTimeLogs.GetLog(const i: Integer): TTimeLog;
begin
  Result := FLogs[i];
end;

function TTimeLogs.GetLogCount: integer;
begin
  Result := Length(FLogs);
end;

function TTimeLogs.LogExists(const log: TTimelog): boolean;
var
  l: TTimeLog;
begin
  Result := false;
  for l in FLogs do
  begin
    if (l.Date = log.Date) and (l.Employee.IdNum = log.Employee.IdNum) then
    begin
      // tag the found log as having a conflict
      l.HasConflict := true;

      // add the conlict
      AddConflict(TConflict(log));

      Result := true;
      Exit;
    end;
  end;
end;

end.
