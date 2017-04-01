unit TimelogDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Timelog, CollapsiblePanelUtils;

type
  TfrmTimelogDetails = class(TfrmBasePopup)
    lblDate: TRzLabel;
    pnlOfficelog: TRzPanel;
    pnlOfficeLogHead: TRzPanel;
    RzLabel4: TRzLabel;
    imgOfficelog: TImage;
    pnlUndertime: TRzPanel;
    pnlUndertimeHead: TRzPanel;
    RzLabel2: TRzLabel;
    imgUndertime: TImage;
    pnlLeaves: TRzPanel;
    pnlLeavesHead: TRzPanel;
    RzLabel5: TRzLabel;
    imgLeaves: TImage;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    lblInAm: TRzLabel;
    lblOutAM: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    lblOutPM: TRzLabel;
    lblInPM: TRzLabel;
    lblHolidayWarning: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    lblUTTimeUntilAM: TRzLabel;
    lblUTTimeFromAM: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    lblUTTimeUntilPM: TRzLabel;
    lblUTTimeFromPM: TRzLabel;
    RzLabel3: TRzLabel;
    lblUTTimeReasonAM: TRzLabel;
    RzLabel16: TRzLabel;
    lblUTTimeReasonPM: TRzLabel;
    RzLabel15: TRzLabel;
    lblOvInAm: TRzLabel;
    lblOvOutAM: TRzLabel;
    lblOvInPm: TRzLabel;
    lblOvOutPm: TRzLabel;
    lblOvAmReason: TRzLabel;
    lblOvPmReason: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    lblLvTypeAM: TRzLabel;
    RzLabel23: TRzLabel;
    lblLvRemarksAM: TRzLabel;
    RzLabel25: TRzLabel;
    lblLvTypePM: TRzLabel;
    RzLabel27: TRzLabel;
    lblLvRemarksPM: TRzLabel;
    RzLabel29: TRzLabel;
    lblLvReasonAM: TRzLabel;
    lblLvReasonPM: TRzLabel;
    RzLabel24: TRzLabel;
    procedure imgOfficelogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ExpandPanel(Sender: TObject; panelState: TPanelState);
    procedure SetCollapsePanelProperties(panel: TRzPanel; image: TImage; var tp: integer);
    procedure SetUnboundControls;
    procedure SetPanelColors;
  public
    { Public declarations }
  end;

var
  frmTimelogDetails: TfrmTimelogDetails;

implementation

{$R *.dfm}

uses
  KioskGlobal, AttendanceUtils;

procedure TfrmTimelogDetails.SetCollapsePanelProperties(panel: TRzPanel; image: TImage; var tp: integer);
begin
  // panel
  with panel do
  begin
    Left := LEFT_ANCHOR;
    Top  := tp;
    Height := COLLAPSED_HEIGHT;
    Visible := true;
    tp := Top + COLLAPSED_HEIGHT + SPACE;
  end;

  // image
  with image do
  begin
    Picture.LoadFromFile(kk.AppImagesPath + 'expand.png');
    Hint := 'Expand';
    Tag := Integer(psExpand);
  end;
end;

procedure TfrmTimelogDetails.ExpandPanel(Sender: TObject; panelState: TPanelState);
var
  ht, i, tp, sourceTag: integer;
begin
  ht := 0;

  // get the source tag
  sourceTag := (Sender as TImage).Parent.Parent.Tag;

  case sourceTag of
    1: ht := 200;
    2: ht := 200;
    3: ht := 200;
  end;

  tp := TOP_ANCHOR;

  for i := 0 to pnlMain.ControlCount - 1 do
  begin
    if pnlMain.Controls[i] is TRzPanel then
    begin
      if (pnlMain.Controls[i] as TRzPanel).Tag = sourceTag then
      begin
        if panelState = psExpand then
        begin
          (Sender as TImage).Parent.Parent.Top := tp;
          (Sender as TImage).Parent.Parent.Height := ht;
          (Sender as TImage).Picture.LoadFromFile(kk.AppImagesPath + 'collapse.png');
          (Sender as TImage).Hint := 'Collapse';
          (Sender as TImage).Tag := Integer(psCollapse);
        end
        else
        begin
          (Sender as TImage).Parent.Parent.Height := COLLAPSED_HEIGHT;
          (Sender as TImage).Picture.LoadFromFile(kk.AppImagesPath + 'expand.png');
          (Sender as TImage).Hint := 'Expand';
          (Sender as TImage).Tag := Integer(psExpand);
        end;

        tp := (Sender as TImage).Parent.Parent.Top + (Sender as TImage).Parent.Parent.Height + SPACE;
      end
      else
      begin
        case (pnlMain.Controls[i] as TRzPanel).Tag of
          1: SetCollapsePanelProperties(pnlOfficelog,imgOfficelog,tp);
          2: SetCollapsePanelProperties(pnlUndertime,imgUndertime,tp);
          3: SetCollapsePanelProperties(pnlLeaves,imgLeaves,tp);
        end;

      end;
    end;
  end;
end;

procedure TfrmTimelogDetails.SetUnboundControls;
var
  ut: TUndertime;
  ov: TOverride;
  lv: TLeave;
