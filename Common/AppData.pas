unit AppData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, ConnUtil;

type
  TdmApplication = class(TDataModule)
    acMain: TADOConnection;
    dstUser: TADODataSet;
    dstConfig: TADODataSet;
    dstPayrollCode: TADODataSet;
    dstLocation: TADODataSet;
    dstEmployees: TADODataSet;
    dscEmployees: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure acMainBeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstEmployeesBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmApplication: TdmApplication;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  HRISGlobal;

procedure TdmApplication.acMainBeforeConnect(Sender: TObject);
begin
  acMain.ConnectionString := GetConnection('','','');
end;

procedure TdmApplication.DataModuleCreate(Sender: TObject);
begin
  acMain.Open;
end;

procedure TdmApplication.DataModuleDestroy(Sender: TObject);
begin
  acMain.Close;
end;

procedure TdmApplication.dstEmployeesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@dtr_date_from').Value := HRIS.CurrentDate;
  (DataSet as TADODataSet).Parameters.ParamByName('@dtr_date_until').Value := HRIS.CurrentDate;
end;

end.
