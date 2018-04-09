unit User;

interface

uses
  SysUtils, Classes, StrUtils;

type
  TUser = class
  private
    FUserId: string;
    FUserName: string;
    FUserRights: array of string;
    FName: string;
    FFirstName: string;
    FLastName: string;
    function GetName: string;
  public
    property UserId: string read FUserId write FUserId;
    property UserName: string read FUserName write FUserName;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Name: string read GetName;

    procedure AddRight(const ARight: string);
    function HasRights(const ARights: array of string;
      const AWarn: boolean = false): boolean;

  end;

implementation

uses
  AppConstants, HRISDialogs;

{ TUser }

function TUser.GetName: string;
begin
  Result := FFirstName + ' ' + FLastName;
end;

function TUser.HasRights(const ARights: array of string;
  const AWarn: boolean = false): boolean;
var
  sl: TStringList;
  i, cnt, rightCnt: integer;
begin
  rightCnt := 0;

  cnt := Length(ARights) - 1;

  for i := 0 to cnt do
  begin
    sl := TStringList.Create;
    sl.Delimiter := ';';
    sl.DelimitedText := ARights[i];

    if MatchStr(sl[0],FUserRights) then Inc(rightCnt);

    sl.Free;
  end;

  Result := rightCnt > 0;

  if (not Result) and (AWarn) then ShowErrorBox2('Access is denied. Please contact system administrator.');
end;

procedure TUser.AddRight(const ARight: string);
begin
  SetLength(FUserRights, Length(FUserRights) + 1);
  FUserRights[Length(FUserRights) - 1] := ARight;
end;

end.
