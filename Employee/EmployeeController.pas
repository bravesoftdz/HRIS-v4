unit EmployeeController;

interface

uses
  SysUtils, Employee, BaseActionIntf, Classes, DB, ADODB;

type
  TSelected = (sdNone,sdMain,sdAddressAndContact,sdFamily);

  TSelectionChanged = procedure of object;

  TEmployeeController = class(TInterfacedObject,IBaseAction)
  private
    FData: TDataModule;
    FEmployee: TEmployee;
    FSelected: TSelected;
    FSelectionChanged: TSelectionChanged;

    procedure OnChange;
    function GetNew: boolean;
  public
    property Employee: TEmployee read FEmployee write FEmployee;
    property Selected: TSelected write FSelected;
    property OnSelectionChanged: TSelectionChanged read FSelectionChanged;
    property New: boolean read GetNew;

    procedure Save;
    procedure Add;
    procedure Cancel;
    procedure Delete;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEmployeeController }

uses
  EmployeeData;

procedure TEmployeeController.Add;
begin
  with (FData as TdmEmployee).dstEmployee do
  begin
    Open;
    Append;
  end;
end;

procedure TEmployeeController.Cancel;
var
  i: integer;
begin
  with (FData as TdmEmployee) do
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
          (Components[i] as TADODataSet).Cancel
    end;
  end;
end;

constructor TEmployeeController.Create;
begin
  inherited;
  FData := TdmEmployee.Create(nil);

  FSelectionChanged := OnChange;
end;

procedure TEmployeeController.Delete;
begin

end;

destructor TEmployeeController.Destroy;
begin
  FreeAndNil(FEmployee);
  FreeAndNil(FData);
end;

function TEmployeeController.GetNew: boolean;
begin
  Result := not Assigned(FEmployee);
end;

procedure TEmployeeController.OnChange;
var
  i, LTag: integer;
begin
  with (FData as TdmEmployee) do
  begin
    LTag := Integer(FSelected);

    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
          (Components[i] as TADODataSet).Cancel
        else
        begin
           if (Components[i] as TADODataSet).Tag = LTag then
           begin
             (Components[i] as TADODataSet).Open;
             if (Components[i] as TADODataSet).RecordCount = 0 then  (Components[i] as TADODataSet).Append
             else (Components[i] as TADODataSet).Edit;
           end;
        end;
      end;
    end;
  end;
end;

procedure TEmployeeController.Save;
begin
  try
    with (FData as TdmEmployee).dstEmployee do
    begin
      Post;

      // set the employee property
      if New then FEmployee := TEmployee.Create;

      FEmployee.IdNumber := FieldByName('id_num').AsString;
      FEmployee.LastName := FieldByName('employee_lastname').AsString;
      FEmployee.FirstName := FieldByName('employee_firstname').AsString;
    end;
  except

  end;
end;

end.
