unit PafController;

interface

uses
  Employee, PafRecord, System.Classes, SysUtils, BaseActionIntf, DB;

type
  TPafAction = (paNone,paAdding,paEditing);

  TOnUpdate = procedure of object;

  TChanges = class
  private
    FItems: array of string;

    function GetCount: integer;
    function GetItems(const i: integer): string;

    procedure SetItems(const i: integer; const Value: string);
  public
    property Items[const i: integer]: string  read GetItems write SetItems;
    property Count: integer read GetCount;

    procedure Add(const AChange: string);
    procedure Clear;

    constructor Create;
    destructor Destroy; override;
  end;

  TPafController = class(TInterfacedObject,IBaseAction)
  private
    FEmployee: TEmployee;
    FPaf: TPaf;
    FPafLatest: TPaf;
    FData: TDataModule;
    FAction: TPafAction;
    FOnUpdate: TOnUpdate;
    FChanges: TChanges;

    procedure Retrieve;
    procedure SaveAllowances;
    procedure SaveComponents;
    procedure Bind;

    function GetHasChanges: boolean;
    function GetTotalAllowance: currency;
    function GetChanges: string;
    function CheckAddAllowance: boolean;
    function CheckRemoveAllowance: boolean;

  public
    property Employee: TEmployee read FEmployee write FEmployee;
    property Action: TPafAction read FAction write FAction;
    property OnUpdate: TOnUpdate read FOnUpdate write FOnUpdate;
    property HasChanges: boolean read GetHasChanges;
    property TotalAllowance: currency read GetTotalAllowance;
    property Changes: string read GetChanges;

    function Save: boolean;
    function Add: boolean;
    function Cancel: boolean;
    function Delete: boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPafController }

uses
  PafData, HRISGlobal, HRISDialogs;

function TPafController.Add: boolean;
var
  LAllowance: TAllowance;
  i, cnt: integer;
begin
  Retrieve;

  {$region 'New PAF'}
  with (FData as TdmPaf).dstPaf, FPafLatest do
  begin
    if State = dsInsert then Cancel
    else Open;

    Append;

    FieldByName('id_num').AsString := FEmployee.IdNumber;

    // prepopulate new paf if possible
    if Assigned(FPafLatest) then
    begin
      FieldbyName('position_code').AsString := PositionCode;
      FieldbyName('posstatus_code').AsString := PositionStatusCode;
      FieldbyName('empstatus_code').AsString := EmploymentStatusCode;
      FieldbyName('location_code').AsString := BranchCode;

      if DepartmentCode <> '' then FieldbyName('department_code').AsString := DepartmentCode;

      FieldbyName('salary').AsSingle := Salary;
      FieldbyName('frequency_code').AsString := SalaryFrequencyCode;
      FieldbyName('effective_date').AsDateTime := HRIS.CurrentDate;
    end;
  end;
  {$endregion}

  {$region 'PAF allowances'}
  with (FData as TdmPaf).dstPafAllowances, FPafLatest do
  begin
    // close the dataset to cancel all pending
    Close;

    FPaf.Allowances.Clear;

    Open;
    if Assigned(FPafLatest) and (not FPafLatest.Allowances.IsEmpty) then
    begin
      cnt := FPafLatest.Allowances.Count - 1;
      for i := 0 to cnt do
      begin
        // ALWAYS create an instance of the allowance
        // when the PAF instance is destroyed.. allowances are automatically freed up
        LAllowance := TAllowance.Create;

        LAllowance.AllowanceType := FPafLatest.Allowances.Items[i].AllowanceType;
        LAllowance.Amount := FPafLatest.Allowances.Items[i].Amount;

        Append;
        FieldByName('allowancetype_code').AsString := LAllowance.AllowanceType;
        FieldByName('allowance_amount').AsSingle := LAllowance.Amount;

        FPaf.Allowances.Add(LAllowance);

        Post;
      end;
    end;
  end;
  {$endregion}

  FOnUpdate;

  Result := true;
end;

procedure TPafController.Bind;
var
  i: integer;
