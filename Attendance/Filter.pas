unit Filter;

interface

type
  TFilterType = (ftNone, ftBranch, ftPositionType);

type
  TFilter = class
  private
    FFilterType: TFilterType;
    FValue: string;
  public
    property FilterType: TFilterType read FFilterType write FFilterType;
    property Value: string read FValue write FValue;

    constructor Create;
  end;

var
  filtr: TFilter;

implementation

constructor TFilter.Create;
begin
  if filtr <> nil then filtr := self
  else inherited Create;
end;

end.
