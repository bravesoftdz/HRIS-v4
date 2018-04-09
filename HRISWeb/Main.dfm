object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 537
  ClientWidth = 1150
  Caption = 'MainForm'
  Color = 15658734
  BorderStyle = bsNone
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  ClientEvents.ExtEvents.Strings = (
    
      'window.afterrender=function window.afterrender(sender, eOpts)'#13#10'{' +
      #13#10'  Ext.get(sender.id).el.setStyle("padding", 0);'#13#10'  Ext.get(sen' +
      'der.id).el.setStyle("border-width", 0);'#13#10'  Ext.get(sender.id).el' +
      '.setStyle("-webkit-border-radius", 0);'#13#10'  Ext.get(sender.id).el.' +
      'setStyle("-moz-border-radius", 0);'#13#10'  Ext.get(sender.id).el.setS' +
      'tyle("border-radius", 0);'#13#10'}'
    
      'window.resize=function window.resize(sender, width, height, oldW' +
      'idth, oldHeight, eOpts)'#13#10'{'#13#10'  ajaxRequest(sender, '#39'screensize'#39', ' +
      '['#39'width='#39'+width,'#39'height='#39'+height] );'#13#10'}')
  Font.Height = -12
  Layout = 'auto'
  LayoutConfig.Padding = '0'
  LayoutConfig.BodyPadding = '0'
  LayoutAttribs.Padding = '0'
  OnAfterShow = UniFormAfterShow
  DesignSize = (
    1150
    537)
  PixelsPerInch = 96
  TextHeight = 14
  object lblWelcomeUser: TUniLabel
    Left = 64
    Top = 31
    Width = 302
    Height = 32
    Hint = ''
    Caption = 'Welcome back Georgee.'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = 8421440
    Font.Height = -27
    Font.Name = 'Arial'
    TabOrder = 0
  end
  object LogoutLabel: TUniLabel
    Left = 1028
    Top = 47
    Width = 53
    Height = 16
    Cursor = crHandPoint
    Hint = ''
    Caption = 'LOGOUT'
    Anchors = [akTop, akRight]
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = 8421440
    Font.Height = -13
    Font.Name = 'Arial'
    TabOrder = 1
    OnClick = LogoutLabelClick
  end
  object ProfileLabel: TUniLabel
    Left = 844
    Top = 47
    Width = 55
    Height = 16
    Cursor = crHandPoint
    Hint = ''
    Caption = 'PROFILE'
    Anchors = [akTop, akRight]
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = 8421440
    Font.Height = -13
    Font.Name = 'Arial'
    TabOrder = 2
    OnClick = ProfileLabelClick
  end
  object UniLabel2: TUniLabel
    Left = 940
    Top = 47
    Width = 51
    Height = 16
    Cursor = crHandPoint
    Hint = ''
    Caption = 'LEAVES'
    Anchors = [akTop, akRight]
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = 8421440
    Font.Height = -13
    Font.Name = 'Arial'
    TabOrder = 3
    OnClick = LogoutLabelClick
  end
  object UniSimplePanel1: TUniSimplePanel
    Left = 64
    Top = 112
    Width = 1017
    Height = 369
    Hint = ''
    ParentColor = False
    Color = clWhite
    Border = True
    ParentAlignmentControl = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object DockPanel: TUniPanel
      Left = 0
      Top = 0
      Width = 1017
      Height = 369
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      Color = clWhite
    end
  end
end
