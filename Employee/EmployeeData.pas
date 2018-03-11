unit EmployeeData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmEmployee = class(TDataModule)
    dsEmployee: TDataSource;
    dsReligion: TDataSource;
    dsCivilStatus: TDataSource;
    dsBloodType: TDataSource;
    dstEmployee: TADODataSet;
    dstReligion: TADODataSet;
    dstCivilStatus: TADODataSet;
    dstBloodType: TADODataSet;
    dscEmpAddressH: TDataSource;
    dstEmpAddressH: TADODataSet;
    dscEmpAddressP: TDataSource;
    dstEmpAddressP: TADODataSet;
    dscEmpContactH: TDataSource;
    dstEmpContactH: TADODataSet;
    dscEmpContactP: TDataSource;
    dstEmpContactP: TADODataSet;
    dscEmpEmergency: TDataSource;
    dstEmpEmergency: TADODataSet;
    dscTowns: TDataSource;
    dstTowns: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  AppData;

end.
