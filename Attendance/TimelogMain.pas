unit TimelogMain;

interface

uses
  System.SysUtils, System.Classes, BaseCalendar, Vcl.Controls, Vcl.StdCtrls,
  RzCmboBx, Vcl.Grids, RzGrids, Vcl.ExtCtrls, RzPanel, RzLabel, Types, Graphics,
  Vcl.Imaging.pngimage, RzRadGrp, Timelog, RzLstBox, RzDBList, Data.DB,
  Vcl.DBGrids, RzDBGrid, StrUtils;

type
  TfrmTimelogMain = class(TfrmBaseCalendar)
    imgHoliday: TImage;
    imgLeave: TImage;
    imgComplete: TImage;
    imgUndertime: TImage;
    imgOverride: TImage;
    imgSunday: TImage;
    pnlColorLegend: TRzPanel;
    Shape1: TShape;
    RzLabel2: TRzLabel;
    Shape2: TShape;
    RzLabel3: TRzLabel;
    Shape3: TShape;
    RzLabel4: TRzLabel;
    Shape4: TShape;
    RzLabel5: TRzLabel;
    Shape5: TShape;
    RzLabel6: TRzLabel;
    Shape6: TShape;
    RzLabel7: TRzLabel;
    Shape7: TShape;
    RzLabel8: TRzLabel;
    pnlIconLegend: TRzPanel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    Image1: TImage;
    imgIncomplete: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    RzLabel16: TRzLabel;
    pnlEmployees: TRzPanel;
    rbgViewOptions: TRzRadioGroup;
    pnlEmployeesHead: TRzPanel;
    RzLabel17: TRzLabel;
    lbEmployees: TRzListBox;
    lblEmployeeName: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure grCalendarDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure cmbYearChange(Sender: TObject);
    procedure rbgViewOptionsClick(Sender: TObject);
    procedure grCalendarDblClick(Sender: TObject);
    procedure lbEmployeesDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure InitForm;
    procedure InitCalendar;
    procedure PopulateCalendar(const fetch: boolean = true);
    procedure ClearCalendar;
    procedure GraphicalView(const log: TTimelog; Rect: TRect);
    procedure SimpleView(const log: TTimelog; Rect: TRect);
    procedure SetViewOptions;
    procedure PopulateEmployeeList;
  public
    { Public declarations }
  end;

var
  frmTimelogMain: TfrmTimelogMain;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  AttendanceUtils, Timelogs, KioskGlobal, TimelogDetails, TimelogData, Employee;

procedure TfrmTimelogMain.PopulateEmployeeList;
var
  emp: TEmployee;
begin
  with dmTimelog.dstEmployees, lbEmployees do
  begin
    Open;

    while not Eof do
    begin
      emp := TEmployee.Create;
      emp.IdNum := FieldByName('id_num').AsString;
      emp.FirstName := FieldByName('employee_firstname').AsString;
      emp.LastName := FieldByName('employee_lastname').AsString;
      emp.LocationCode := FieldByName('location_code').AsString;
      emp.PositionTypeCode := FieldByName('positiontype_code').AsString;

      AddObject(emp.FullName,emp);
      Next;
    end;

    Close;
  end;
end;

procedure TfrmTimelogMain.SetViewOptions;
begin
  with rbgViewOptions, tlogs do
  begin
    if Buttons[0].Checked then ViewOption := cvoSimple
    else ViewOption := cvoGraphical;

    // legend
    pnlColorLegend.Visible := ViewOption = cvoSimple;
    pnlIconLegend.Visible := ViewOption = cvoGraphical;
  end;
end;

procedure TfrmTimelogMain.ClearCalendar;
var
  i, cnt: integer;
  log: TTimelog;
begin
  with tlogs, grCalendar do
  begin
    cnt := LogsCount - 1;

    for i := 0 to cnt do
    begin
      log := Logs[i];

      Objects[log.Day,log.Month] := nil;

      Canvas.Brush.Color := Color;
      Canvas.FillRect(CellRect(log.Day,log.Month));
    end;
  end;
end;

procedure TfrmTimelogMain.InitForm;
begin
  grCalendar.ColWidths[0] := 100;

  PopulateYear(cmbYear);

  InitCalendar;

  lbEmployees.AddObject(kk.Employee.FullName,kk.Employee);
end;

procedure TfrmTimelogMain.lbEmployeesDblClick(Sender: TObject);
begin
  PopulateCalendar(true);
end;

procedure TfrmTimelogMain.SimpleView(const log: TTimelog; Rect: TRect);
begin
  with grCalendar do
  begin
    if not log.IsEmpty then
    begin
      if log.IsHoliday then
      begin
        Canvas.Brush.Color := $00FF972F;
        Canvas.Pen.Style := psClear;
        Canvas.Rectangle(
                Rect.Left-2,
                Rect.Top+1,
                Rect.Left+8,
                Rect.Top+11);
      end;

      // regular log
      if not log.NoLog then
      begin
        // override
        if log.HasOverride then Canvas.Brush.Color := $000DFFFF
        else if log.Complete then Canvas.Brush.Color := $0054A800
        else Canvas.Brush.Color := $0051FFA8;

        Canvas.Pen.Style := psClear;
        Canvas.Rectangle(
                Rect.Left-2,
                Rect.Top+1,
                Rect.Left+8,
                Rect.Top+11);
      end;

      // undertime
      if log.HasUndertime then
      begin
        Canvas.Brush.Color := $00FF4AA5;
        Canvas.Pen.Style := psClear;
        Canvas.Rectangle(
                Rect.Left-2+11,
                Rect.Top+1,
                Rect.Left+8+11,
                Rect.Top+11);

        if log.UndertimeCount > 1 then
          Canvas.Rectangle(
                    Rect.Left-2+11,
                    Rect.Top+1+11,
                    Rect.Left+8+11,
                    Rect.Top+11+11);
      end;

      // leaves
      if log.HasLeave then
      begin
        Canvas.Brush.Color := $004242FF;
        Canvas.Pen.Style := psClear;
        Canvas.Rectangle(
                Rect.Left-2,
                Rect.Top+1+11,
                Rect.Left+8,
                Rect.Top+11+11);

        if (log.LeaveCount > 1) or (log.LeaveIsWholeDay) then
          Canvas.Rectangle(
                  Rect.Left-2+11,
                  Rect.Top+1+11,
                  Rect.Left+8+11,
                  Rect.Top+11+11);

      end;
    end
    else if log.IsSunday then
    begin
      Canvas.Brush.Color := $0054ABAB;
      Canvas.Pen.Style := psClear;
      Canvas.Rectangle(
                Rect.Left-2,
                Rect.Top+1,
                Rect.Left+8,
                Rect.Top+11);
    end;
  end;
