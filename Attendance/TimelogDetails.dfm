inherited frmTimelogDetails: TfrmTimelogDetails
  Caption = 'frmTimelogDetails'
  ClientHeight = 352
  ClientWidth = 612
  OnCreate = FormCreate
  ExplicitWidth = 612
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 612
    ParentFont = False
    ExplicitWidth = 612
    inherited imgClose: TImage
      Left = 591
      ExplicitLeft = 637
    end
    inherited lblCaption: TRzLabel
      Width = 86
      Caption = 'Timelog details'
      ExplicitWidth = 86
    end
  end
  inherited pnlMain: TRzPanel
    Width = 612
    Height = 331
    ParentFont = False
    ExplicitWidth = 612
    ExplicitHeight = 331
    object lblDate: TRzLabel
      Left = 19
      Top = 23
      Width = 215
      Height = 14
      Caption = 'Log details for January 20, 2017 Friday.'
    end
    object lblHolidayWarning: TRzLabel
      Left = 19
      Top = 304
      Width = 202
      Height = 14
      Anchors = [akLeft, akBottom]
      Caption = 'Note: This date is declared a holiday.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 311
    end
    object pnlOfficelog: TRzPanel
      Tag = 1
      Left = 19
      Top = 50
      Width = 571
      Height = 18
      Anchors = [akLeft, akTop, akRight]
      BorderOuter = fsNone
      BorderColor = clBlack
      BorderWidth = 1
      Color = 14273211
      TabOrder = 0
      object RzLabel6: TRzLabel
        Left = 19
        Top = 28
        Width = 85
        Height = 14
        Caption = 'Morning (AM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel7: TRzLabel
        Left = 29
        Top = 56
        Width = 48
        Height = 14
        Caption = 'Time-in:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel8: TRzLabel
        Left = 29
        Top = 76
        Width = 59
        Height = 14
        Caption = 'Time-out:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblInAm: TRzLabel
        Left = 101
        Top = 56
        Width = 32
        Height = 14
        Caption = '08:30'
      end
      object lblOutAM: TRzLabel
        Left = 101
        Top = 76
        Width = 32
        Height = 14
        Caption = '12:00'
      end
      object RzLabel9: TRzLabel
        Left = 19
        Top = 111
        Width = 97
        Height = 14
        Caption = 'Afternoon (PM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel10: TRzLabel
        Left = 29
        Top = 139
        Width = 48
        Height = 14
        Caption = 'Time-in:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel11: TRzLabel
        Left = 29
        Top = 159
        Width = 59
        Height = 14
        Caption = 'Time-out:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOutPM: TRzLabel
        Left = 101
        Top = 159
        Width = 32
        Height = 14
        Caption = '05:30'
      end
      object lblInPM: TRzLabel
        Left = 101
        Top = 139
        Width = 32
        Height = 14
        Caption = '01:00'
      end
      object RzLabel15: TRzLabel
        Left = 187
        Top = 28
        Width = 51
        Height = 14
        Caption = 'Override'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOvInAm: TRzLabel
        Left = 187
        Top = 56
        Width = 4
        Height = 14
        Caption = '-'
      end
      object lblOvOutAM: TRzLabel
        Left = 187
        Top = 76
        Width = 4
        Height = 14
        Caption = '-'
      end
      object lblOvInPm: TRzLabel
        Left = 187
        Top = 139
        Width = 4
        Height = 14
        Caption = '-'
      end
      object lblOvOutPm: TRzLabel
        Left = 187
        Top = 159
        Width = 4
        Height = 14
        Caption = '-'
      end
      object lblOvAmReason: TRzLabel
        Left = 267
        Top = 56
        Width = 238
        Height = 34
        AutoSize = False
      end
      object lblOvPmReason: TRzLabel
        Left = 267
        Top = 140
        Width = 238
        Height = 34
        AutoSize = False
      end
      object pnlOfficeLogHead: TRzPanel
        Left = 1
        Top = 1
        Width = 569
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
        OnDblClick = imgOfficelogClick
        DesignSize = (
          569
          17)
        object RzLabel4: TRzLabel
          Tag = -1
          Left = 4
          Top = 1
          Width = 119
          Height = 13
          Caption = 'Office log / Overrides'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          FlatColor = clWhite
        end
        object imgOfficelog: TImage
          Tag = 1
          Left = 551
          Top = 0
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          OnClick = imgOfficelogClick
          ExplicitLeft = 498
        end
      end
    end
    object pnlUndertime: TRzPanel
      Tag = 2
      Left = 19
      Top = 75
      Width = 571
      Height = 18
      Anchors = [akLeft, akTop, akRight]
      BorderOuter = fsNone
      BorderColor = clBlack
      BorderWidth = 1
      Color = 14273211
      TabOrder = 1
      object RzLabel1: TRzLabel
        Left = 19
        Top = 28
        Width = 85
        Height = 14
        Caption = 'Morning (AM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel12: TRzLabel
        Left = 19
        Top = 116
        Width = 97
        Height = 14
        Caption = 'Afternoon (PM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel13: TRzLabel
        Left = 29
        Top = 56
        Width = 65
        Height = 14
        Caption = 'Time from:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel14: TRzLabel
        Left = 29
        Top = 76
        Width = 64
        Height = 14
        Caption = 'Time until:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTTimeUntilAM: TRzLabel
        Left = 101
        Top = 76
        Width = 4
        Height = 14
      end
      object lblUTTimeFromAM: TRzLabel
        Left = 101
        Top = 56
        Width = 4
        Height = 14
      end
      object RzLabel17: TRzLabel
        Left = 29
        Top = 144
        Width = 65
        Height = 14
        Caption = 'Time from:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel18: TRzLabel
        Left = 29
        Top = 164
        Width = 64
        Height = 14
        Caption = 'Time until:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTTimeUntilPM: TRzLabel
        Left = 101
        Top = 164
        Width = 4
        Height = 14
      end
      object lblUTTimeFromPM: TRzLabel
        Left = 101
        Top = 144
        Width = 4
        Height = 14
      end
      object RzLabel3: TRzLabel
        Left = 172
        Top = 56
        Width = 49
        Height = 14
        Caption = 'Reason:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTTimeReasonAM: TRzLabel
        Left = 228
        Top = 56
        Width = 301
        Height = 34
        AutoSize = False
      end
      object RzLabel16: TRzLabel
        Left = 172
        Top = 144
        Width = 49
        Height = 14
        Caption = 'Reason:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTTimeReasonPM: TRzLabel
        Left = 228
        Top = 144
        Width = 301
        Height = 34
        AutoSize = False
      end
      object pnlUndertimeHead: TRzPanel
        Left = 1
        Top = 1
        Width = 569
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
        OnDblClick = imgOfficelogClick
        DesignSize = (
          569
          17)
        object RzLabel2: TRzLabel
          Tag = -1
          Left = 4
          Top = 1
          Width = 60
          Height = 13
          Caption = 'Undertime'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          FlatColor = clWhite
        end
        object imgUndertime: TImage
          Tag = 1
          Left = 551
          Top = 0
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          OnClick = imgOfficelogClick
          ExplicitLeft = 498
        end
      end
    end
    object pnlLeaves: TRzPanel
      Tag = 3
      Left = 19
      Top = 100
      Width = 571
      Height = 18
      Anchors = [akLeft, akTop, akRight]
      BorderOuter = fsNone
      BorderColor = clBlack
      BorderWidth = 1
      Color = 14273211
      TabOrder = 2
      object RzLabel19: TRzLabel
        Left = 19
        Top = 28
        Width = 85
        Height = 14
        Caption = 'Morning (AM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel20: TRzLabel
        Left = 29
        Top = 56
        Width = 33
        Height = 14
        Caption = 'Type:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel21: TRzLabel
        Left = 19
        Top = 116
        Width = 97
        Height = 14
        Caption = 'Afternoon (PM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvTypeAM: TRzLabel
        Left = 83
        Top = 56
        Width = 4
        Height = 14
      end
      object RzLabel23: TRzLabel
        Left = 217
        Top = 56
        Width = 56
        Height = 14
        Caption = 'Remarks:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvRemarksAM: TRzLabel
        Left = 279
        Top = 56
        Width = 270
        Height = 45
        AutoSize = False
        WordWrap = True
      end
      object RzLabel25: TRzLabel
        Left = 29
        Top = 144
        Width = 33
        Height = 14
        Caption = 'Type:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvTypePM: TRzLabel
        Left = 83
        Top = 144
        Width = 4
        Height = 14
      end
      object RzLabel27: TRzLabel
        Left = 217
        Top = 144
        Width = 56
        Height = 14
        Caption = 'Remarks:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvRemarksPM: TRzLabel
        Left = 279
        Top = 144
        Width = 270
        Height = 45
        AutoSize = False
        WordWrap = True
      end
      object RzLabel29: TRzLabel
        Left = 29
        Top = 76
        Width = 49
        Height = 14
        Caption = 'Reason:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvReasonAM: TRzLabel
        Left = 83
        Top = 76
        Width = 4
        Height = 14
      end
      object lblLvReasonPM: TRzLabel
        Left = 83
        Top = 164
        Width = 4
        Height = 14
      end
      object RzLabel24: TRzLabel
        Left = 29
        Top = 164
        Width = 49
        Height = 14
        Caption = 'Reason:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnlLeavesHead: TRzPanel
        Left = 1
        Top = 1
        Width = 569
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
        OnDblClick = imgOfficelogClick
        DesignSize = (
          569
          17)
        object RzLabel5: TRzLabel
          Tag = -1
          Left = 4
          Top = 1
          Width = 40
          Height = 13
          Caption = 'Leaves'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          FlatColor = clWhite
        end
        object imgLeaves: TImage
          Tag = 1
          Left = 551
          Top = 0
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          OnClick = imgOfficelogClick
          ExplicitLeft = 498
        end
      end
    end
  end
end
