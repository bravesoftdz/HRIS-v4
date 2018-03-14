inherited frmEmployeePhoto: TfrmEmployeePhoto
  Caption = 'frmEmployeePhoto'
  ClientHeight = 472
  ClientWidth = 805
  OnCreate = FormCreate
  ExplicitWidth = 821
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 14
  object EmployeePhoto: TImage
    Left = 157
    Top = 36
    Width = 524
    Height = 373
    Anchors = [akLeft, akTop, akRight, akBottom]
    Center = True
    Proportional = True
  end
  object urlMain: TRzURLLabel
    Left = 17
    Top = 432
    Width = 64
    Height = 14
    Anchors = [akLeft, akBottom]
    Caption = 'Take photo'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8026685
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = urlMainClick
  end
  object ListBox: TListBox
    Left = 17
    Top = 20
    Width = 121
    Height = 97
    ItemHeight = 14
    TabOrder = 0
    Visible = False
  end
  object ListBox2: TListBox
    Left = 17
    Top = 123
    Width = 121
    Height = 97
    ItemHeight = 14
    TabOrder = 2
    Visible = False
  end
  object VideoWindow: TVideoWindow
    Left = 157
    Top = 36
    Width = 524
    Height = 373
    FilterGraph = CaptureGraph
    VMROptions.Mode = vmrRenderless
    Color = clBlack
    Visible = False
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object CaptureGraph: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 208
    Top = 65489
  end
  object SampleGrabber: TSampleGrabber
    FilterGraph = CaptureGraph
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 240
    Top = 65489
  end
  object VideoSourceFilter: TFilter
    BaseFilter.data = {00000000}
    Left = 176
    Top = 65489
  end
end
