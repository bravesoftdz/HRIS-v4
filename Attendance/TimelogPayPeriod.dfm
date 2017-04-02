inherited frmTimelogPayPeriod: TfrmTimelogPayPeriod
  Caption = 'frmTimelogPayPeriod'
  ClientHeight = 484
  ClientWidth = 1091
  ExplicitWidth = 1107
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 14
  inherited RzLabel1: TRzLabel
    Width = 72
    Caption = 'Payroll period'
    ExplicitWidth = 72
  end
  object RzLabel16: TRzLabel [1]
    Left = 20
    Top = 454
    Width = 49
    Height = 14
    Anchors = [akLeft, akBottom]
    Caption = 'Legend:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblStatus: TRzLabel [2]
    Left = 898
    Top = 51
    Width = 163
    Height = 14
    Anchors = [akTop, akRight]
    Caption = 'Retrieving data. Please wait...'
    Visible = False
  end
  object lblSwitchView: TRzLabel [3]
    Left = 965
    Top = 454
    Width = 109
    Height = 14
    Cursor = crHandPoint
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Switch to year view'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8806462
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblSwitchViewClick
    FlyByEnabled = True
  end
  object RzLabel9: TRzLabel [4]
    Left = 308
    Top = 51
    Width = 26
    Height = 14
    Caption = 'Filter'
  end
  inherited pnlTitle: TRzPanel
    Width = 1091
    BorderSides = []
    ExplicitWidth = 919
    inherited lblTitle: TRzLabel
      Width = 47
      Caption = 'Timelog'
      ExplicitWidth = 47
    end
    object lblNext: TLabel
      Left = 1056
      Top = 7
      Width = 26
      Height = 14
      Cursor = crHandPoint
      Hint = 'Next'
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Next'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = lblNextClick
    end
    object lblPrevious: TLabel
      Left = 1003
      Top = 7
      Width = 45
      Height = 14
      Cursor = crHandPoint
      Hint = 'Previous'
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Previous'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = lblPreviousClick
    end
  end
  inherited cmbPeriod: TRzComboBox
    Left = 107
    Width = 184
    Ctl3D = True
    DisabledColor = 14273211
    FrameHotStyle = fsFlat
    ExplicitLeft = 107
    ExplicitWidth = 184
  end
  inherited pnlCalendar: TRzPanel
    Width = 1057
    Height = 371
    BorderSides = []
    ExplicitWidth = 1057
    ExplicitHeight = 371
    inherited grCalendar: TRzStringGrid
      Width = 1055
      Height = 369
      Anchors = [akLeft, akTop, akRight]
      GradientEndColor = 8806462
      GradientStartColor = 8806462
      OnDblClick = grCalendarDblClick
      OnDrawCell = grCalendarDrawCell
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1055
      ExplicitHeight = 327
    end
  end
  object pnlColorLegend: TRzPanel
    Left = 110
    Top = 450
    Width = 595
    Height = 23
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderSides = []
    Color = 14273211
    TabOrder = 3
    object Shape1: TShape
      Left = -1
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 16750383
      Pen.Style = psClear
    end
    object RzLabel2: TRzLabel
      Left = 17
      Top = 5
      Width = 35
      Height = 13
      Caption = 'Holiday'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Shape2: TShape
      Left = 73
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 5548032
      Pen.Style = psClear
    end
    object RzLabel3: TRzLabel
      Left = 91
      Top = 5
      Width = 45
      Height = 13
      Caption = 'Complete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Shape3: TShape
      Left = 159
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 5373864
      Pen.Style = psClear
    end
    object RzLabel4: TRzLabel
      Left = 177
      Top = 5
      Width = 53
      Height = 13
      Caption = 'Incomplete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Shape4: TShape
      Left = 253
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 917503
      Pen.Style = psClear
    end
    object RzLabel5: TRzLabel
      Left = 271
      Top = 5
      Width = 42
      Height = 13
      Caption = 'Override'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Shape5: TShape
      Left = 334
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 16730789
      Pen.Style = psClear
    end
    object RzLabel6: TRzLabel
      Left = 352
      Top = 5
      Width = 49
      Height = 13
      Caption = 'Undertime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Shape6: TShape
      Left = 424
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 4342527
      Pen.Style = psClear
    end
    object RzLabel7: TRzLabel
      Left = 442
      Top = 5
      Width = 29
      Height = 13
      Caption = 'Leave'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Shape7: TShape
      Left = 493
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 5548971
      Pen.Style = psClear
    end
    object RzLabel8: TRzLabel
      Left = 511
      Top = 5
      Width = 36
      Height = 13
      Caption = 'Sunday'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object bteFilter: TRzButtonEdit
    Left = 349
    Top = 45
    Width = 436
    Height = 22
    Text = ''
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnly = True
    ReadOnlyColor = clWindow
    TabOrder = 4
    AllowKeyEdit = False
    ButtonKind = bkFind
    AltBtnWidth = 15
    ButtonWidth = 15
    FlatButtons = True
    FlatButtonColor = 14273211
    HideButtonsOnReadOnly = False
    OnButtonClick = bteFilterButtonClick
  end
end
