inherited frmUndertimeDetails: TfrmUndertimeDetails
  Caption = 'frmUndertimeDetails'
  ClientHeight = 346
  ClientWidth = 581
  OnCreate = FormCreate
  ExplicitWidth = 581
  ExplicitHeight = 346
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 581
    ExplicitWidth = 581
    inherited imgClose: TImage
      Left = 560
      ExplicitLeft = 591
    end
    inherited lblCaption: TRzLabel
      Width = 60
      Caption = 'Undertime'
      ExplicitWidth = 60
    end
  end
  inherited pnlMain: TRzPanel
    Width = 581
    Height = 325
    ExplicitWidth = 581
    ExplicitHeight = 331
    DesignSize = (
      581
      325)
    object lblDate: TRzLabel [0]
      Left = 19
      Top = 69
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
      Top = 113
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
      Top = 21
      Width = 541
      Height = 32
      BorderColor = 6572079
      ExplicitLeft = 19
      ExplicitTop = 21
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
        ExplicitHeight = 36
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
      Top = 295
      ExplicitLeft = 456
      ExplicitTop = 301
      inherited sbtnSave: TRzShapeButton
        CaptionX = 10
        CaptionY = 1
      end
    end
    inherited btnCancel: TRzPanel
      Left = 510
      Top = 295
      ExplicitLeft = 510
      ExplicitTop = 301
      inherited sbtnCancel: TRzShapeButton
        CaptionX = 4
        CaptionY = 1
      end
    end
    object pnlAM: TRzPanel
      Tag = 1
      Left = 19
      Top = 149
      Width = 262
      Height = 139
      Anchors = [akLeft, akTop, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 3
      ExplicitHeight = 141
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
      object lblStatusAM: TRzLabel
        Left = 224
        Top = 27
        Width = 18
        Height = 14
        Alignment = taRightJustify
        Caption = 'xxx'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
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
          Width = 139
          Height = 13
          Caption = 'Morning undertime (AM)'
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
        DataField = 'undertime_reason_code'
        DataSource = dmTimelog.dscUndertimeAM
        Enabled = False
        KeyField = 'undertime_reason_code'
        ListField = 'undertime_reason_name'
        ListSource = dmTimelog.dscUndertimeReason
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
      object dteFromAM: TRzDateTimeEdit
        Left = 67
        Top = 58
        Width = 86
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        OnInvalidTime = dteFromAMInvalidTime
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
      object dteUntilAM: TRzDateTimeEdit
        Left = 156
        Top = 58
        Width = 86
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        OnInvalidTime = dteUntilAMInvalidTime
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
      object chbPaidAM: TRzDBCheckBox
        Left = 67
        Top = 110
        Width = 41
        Height = 16
        DataField = 'is_paid'
        DataSource = dmTimelog.dscUndertimeAM
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = 'Paid'
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
      Height = 139
      Anchors = [akLeft, akTop, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 4
      ExplicitHeight = 141
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
      object lblStatusPM: TRzLabel
        Left = 224
        Top = 27
        Width = 18
        Height = 14
        Alignment = taRightJustify
        Caption = 'xxx'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
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
          Width = 149
          Height = 13
          Caption = 'Afternoon undertime (PM)'
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
        DataField = 'undertime_reason_code'
        DataSource = dmTimelog.dscUndertimePM
        Enabled = False
        KeyField = 'undertime_reason_code'
        ListField = 'undertime_reason_name'
        ListSource = dmTimelog.dscUndertimeReason
        TabOrder = 3
        FlatButtons = True
        DisabledColor = 14273211
        FocusColor = clWhite
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
      end
      object chbPaidPM: TRzDBCheckBox
        Left = 67
        Top = 110
        Width = 41
        Height = 16
        DataField = 'is_paid'
        DataSource = dmTimelog.dscUndertimePM
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = 'Paid'
        DisabledColor = 14273211
        FillColor = 14273211
        FocusColor = 14273211
        TabOrder = 4
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
        TabOrder = 5
        OnClick = chbPMClick
      end
      object dteFromPM: TRzDateTimeEdit
        Left = 67
        Top = 58
        Width = 86
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        OnInvalidTime = dteFromAMInvalidTime
        DisabledColor = 14273211
        DropButtonVisible = False
        Enabled = False
        FlatButtons = True
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 1
      end
      object dteUntilPM: TRzDateTimeEdit
        Left = 156
        Top = 58
        Width = 86
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        OnInvalidTime = dteUntilAMInvalidTime
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
    end
    object bteEmployee: TRzButtonEdit
      Left = 86
      Top = 107
      Width = 474
      Height = 22
      Text = ''
      Color = 14273211
      FrameColor = 6572079
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnly = True
      ReadOnlyColor = 14273211
      TabOrder = 5
      AltBtnKind = bkFind
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      HideButtonsOnReadOnly = False
      OnButtonClick = bteEmployeeButtonClick
    end
    object chbCloseOnSave: TRzCheckBox
      Left = 19
      Top = 299
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
      TabOrder = 6
      ExplicitTop = 305
    end
  end
end
