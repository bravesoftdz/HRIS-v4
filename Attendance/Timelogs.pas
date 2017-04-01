unit Timelogs;

interface

uses
  Timelog, SysUtils;

type TCalendarViewOption = (cvoSimple,cvoGraphical);

type
  TTimeLogs = class
  private
    FLogs: array of TTimelog;
    FViewOption: TCalendarViewOption;

    function GetLog(const i: integer): TTimelog;
    function GetLogCount: integer;

  public
    procedure Retrieve(const fromDate, toDate: TDate; const idNum, branchCode: string);
    procedure AddLog(const log: TTimelog);
    procedure Clear;

    property Logs[const i: integer]: TTimelog read GetLog;
    property LogsCount: integer read GetLogCount;
    property ViewOption: TCalendarViewOption read FViewOption write FViewOption;

    constructor Create;
  end;

var
  tlogs: TTimeLogs;

implementation

uses
  TimelogData, KioskGlobal;

constructor TTimeLogs.Create;
begin
  if tlogs = nil then
    tlogs := self;
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

procedure TTimeLogs.AddLog(const log: TTimelog);
begin
  SetLength(FLogs,Length(FLogs) + 1);
  FLogs[Length(FLogs) - 1] := log;
end;

procedure TTimeLogs.Clear;
begin
  FLogs := [];
end;

function TTimeLogs.GetLog(const i: Integer): TTimeLog;
begin
  Result := FLogs[i];
end;

function TTimeLogs.GetLogCount: integer;
begin
  Result := Length(FLogs);
end;

end.
