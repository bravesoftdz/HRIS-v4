inherited frmBasePopup: TfrmBasePopup
  BorderStyle = bsNone
  Caption = 'frmBasePopup'
  ClientHeight = 281
  ClientWidth = 543
  KeyPreview = True
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object pnlTitle: TRzPanel
    Left = 0
    Top = 0
    Width = 543
    Height = 21
    Align = alTop
    BorderOuter = fsNone
    BorderColor = clBlack
    BorderWidth = 1
    Color = 8675134
    GradientColorStyle = gcsCustom
    GradientColorStart = 6572079
    GradientColorStop = 8675134
    GradientDirection = gdVerticalEnd
    TabOrder = 0
    VisualStyle = vsGradient
    DesignSize = (
      543
      21)
    object imgClose: TImage
      Left = 522
      Top = 2
      Width = 16
      Height = 16
      Hint = 'Close popup'
      Anchors = [akTop, akRight]
      DragCursor = crHandPoint
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        001008060000001FF3FF610000001974455874536F6674776172650041646F62
        6520496D616765526561647971C9653C000002224944415478DAA5923F4C1361
        18C69FEB9FA3D2620CA45D2C31426249970E771D6AAA1D30C574301D9C98088B
        092BB39B8B038B4313191C4C4A1C1B1207454835C412AB890E588980C4D2DC95
        5C5B4FE538AE96FADE7D47539B001ADFE4BDFBBEE7EEF97DEFE51EAEDD6EE37F
        8A7B625E001FF51D5A4E500F9EE1A9533FA3631F52FFB40054B397C2E199B158
        2CC8F7F7F32739CD690D4D334A85C26EB954CA9034C765D9B3E7135353898366
        93C75F940B3056B2D997B44C728F99F6F6E6F4B450ABD5ACCD582E874FE9F41F
        A66ECDEBF522BFB0F08E9622F7C806DC989C146459467479B9632A8E8F5BF75E
        CDE7F3616D719101E66DC0F5745A9024098AA2E0F6E626745D87AAAAD0340DAD
        560B0E87032BA208B7DB0DBFDF8FCAFA3A03646C403C9512AAD52A5ACD26A44A
        0591A525389D4ECBC0F33C5E45A370DA53786982BD7299011E1C03924941DAD9
        8156AFA34D2786F2F98ED9ECB548A4F3197C5F1FBECA3203CCD980ABA228D4B6
        B7CD7F85E11EB3CBE5B2FA4D2864BDECA0C94A8AC200F76D40626444D01A0D0C
        75993FD0D8665DDBD8B00066BD1F1DA5E47128D6EB0C70CF06A48241C1D8DFC7
        1E6DC2C5223E9239608F6C6AF1AD2DAC92F9587BD16830C05D3B48B70281046F
        07A9427DB1273CDDDAC1D191F15455599086E94AF198BDE2F1CCC43C9EE000C7
        9D9AC61F647EADEBBB9F0F0F333933CAA40D9E072EC7893304C4687FE18C247F
        A3BC165681DC77E08B0938473DC022FE4FF5CB1CE83770D0D05478554C580000
        000049454E44AE426082}
      ShowHint = True
      OnClick = imgCloseClick
    end
    object lblCaption: TRzLabel
      Left = 8
      Top = 4
      Width = 116
      Height = 13
      Caption = 'Change caption here'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pnlMain: TRzPanel
    Left = 0
    Top = 21
    Width = 543
    Height = 260
    Align = alClient
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderColor = clBlack
    BorderWidth = 1
    Color = 12955288
    TabOrder = 1
  end
end
