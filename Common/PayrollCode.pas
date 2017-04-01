unit PayrollCode;

interface

type
  TPayrollCode = class
  private
    FCode: string;
    FPeriod: string;
    FDateFrom: string;
    FDateUntil: string;
  public
    property Code: string read FCode write FCode;
    property Period: string read FPeriod write FPeriod;
    property DateFrom: string read FDateFrom write FDateFrom;
    property DateUntil: string read FDateUntil write FDateUntil;

    constructor Create(const cd, pd, fr, un: string);
  end;

implementation

constructor TPayrollCode.Create(const cd, pd, fr, un: string);
begin
  inherited Create;

  FCode := cd;
  FPeriod := pd;
  FDateFrom := fr;
  FDateUntil := un;
end;

end.