begin
  with (FData as TdmPaf).dstPaf, FPaf do
  begin
    // iterate thru all the fields and transfer focus control to effect changes
    for i := 0 to Fields.Count - 1 do Fields[i].FocusControl;

    Fields[0].FocusControl;

    Id := FieldbyName('paf_id').AsInteger;
    PositionCode := FieldbyName('position_code').AsString;
    PositionStatusCode := FieldbyName('posstatus_code').AsString;
    EmploymentStatusCode := FieldbyName('empstatus_code').AsString;
    BranchCode := FieldbyName('location_code').AsString;
    DepartmentCode := FieldbyName('department_code').AsString;
    Salary := FieldbyName('salary').AsSingle;
    SalaryFrequencyCode := FieldbyName('frequency_code').AsString;
    EffectiveDate := FieldbyName('effective_date').AsDateTime;
    EffectiveUntil := FieldbyName('effective_until').AsDateTime;
    StatusCode := FieldbyName('pafstatus_code').AsString;
  end;
end;

function TPafController.Cancel: boolean;
begin
  Result := true;
end;

function TPafController.CheckAddAllowance: boolean;
var
  LAllowance, LAllowance2: TAllowance;
  i, cnt: integer;
  i2, cnt2: integer;
begin
  Result := false;

  cnt := FPaf.Allowances.Count - 1;
  for i := 0 to cnt do
  begin
    LAllowance := FPaf.Allowances.Items[i];
    cnt2 := FPafLatest.Allowances.Count - 1;
    for i2 := 0 to cnt2 do
    begin
      LAllowance2 := FPafLatest.Allowances.Items[i2];
      if LAllowance2.AllowanceType = LAllowance.AllowanceType then Exit;
    end;
  end;

  Result := true;
end;

function TPafController.CheckRemoveAllowance: boolean;
begin

end;

constructor TPafController.Create;
begin
  FData := TdmPaf.Create(nil);
  FPaf := TPaf.Create;
end;

function TPafController.Delete: boolean;
begin
  Result := true;
end;

destructor TPafController.Destroy;
begin
  FreeAndNil(FEmployee);
  FreeAndNil(FPaf);
  if Assigned(FPafLatest) then FreeAndNil(FPafLatest);
  FreeAndNil(FData);
  if Assigned(FChanges) then FreeAndNil(FChanges);
  inherited;
end;

function TPafController.GetChanges: string;
var
  changes: TStringList;
  change: string;
begin
  Result := '';

  changes := TStringList.Create;
  try
    //if FPaf.PositionCode <> FPafLatest.PositionCode then changes.Add('Changed position.');
    changes.Add('- Changed position.');
    changes.Add('- Changed position status.');
    changes.Add('- Changed employment status.');


    // construct the text
    for change in changes do Result := Result + change + #13#10#13#10;
  finally
    changes.Free;
  end;

  if Result = '' then Result := 'None';
end;

function TPafController.GetHasChanges: boolean;
begin
  Result := FChanges.Count > 0;
end;

function TPafController.GetTotalAllowance: currency;
begin
  Result := FPaf.Allowances.Total;
end;

procedure TPafController.Retrieve;
var
  LAllowance: TAllowance;
