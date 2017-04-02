inherited frmBaseCalendar: TfrmBaseCalendar
  Caption = 'frmBaseCalendar'
  ClientHeight = 423
  ClientWidth = 861
  OnCreate = FormCreate
  ExplicitWidth = 877
  ExplicitHeight = 462
  DesignSize = (
    861
    423)
  PixelsPerInch = 96
  TextHeight = 14
  object RzLabel1: TRzLabel [0]
    Left = 20
    Top = 51
    Width = 25
    Height = 14
    Caption = 'Year'
  end
  inherited pnlTitle: TRzPanel
    Width = 861
    ExplicitWidth = 861
  end
  object cmbPeriod: TRzComboBox
    Left = 59
    Top = 45
    Width = 87
    Height = 22
    Ctl3D = False
    FlatButtonColor = 14273211
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    TabOrder = 1
    OnChange = cmbPeriodChange
  end
  object pnlCalendar: TRzPanel
    Left = 20
    Top = 73
    Width = 816
    Height = 325
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    Caption = 'Retrieving data. Please wait...'
    ParentColor = True
    TabOrder = 2
    object grCalendar: TRzStringGrid
      Left = 1
      Top = 1
      Width = 814
      Height = 323
      Align = alClient
      BevelEdges = [beLeft, beTop]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 14273211
      ColCount = 16
      DefaultColWidth = 50
      DefaultRowHeight = 24
      DrawingStyle = gdsGradient
      FixedColor = 8806462
      RowCount = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14273211
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 0
      FrameVisible = True
      FixedLineColor = 14273211
      LineColor = clMenu
      UseDrawingStyle = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 816
      ExplicitHeight = 325
      ColWidths = (
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50)
      RowHeights = (
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24)
    end
  end
end
