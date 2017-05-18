inherited frmOverrideDetails: TfrmOverrideDetails
  Caption = 'frmOverrideDetails'
  ClientHeight = 355
  ClientWidth = 581
  OnCreate = FormCreate
  ExplicitWidth = 581
  ExplicitHeight = 355
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 581
    ExplicitWidth = 581
    inherited imgClose: TImage
      Left = 560
      ExplicitLeft = 560
    end
    inherited lblCaption: TRzLabel
      Width = 49
      Caption = 'Override'
      ExplicitWidth = 49
    end
  end
  inherited pnlMain: TRzPanel
    Width = 581
    Height = 334
    ExplicitWidth = 581
    ExplicitHeight = 334
    object lblDate: TRzLabel [0]
      Left = 19
      Top = 61
      Width = 106
      Height = 14
      Caption = 'No date selected.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel5: TRzLabel [1]
      Left = 19
      Top = 24
      Width = 53
      Height = 14
      Caption = 'Employee'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlDetail: TRzPanel
      Left = 19
      Top = 99
      Width = 541
      Height = 32
      ExplicitLeft = 19
      ExplicitTop = 99
      ExplicitWidth = 541
      ExplicitHeight = 32
      object grDateSelector: TRzStringGrid
        Left = 1
        Top = 1
        Width = 539
        Height = 30
        Align = alClient
        BevelEdges = [beLeft, beTop]
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 14273211
        ColCount = 30
        DefaultColWidth = 53
        DefaultRowHeight = 30
        DrawingStyle = gdsGradient
        FixedColor = 8806462
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientStartColor = 917503
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ParentFont = False
        ScrollBars = ssNone
        TabOrder = 0
        OnClick = grDateSelectorClick
        OnDrawCell = grDateSelectorDrawCell
        FixedLineColor = 6572079
        LineColor = 6572079
        UseDrawingStyle = False
        ColWidths = (
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53)
        RowHeights = (
          30)
      end
    end
    inherited btnSave: TRzPanel
      Left = 456
      Top = 304
      ExplicitLeft = 456
      ExplicitTop = 304
      inherited sbtnSave: TRzShapeButton
        CaptionPosition = cpCentered
      end
    end
    inherited btnCancel: TRzPanel
      Left = 510
      Top = 304
      ExplicitLeft = 510
      ExplicitTop = 304
      inherited sbtnCancel: TRzShapeButton
        CaptionPosition = cpCentered
      end
    end
    object pnlAM: TRzPanel
      Tag = 1
      Left = 19
      Top = 149
      Width = 262
      Height = 137
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 3
      object RzLabel7: TRzLabel
        Left = 19
        Top = 64
        Width = 27
        Height = 14
        Caption = 'Time'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel1: TRzLabel
        Left = 19
        Top = 88
        Width = 39
        Height = 14
        Caption = 'Reason'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzPanel1: TRzPanel
        Left = 1
        Top = 1
        Width = 260
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderSides = [sdBottom]
        BorderColor = clBlack
        BorderWidth = 1
        GradientColorStyle = gcsCustom
        GradientColorStart = 6572079
        GradientColorStop = 8675134
        TabOrder = 0
        VisualStyle = vsGradient
        object RzLabel9: TRzLabel
          Tag = -1
          Left = 4
          Top = 1
          Width = 128
          Height = 13
          Caption = 'Morning override (AM)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          FlatColor = clWhite
        end
      end
      object dbluReasonAM: TRzDBLookupComboBox
        Left = 67
        Top = 82
        Width = 175
        Height = 22
        DataField = 'override_reason_code'
        DataSource = dmTimelog.dscOverrideAM
        Enabled = False
        KeyField = 'override_reason_code'
        ListField = 'override_reason_name'
        ListSource = dmTimelog.dscOverrideReasons
        TabOrder = 4
        FlatButtons = True
        DisabledColor = 14273211
        FocusColor = clWhite
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
      end
      object chbAM: TRzCheckBox
        Left = 19
        Top = 26
        Width = 104
        Height = 16
        Caption = 'Morning (AM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbUnchecked
        TabOrder = 1
        OnClick = chbAMClick
      end
      object dteInAM: TRzDateTimeEdit
        Left = 67
        Top = 58
        Width = 86
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        BeepOnInvalidKey = False
        DisabledColor = 14273211
        DropButtonVisible = False
        Enabled = False
        FlatButtons = True
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 2
      end
      object dteOutAM: TRzDateTimeEdit
        Left = 156
        Top = 58
        Width = 86
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        DisabledColor = 14273211
        DropButtonVisible = False
        Enabled = False
        FlatButtons = True
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 3
      end
      object chbCancelledAM: TRzDBCheckBox
        Left = 67
        Top = 110
        Width = 70
        Height = 16
        DataField = 'is_cancelled'
        DataSource = dmTimelog.dscOverrideAM
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = 'Cancelled'
        DisabledColor = 14273211
        FillColor = 14273211
        FocusColor = 14273211
        TabOrder = 5
      end
    end
    object pnlPM: TRzPanel
      Tag = 1
      Left = 298
      Top = 149
      Width = 262
      Height = 137
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 4
      object RzLabel2: TRzLabel
        Left = 19
        Top = 64
        Width = 27
        Height = 14
        Caption = 'Time'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel3: TRzLabel
        Left = 19
        Top = 88
        Width = 39
        Height = 14
        Caption = 'Reason'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzPanel3: TRzPanel
        Left = 1
        Top = 1
        Width = 260
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderSides = [sdBottom]
        BorderColor = clBlack
        BorderWidth = 1
        GradientColorStyle = gcsCustom
        GradientColorStart = 6572079
        GradientColorStop = 8675134
        TabOrder = 0
        VisualStyle = vsGradient
        object RzLabel4: TRzLabel
          Tag = -1
          Left = 4
          Top = 1
          Width = 138
          Height = 13
          Caption = 'Afternoon override (PM)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          FlatColor = clWhite
        end
      end
      object dbluReasonPM: TRzDBLookupComboBox
        Left = 67
        Top = 82
        Width = 175
        Height = 22
        DataField = 'override_reason_code'
        DataSource = dmTimelog.dscOverridePM
        Enabled = False
        KeyField = 'override_reason_code'
        ListField = 'override_reason_name'
        ListSource = dmTimelog.dscOverrideReasons
        TabOrder = 4
        FlatButtons = True
        DisabledColor = 14273211
        FocusColor = clWhite
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
      end
      object chbPM: TRzCheckBox
        Left = 19
        Top = 26
        Width = 116
        Height = 16
        Caption = 'Afternoon (PM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbUnchecked
        TabOrder = 1
        OnClick = chbPMClick
      end
      object dteInPM: TRzDateTimeEdit
        Left = 67
        Top = 58
        Width = 86
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        DisabledColor = 14273211
        DropButtonVisible = False
        Enabled = False
        FlatButtons = True
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 2
      end
      object dteOutPM: TRzDateTimeEdit
        Left = 156
        Top = 58
        Width = 86
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        DisabledColor = 14273211
        DropButtonVisible = False
        Enabled = False
        FlatButtons = True
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 3
      end
      object chbCancelledPM: TRzDBCheckBox
        Left = 67
        Top = 110
        Width = 70
        Height = 16
        DataField = 'is_cancelled'
        DataSource = dmTimelog.dscOverridePM
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = 'Cancelled'
        DisabledColor = 14273211
        FillColor = 14273211
        FocusColor = 14273211
        TabOrder = 5
      end
    end
    object chbCloseOnSave: TRzCheckBox
      Left = 19
      Top = 308
      Width = 93
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'Close on save'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 5
    end
    object bteEmployee: TRzButtonEdit
      Left = 86
      Top = 18
      Width = 474
      Height = 22
      Text = ''
      Color = 14273211
      FrameColor = 6572079
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnly = True
      ReadOnlyColor = 14273211
      TabOrder = 6
      AltBtnKind = bkFind
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      HideButtonsOnReadOnly = False
      OnButtonClick = bteEmployeeButtonClick
    end
  end
end
