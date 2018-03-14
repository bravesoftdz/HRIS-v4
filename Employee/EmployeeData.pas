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
    dscGender: TDataSource;
    dstGender: TADODataSet;
    dscFamily: TDataSource;
    dstFamily: TADODataSet;
    dscRelation: TDataSource;
    dstRelation: TADODataSet;
    dscOccupation: TDataSource;
    dstOccupation: TADODataSet;
    dstFamilyempfamily_id: TAutoIncField;
    dstFamilyef_firstname: TStringField;
    dstFamilyef_lastname: TStringField;
    dstFamilyef_middlename: TStringField;
    dstFamilyef_birth_date: TDateTimeField;
    dstFamilyoccupation_id: TIntegerField;
    dstFamilyrelation_id: TIntegerField;
    dstFamilyid_num: TStringField;
    dstFamilyis_dependent: TSmallintField;
    dstFamilyis_deceased: TSmallintField;
    dstEmployeeemployee_firstname: TStringField;
    dstEmployeeemployee_lastname: TStringField;
    dstEmployeeemployee_middlename: TStringField;
    dstEmployeeid_num: TStringField;
    dstEmployeebirth_date: TDateTimeField;
    dstEmployeebirth_place: TStringField;
    dstEmployeegender: TStringField;
    dstEmployeereligion_id: TIntegerField;
    dstEmployeecivil_status: TStringField;
    dstEmployeemarriage_date: TDateTimeField;
    dstEmployeeheight: TIntegerField;
    dstEmployeeweight: TIntegerField;
    dstEmployeeblood_type: TStringField;
    dstEmployeetin: TStringField;
    dstEmployeesss: TStringField;
    dstEmployeehdmf: TStringField;
    dstEmployeephic: TStringField;
    dstEmployeedrivers_license: TStringField;
    dstEmployeeis_inactive: TSmallintField;
    dstEmployeepin: TStringField;
    dstEmployeeis_external: TSmallintField;
    dstEmployeedeclare_dependents: TSmallintField;
    dstEmployeelocation_code: TStringField;
    dstEmployeedepartment_code: TStringField;
    dstEmployeepositiontype_code: TStringField;
    dscPAF: TDataSource;
    dstPAF: TADODataSet;
    dstPAFpaf_id: TIntegerField;
    dstPAFid_num: TStringField;
    dstPAFemployee_firstname: TStringField;
    dstPAFemployee_lastname: TStringField;
    dstPAFemployee_middlename: TStringField;
    dstPAFemployee_name: TStringField;
    dstPAFposition_name: TStringField;
    dstPAFposstatus_name: TStringField;
    dstPAFempstatus_name: TStringField;
    dstPAFlocation_name: TStringField;
    dstPAFsalary: TBCDField;
    dstPAFeffective_date: TDateTimeField;
    dstPAFrank_movement: TIntegerField;
    dstPAFpafstatus_code: TStringField;
    dstPAFis_cancelled: TSmallintField;
    dstPAFis_external: TSmallintField;
    procedure dstPAFBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  AppData, HRISGlobal;

procedure TdmEmployee.dstPAFBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@user_id_num').Value := HRIS.User.UserId;
end;

end.