begin
  // destroy every time
  if Assigned(FPafLatest) then FreeAndNil(FPafLatest);

  {$region 'Latest PAF'}
  with (FData as TdmPaf).dstLatestPaf do
  begin
    try
      Parameters.ParamByName('@id_num').Value := FEmployee.IdNumber;
      Open;

      if RecordCount <> 0 then
      begin
        FPafLatest := TPaf.Create;

        with FPafLatest do
        begin
          Id := FieldbyName('paf_id').AsInteger;
          PositionCode := FieldbyName('position_code').AsString;
          PositionStatusCode := FieldbyName('posstatus_code').AsString;
          EmploymentStatusCode := FieldbyName('empstatus_code').AsString;
          BranchCode := FieldbyName('location_code').AsString;
          DepartmentCode := FieldbyName('department_code').AsString;
          Salary := FieldbyName('salary').AsSingle;
          SalaryFrequencyCode := FieldbyName('frequency_code').AsString;
          EffectiveDate := FieldbyName('effective_date').AsDateTime;
          EffectiveUntil := FieldbyName('effective_until').AsDateTime;
          StatusCode := FieldbyName('pafstatus_code').AsString;
        end;
      end;

    finally
      Close;
    end;
  end;
  {$endregion}

  {$region 'Latest allowances'}
  if Assigned(FPafLatest) then
  begin
    with (FData as TdmPaf).dstLatestPafAllowances do
    begin
      try
        Parameters.ParamByName('@paf_id').Value := FPafLatest.Id;
        Open;

        if RecordCount > 0 then
        begin
          while not Eof do
          begin
            LAllowance := TAllowance.Create;
            LAllowance.AllowanceType := FieldByName('allowancetype_code').AsString;
            LAllowance.Expiry := FieldByName('expiry_date').AsDateTime;
            LAllowance.Amount := FieldByName('allowance_amount').AsSingle;

            FPafLatest.Allowances.Add(LAllowance);

            Next;
          end;
        end;
      finally
        Close;
      end;
    end;
  end;
  {$endregion}
end;

function TPafController.Save: boolean;
begin
  Result := false;
  try
    Bind;

    with (FData as TdmPaf).dstPaf do
    begin
      Post;
      Refresh;

      FPaf.Id := FieldByName('paf_id').AsInteger;
    end;

    SaveAllowances;
    SaveComponents;

    Result := true;

    FOnUpdate;
  except
    on E: Exception do ShowErrorBox2(E.Message);
  end;
end;

procedure TPafController.SaveAllowances;
begin
  with (FData as TdmPaf).dstPafAllowances do
  begin
    DisableControls;
    First;

    while not Eof do
    begin
      Edit;
      FieldByName('paf_id').AsInteger := FPaf.Id;
      Next;
    end;

    UpdateBatch;
    EnableControls;
  end;
end;

procedure TPafController.SaveComponents;
var
  comps: TStringList;
  comp: string;
begin
  comps := TStringList.Create;
  try
    // position
    if FPaf.PositionCode <> FPafLatest.PositionCode then comps.Add('CHP');
    // position status
    if FPaf.PositionStatusCode <> FPafLatest.PositionStatusCode then comps.Add('CPS');
    // employment status
    if FPaf.EmploymentStatusCode <> FPafLatest.EmploymentStatusCode then comps.Add('CES');
    // transfer
    if FPaf.BranchCode <> FPafLatest.BranchCode then comps.Add('TRF');
    // salary adjustment
    if FPaf.Salary <> FPafLatest.Salary then comps.Add('SAD');
    // add allowance
    if CheckAddAllowance then comps.Add('AAL');
    // remove allowance
    if CheckRemoveAllowance then comps.Add('RAL');

    with (FData as TdmPaf).dstPafComp do
    begin
      Open;

      for comp in comps do
      begin
        Append;
        FieldByName('paf_id').AsInteger := FPaf.Id;
        FieldByName('pafcomp_type_code').AsString := comp;
        Post;
      end;

      UpdateBatch;

      Close;
    end;
  finally
    comps.Free;
  end;
end;

{ TChanges }

procedure TChanges.Add(const AChange: string);
begin
  SetLength(FItems,Length(FItems)+1);
  FItems[Length(FItems)-1] := AChange;
end;

procedure TChanges.Clear;
var
  i, cnt: integer;
begin
  cnt := GetCount - 1;
  for i := 0 to cnt do FreeAndNil(FItems[i]);
  SetLength(FItems,0);
end;

constructor TChanges.Create;
begin
  SetLength(FItems,0);
end;

destructor TChanges.Destroy;
begin
  Clear;
  inherited;
end;

function TChanges.GetCount: integer;
begin
  Result := Length(FItems);
end;

function TChanges.GetItems(const i: integer): string;
begin
  Result := FItems[i];
end;

procedure TChanges.SetItems(const i: integer; const Value: string);
begin
  FItems[i] := Value;
end;


end.