end;

procedure TfrmTimelogMain.GraphicalView(const log: TTimelog; Rect: TRect);
begin
  with grCalendar do
  begin
    if not log.IsEmpty then
    begin
      if log.IsHoliday then
        Canvas.Draw(Rect.Left-5,Rect.Top-1,imgHoliday.Picture.Graphic);

      // regular log
      if not log.NoLog then
      begin
        if log.HasOverride then Canvas.Draw(Rect.Left-5,Rect.Top-1,imgOverride.Picture.Graphic)
        else if log.Complete then Canvas.Draw(Rect.Left-5,Rect.Top-1,imgComplete.Picture.Graphic)
        else Canvas.Draw(Rect.Left-5,Rect.Top-1,imgIncomplete.Picture.Graphic);
      end;

      // undertime
      if log.HasUndertime then Canvas.Draw(Rect.Left-5+11,Rect.Top-1,imgUndertime.Picture.Graphic);

      // leaves
      if log.HasLeave then
      begin
        Canvas.Draw(Rect.Left-5,Rect.Top+10,imgLeave.Picture.Graphic);
        if (log.LeaveCount > 1) or (log.LeaveIsWholeDay) then
          Canvas.Draw(Rect.Left-5+11,Rect.Top+10,imgLeave.Picture.Graphic);
      end;
    end
    else if log.IsSunday then Canvas.Draw(Rect.Left-5,Rect.Top-1,imgSunday.Picture.Graphic);
  end;
end;

procedure TfrmTimelogMain.grCalendarDblClick(Sender: TObject);
var
  r, c: integer;
begin
  with grCalendar do
  begin
    r := Row;
    c := Col;

    if Assigned(Objects[c,r]) then
    begin
      tlog := TTimelog(Objects[c,r]);
      with TfrmTimelogDetails.Create(self) do
      begin
        ShowModal;
        Free;
      end;
    end;
  end;
end;

procedure TfrmTimelogMain.grCalendarDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  log: TTimelog;
begin
  with grCalendar do
  begin
    if Assigned(Objects[ACol,ARow]) then
    begin
      log := Objects[ACol,ARow] as TTimelog;

      if tlogs.ViewOption = cvoSimple then SimpleView(log,Rect)
      else GraphicalView(log,Rect);
    end
  end;
end;

procedure TfrmTimelogMain.InitCalendar;
var
  r, cnt: integer;
  months: array of string;
begin
  months := ['January','February','March','April','May','June','July','August','September','October','November','December'];

  // rows
  with grCalendar do
  begin
    RowCount := 13;

    cnt := RowCount - 1;

    for r := 1 to cnt do Cells[0,r] := months[r-1];
  end;

  // columns
  with grCalendar do
  begin
    ColCount := 32;

    cnt := ColCount - 1;

    for r := 1 to cnt do Cells[r,0] := IntToStr(r);
  end;

end;

procedure TfrmTimelogMain.PopulateCalendar(const fetch: boolean);
var
  i, cnt: integer;
  log: TTimelog;
  fd, td: TDate;
  emp: TEmployee;
begin
  with tlogs, grCalendar do
  begin
    if fetch then
    begin
      tlogs := TTimelogs.Create;

      // date params
      GetDateParamsYear(StrToInt(cmbYear.Text),fd,td);

      // id num param
      if lbEmployees.IndexOf(lbEmployees.SelectedItem) > -1 then
        emp := TEmployee(lbEmployees.Items.Objects[lbEmployees.IndexOf(lbEmployees.SelectedItem)])
      else
        emp := kk.Employee;

      Retrieve(fd,td,emp.IdNum,emp.LocationCode);

      lblEmployeeName.Caption := emp.FullName +
                                 '  [' +
                                 emp.IdNum +
                                 IfThen(emp.LocationCode <> '',' - ' + Trim(emp.LocationCode),'') +
                                 ']';
    end;

    SetViewOptions;

    cnt := LogsCount - 1;

    for i := 0 to cnt do
    begin
      log := Logs[i];

      Objects[log.Day,log.Month] := log;
    end;
  end;
end;

procedure TfrmTimelogMain.rbgViewOptionsClick(Sender: TObject);
begin
  inherited;
  ClearCalendar;
  PopulateCalendar(false);
end;

procedure TfrmTimelogMain.cmbYearChange(Sender: TObject);
begin
  inherited;
  ClearCalendar;
  PopulateCalendar;
end;

procedure TfrmTimelogMain.FormCreate(Sender: TObject);
begin
  inherited;
  InitForm;
  PopulateEmployeeList;
  PopulateCalendar;
end;

end.
