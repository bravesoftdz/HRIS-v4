inherited frmEmployeeDrawer: TfrmEmployeeDrawer
  Caption = 'frmEmployeeDrawer'
  ClientHeight = 352
  ClientWidth = 696
  OnShow = FormShow
  ExplicitWidth = 712
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 696
    ExplicitWidth = 696
    inherited lblTitle: TRzLabel
      Width = 58
      Caption = 'Employee'
      ExplicitWidth = 58
    end
  end
  object pnlDock: TRzPanel
    Left = 0
    Top = 28
    Width = 696
    Height = 324
    Align = alClient
    BorderOuter = fsNone
    BorderSides = []
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    GradientColorStyle = gcsCustom
    GradientColorStart = 8421440
    GradientColorStop = 10329423
    TabOrder = 1
    VisualStyle = vsClassic
  end
end