begin
  with tlog do
  begin
    lblDate.Caption := 'Log details for ' + FormatDateTime('mmmm dd, yyyy dddd', tlog.Date);

    // office log
    lblInAm.Caption := FormatTimeString(TimeInAM);
    lblOutAm.Caption := FormatTimeString(TimeOutAM);
    lblInPm.Caption := FormatTimeString(TimeInPM);
    lblOutPm.Caption := FormatTimeString(TimeOutPM);

    // override
    if HasOverride then
    begin
      ov := Ovride2[pdMorning];
      if Assigned(ov) then
      begin
        lblOvInAm.Caption := FormatTimeString(ov.TimeIn);
        lblOvOutAm.Caption := FormatTimeString(ov.TimeOut);
        lblOvAMReason.Caption := ov.Reason;
      end;

      ov := Ovride2[pdAfternoon];
      if Assigned(ov) then
      begin
        lblOvInPm.Caption := FormatTimeString(ov.TimeIn);
        lblOvOutPm.Caption := FormatTimeString(ov.TimeOut);
        lblOvPMReason.Caption := ov.Reason;
      end;
    end;

    // undertime
    if HasUndertime then
    begin
      ut := Undertimes2[pdMorning];
      if Assigned(ut) then
      begin
        lblUTTimeFromAM.Caption := FormatTimeString(ut.TimeFrom);
        lblUTTimeUntilAM.Caption := FormatTimeString(ut.TimeUntil);
        lblUTTimeReasonAM.Caption := ut.Reason;
      end;

      ut := Undertimes2[pdAfternoon];
      if Assigned(ut) then
      begin
        lblUTTimeFromPM.Caption := FormatTimeString(ut.TimeFrom);
        lblUTTimeUntilPM.Caption := FormatTimeString(ut.TimeUntil);
        lblUTTimeReasonPM.Caption := ut.Reason;
      end;
    end;

    // leaves
    if HasLeave then
    begin
      // if leave is whole day
      // populate both morning and after
      lv := Leaves2[pdWholeDay];
      if Assigned(lv) then
      begin
        lblLvTypeAM.Caption := lv.LeaveTypeName;
        lblLvReasonAM.Caption := lv.Reason;
        lblLvRemarksAM.Caption := lv.Remarks;

        lblLvTypePM.Caption := lv.LeaveTypeName;
        lblLvReasonPM.Caption := lv.Reason;
        lblLvRemarksPM.Caption := lv.Remarks;
      end
      else
      begin
        lv := Leaves2[pdMorning];
        if Assigned(lv) then
        begin
          lblLvTypeAM.Caption := lv.LeaveTypeName;
          lblLvReasonAM.Caption := lv.Reason;
          lblLvRemarksAM.Caption := lv.Remarks;
        end;

        lv := Leaves2[pdAfternoon];
        if Assigned(lv) then
        begin
          lblLvTypePM.Caption := lv.LeaveTypeName;
          lblLvReasonPM.Caption := lv.Reason;
          lblLvRemarksPM.Caption := lv.Remarks;
        end;
      end;
    end;

    // holiday
    if IsHoliday then
      if Holiday.IsNational then
        lblHolidayWarning.Caption :=
                'Note: This date is a national holiday (' + Holiday.Name + ').'
      else
        lblHolidayWarning.Caption :=
                'Note: This date is a local holiday (' + Holiday.Name + ').';

    lblHolidayWarning.Visible := IsHoliday;
  end;
end;

procedure TfrmTimelogDetails.SetPanelColors;
var
  enabledColor1, enabledColor2, disabledColor1, disabledColor2: TColor;
begin
  // changes tab colors depending on information availability
  // light blue (transparent) no info is found
  enabledColor1 := $0086603E;
  enabledColor2 := $00A98867;

  disabledColor1 := $00C5AE98;
  disabledColor2 := $00CAB59F;

  // office log
  if (tlog.NoLog) and (not tlog.HasOverride) then
  begin
    pnlOfficeLogHead.GradientColorStart := disabledColor1;
    pnlOfficeLogHead.GradientColorStop := disabledColor2;
  end
  else
  begin
    pnlOfficeLogHead.GradientColorStart := enabledColor1;
    pnlOfficeLogHead.GradientColorStop := enabledColor2;
  end;

  // undertime
  if not tlog.HasUndertime then
  begin
    pnlUndertimeHead.GradientColorStart := disabledColor1;
    pnlUndertimeHead.GradientColorStop := disabledColor2;
  end
  else
  begin
    pnlUndertimeHead.GradientColorStart := enabledColor1;
    pnlUndertimeHead.GradientColorStop := enabledColor2;
  end;

  // leaves
  if not tlog.HasLeave then
  begin
    pnlLeavesHead.GradientColorStart := disabledColor1;
    pnlLeavesHead.GradientColorStop := disabledColor2;
  end
  else
  begin
    pnlLeavesHead.GradientColorStart := enabledColor1;
    pnlLeavesHead.GradientColorStop := enabledColor2;
  end;

  pnlOfficeLogHead.Enabled := not tlog.NoLog;
  pnlUndertimeHead.Enabled := tlog.HasUndertime;
  pnlLeavesHead.Enabled := tlog.HasLeave;
end;

procedure TfrmTimelogDetails.FormCreate(Sender: TObject);
begin
  SetUnboundControls;
  SetPanelColors;

  // expand panel
  if (not tlog.NoLog) or (tlog.HasOverride) then imgOfficelog.OnClick(imgOfficelog)
  else if tlog.HasUndertime then imgUndertime.OnClick(imgUndertime)
  else if tlog.HasLeave then imgLeaves.OnClick(imgLeaves);
       
       
end;

procedure TfrmTimelogDetails.imgOfficelogClick(Sender: TObject);
var
  sndr: TObject;

  procedure FindExpandImage;
  var
    i: integer;
  begin
    for i := 0 to (Sender as TRzPanel).ControlCount - 1 do
      if (Sender as TRzPanel).Controls[i] is TImage then
        sndr := (Sender as TRzPanel).Controls[i];
  end;

begin
  if Sender is TRzPanel then FindExpandImage
  else sndr := Sender;

  ExpandPanel(sndr,TPanelState((sndr as TImage).Tag));
end;

end.
