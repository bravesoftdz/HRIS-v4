unit TimelogUtils;

interface

uses
  Timelog, System.Types, RzGrids, Vcl.Graphics, KioskDialogs, System.SysUtils, Timelogs;

procedure SimpleView(const grid: TRzStringGrid; const log: TTimelog; Rect: TRect);

implementation

procedure SimpleView(const grid: TRzStringGrid; const log: TTimelog; Rect: TRect);
var
  conflictWidth: integer;
begin
  try
    with grid do
    begin
      if not log.IsEmpty then
      begin
        // has conflict
        if log.HasConflict then
        begin
          if tLogs.PeriodView = pvYear then conflictWidth := 21
          else conflictWidth := 49;

          Canvas.Brush.Color := $008A8AFF;
          Canvas.Rectangle(
                  Rect.Left-4,
                  Rect.Top,
                  Rect.Left + conflictWidth,
                  Rect.Top+25);
        end;

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
    end;    // end width
  except
    on E: Exception do ShowErrorBox('An error has occured while configuring the grid.');
  end;
end;

end.
