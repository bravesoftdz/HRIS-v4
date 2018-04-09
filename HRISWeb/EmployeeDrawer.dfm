object EmployeeDrawerFrame: TEmployeeDrawerFrame
  Left = 0
  Top = 0
  Width = 653
  Height = 240
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
  object MenuPanel: TUniSimplePanel
    Left = 0
    Top = 0
    Width = 200
    Height = 240
    Hint = ''
    ParentColor = False
    Color = 16250871
    Align = alLeft
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    object MainLabel: TUniLabel
      Left = 41
      Top = 26
      Width = 28
      Height = 16
      Cursor = crHandPoint
      Hint = ''
      Caption = 'Main'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 8026685
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      TabOrder = 1
      OnClick = MainLabelClick
    end
    object AddressAndContactLabel: TUniLabel
      Left = 41
      Top = 58
      Width = 120
      Height = 16
      Cursor = crHandPoint
      Hint = ''
      Caption = 'Address and contact'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 8026685
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      TabOrder = 2
    end
    object FamilyAndRelativesLabel: TUniLabel
      Left = 41
      Top = 90
      Width = 115
      Height = 16
      Cursor = crHandPoint
      Hint = ''
      Caption = 'Family and relatives'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 8026685
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      TabOrder = 3
    end
    object PafRecordsLabel: TUniLabel
      Left = 41
      Top = 122
      Width = 72
      Height = 16
      Cursor = crHandPoint
      Hint = ''
      Caption = 'PAF records'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 8026685
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      TabOrder = 4
    end
  end
  object DockPanel: TUniSimplePanel
    Left = 200
    Top = 0
    Width = 453
    Height = 240
    Hint = ''
    ParentColor = False
    Color = clWhite
    Align = alClient
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitLeft = 464
    ExplicitTop = 136
    ExplicitWidth = 256
    ExplicitHeight = 128
  end
end
