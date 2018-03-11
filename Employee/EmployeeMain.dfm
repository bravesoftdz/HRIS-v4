inherited frmEmployeeMain: TfrmEmployeeMain
  Align = alClient
  Caption = 'frmEmployeeMain'
  ClientHeight = 506
  ClientWidth = 926
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 942
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 14
  object JvLabel1: TJvLabel
    Left = 59
    Top = 104
    Width = 54
    Height = 14
    Caption = 'Lastname'
    Transparent = True
  end
  object JvLabel2: TJvLabel
    Left = 59
    Top = 132
    Width = 54
    Height = 14
    Caption = 'Firstname'
    Transparent = True
  end
  object JvLabel3: TJvLabel
    Left = 59
    Top = 160
    Width = 66
    Height = 14
    Caption = 'Middlename'
    Transparent = True
  end
  object JvLabel4: TJvLabel
    Left = 59
    Top = 240
    Width = 52
    Height = 14
    Caption = 'Birthdate'
    Transparent = True
  end
  object JvLabel5: TJvLabel
    Left = 59
    Top = 267
    Width = 74
    Height = 14
    Caption = 'Place of birth'
    Transparent = True
  end
  object JvLabel6: TJvLabel
    Left = 59
    Top = 325
    Width = 42
    Height = 14
    Caption = 'Gender'
    Transparent = True
  end
  object JvLabel7: TJvLabel
    Left = 59
    Top = 32
    Width = 60
    Height = 14
    Caption = 'ID number'
    Transparent = True
  end
  object JvLabel8: TJvLabel
    Left = 59
    Top = 353
    Width = 43
    Height = 14
    Caption = 'Religion'
    Transparent = True
  end
  object JvLabel9: TJvLabel
    Left = 59
    Top = 382
    Width = 58
    Height = 14
    Caption = 'Civil status'
    Transparent = True
  end
  object JvLabel10: TJvLabel
    Left = 59
    Top = 411
    Width = 76
    Height = 14
    Caption = 'Marriage date'
    Transparent = True
  end
  object JvLabel11: TJvLabel
    Left = 427
    Top = 104
    Width = 38
    Height = 14
    Caption = 'Height'
    Transparent = True
  end
  object JvLabel12: TJvLabel
    Left = 427
    Top = 132
    Width = 42
    Height = 14
    Caption = 'Weight'
    Transparent = True
  end
  object JvLabel13: TJvLabel
    Left = 427
    Top = 160
    Width = 61
    Height = 14
    Caption = 'Blood type'
    Transparent = True
  end
  object JvLabel16: TJvLabel
    Left = 427
    Top = 240
    Width = 22
    Height = 14
    Caption = 'TIN'
    Transparent = True
  end
  object JvLabel17: TJvLabel
    Left = 427
    Top = 268
    Width = 23
    Height = 14
    Caption = 'SSS'
    Transparent = True
  end
  object JvLabel18: TJvLabel
    Left = 427
    Top = 297
    Width = 33
    Height = 14
    Caption = 'HDMF'
    Transparent = True
  end
  object JvLabel14: TJvLabel
    Left = 427
    Top = 325
    Width = 28
    Height = 14
    Caption = 'PHIC'
    Transparent = True
  end
  object JvLabel15: TJvLabel
    Left = 427
    Top = 354
    Width = 81
    Height = 14
    Caption = 'Driver'#39's license'
    Transparent = True
  end
  object RzGroupBox2: TRzGroupBox
    Left = 43
    Top = 68
    Width = 302
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Employee name'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clGray
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = clMenu
    FlatColor = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 0
  end
  object edMiddlename: TRzDBEdit
    Left = 138
    Top = 154
    Width = 207
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'employee_middlename'
    CharCase = ecUpperCase
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 4
  end
  object edFirstname: TRzDBEdit
    Left = 138
    Top = 126
    Width = 207
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'employee_firstname'
    CharCase = ecUpperCase
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 3
  end
  object edLastname: TRzDBEdit
    Left = 138
    Top = 98
    Width = 207
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'employee_lastname'
    CharCase = ecUpperCase
    Ctl3D = True
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 2
  end
  object RzGroupBox1: TRzGroupBox
    Left = 43
    Top = 204
    Width = 302
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Personal info'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clGray
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = clMenu
    FlatColor = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 5
  end
  object RzDBEdit4: TRzDBEdit
    Left = 138
    Top = 26
    Width = 121
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'id_num'
    CharCase = ecUpperCase
    Ctl3D = True
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 1
  end
  object RzDBDateTimeEdit1: TRzDBDateTimeEdit
    Left = 138
    Top = 234
    Width = 121
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'birth_date'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 6
    EditType = etDate
  end
  object RzDBMemo1: TRzDBMemo
    Left = 138
    Top = 262
    Width = 207
    Height = 50
    DataField = 'birth_place'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 7
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBDateTimeEdit2: TRzDBDateTimeEdit
    Left = 138
    Top = 405
    Width = 121
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'marriage_date'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 11
    EditType = etDate
  end
  object RzGroupBox3: TRzGroupBox
    Left = 411
    Top = 68
    Width = 302
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Biograpical info'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clGray
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = clMenu
    FlatColor = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 13
  end
  object RzDBEdit6: TRzDBEdit
    Left = 506
    Top = 126
    Width = 143
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'weight'
    CharCase = ecUpperCase
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 15
  end
  object RzDBEdit7: TRzDBEdit
    Left = 506
    Top = 98
    Width = 143
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'height'
    CharCase = ecUpperCase
    Ctl3D = True
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 14
  end
  object RzGroupBox4: TRzGroupBox
    Left = 411
    Top = 204
    Width = 302
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Identification cards'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clGray
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = clMenu
    FlatColor = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 17
  end
  object RzDBEdit8: TRzDBEdit
    Left = 528
    Top = 234
    Width = 185
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'tin'
    CharCase = ecUpperCase
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 18
  end
  object RzDBEdit9: TRzDBEdit
    Left = 528
    Top = 262
    Width = 185
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'sss'
    CharCase = ecUpperCase
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 19
  end
  object RzDBEdit10: TRzDBEdit
    Left = 528
    Top = 291
    Width = 185
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'hdmf'
    CharCase = ecUpperCase
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 20
  end
  object RzDBEdit11: TRzDBEdit
    Left = 528
    Top = 319
    Width = 185
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'phic'
    CharCase = ecUpperCase
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 21
  end
  object RzDBEdit12: TRzDBEdit
    Left = 528
    Top = 348
    Width = 185
    Height = 22
    DataSource = dmEmployee.dsEmployee
    DataField = 'drivers_license'
    CharCase = ecUpperCase
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 22
  end
  object RzDBCheckBox1: TRzDBCheckBox
    Left = 411
    Top = 28
    Width = 63
    Height = 16
    DataField = 'is_external'
    DataSource = dmEmployee.dsEmployee
    ValueChecked = '1'
    ValueUnchecked = '0'
    Caption = 'External'
    TabOrder = 12
  end
  object RzDBLookupComboBox2: TRzDBLookupComboBox
    Left = 138
    Top = 347
    Width = 207
    Height = 22
    Ctl3D = True
    DataField = 'religion_id'
    DataSource = dmEmployee.dsEmployee
    KeyField = 'religion_id'
    ListField = 'religion_name'
    ListSource = dmEmployee.dsReligion
    ParentCtl3D = False
    TabOrder = 9
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBLookupComboBox3: TRzDBLookupComboBox
    Left = 138
    Top = 376
    Width = 207
    Height = 22
    DataField = 'civil_status'
    DataSource = dmEmployee.dsEmployee
    KeyField = 'value'
    ListField = 'display'
    ListSource = dmEmployee.dsCivilStatus
    TabOrder = 10
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBLookupComboBox4: TRzDBLookupComboBox
    Left = 506
    Top = 154
    Width = 111
    Height = 22
    DataField = 'blood_type'
    DataSource = dmEmployee.dsEmployee
    KeyField = 'value'
    ListField = 'display'
    ListSource = dmEmployee.dsBloodType
    TabOrder = 16
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBComboBox1: TRzDBComboBox
    Left = 138
    Top = 319
    Width = 121
    Height = 22
    DataField = 'gender'
    DataSource = dmEmployee.dsEmployee
    Ctl3D = False
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    TabOrder = 8
    Items.Strings = (
      'Male'
      'Female')
    Values.Strings = (
      #39'M'#39
      #39'F'#39)
  end
end
