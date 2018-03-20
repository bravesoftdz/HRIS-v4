inherited frmLogin: TfrmLogin
  BorderIcons = [biSystemMenu]
  Caption = ''
  ClientHeight = 243
  ClientWidth = 434
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 434
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 434
    ExplicitWidth = 434
    inherited imgClose: TImage
      Left = 413
      ExplicitLeft = 413
    end
    inherited lblCaption: TRzLabel
      Width = 30
      Caption = 'Login'
      ExplicitWidth = 30
    end
  end
  inherited pnlMain: TRzPanel
    Width = 434
    Height = 222
    ExplicitLeft = 0
    ExplicitTop = 21
    ExplicitWidth = 434
    ExplicitHeight = 222
    object Label5: TLabel
      Left = 136
      Top = 38
      Width = 223
      Height = 14
      Caption = 'Human Resource Integrated System'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Label1: TLabel
      Left = 125
      Top = 94
      Width = 54
      Height = 14
      Caption = 'Username'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 125
      Top = 123
      Width = 51
      Height = 14
      Caption = 'Password'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbErrorMessage: TLabel
      Left = 14
      Top = 203
      Width = 69
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Error Message'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object imgLogo: TImage
      Left = 79
      Top = 27
      Width = 48
      Height = 48
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
        003008060000005702F9870000002B744558744372656174696F6E2054696D65
        00446F203134204E6F7620323030322031363A34333A3036202B30313030DB05
        50ED0000000774494D4507D3071D121716A6D8D1AA000000097048597300000B
        1200000B1201D2DD7EFC0000000467414D410000B18F0BFC610500000EDC4944
        415478DAED590B7854E5997ECF9933E7CC4C92616642127241EE8854546E41BB
        5DAAB580912E02552E969B5CEC16AAAE208BB8BBBA5A5976B715D46257D43E42
        B9798176B505DAC6B6916212C8054981C410084948C865AE99FBE59CB3DF7FCE
        0C09C8BA26D687F679F6E4F99F73CECC39FFFFBEDFF77E977FC2E1AFFCE0AE37
        80FF2770BD015C3702A5CF21232E422A13E17E722D94DA1730D0031444649839
        051E55C2F96F3C8ED85F1481FF7811FC043796278C783CA160B4C1005E32A0DB
        6442772886024506A728E0E271A889387C26016F0B329E99BE091DD79A6FFF3A
        18C331DC45EF4D2524F9344CAA023FCFA385E750CD7BF1E183BB10F8B3102859
        0443571EDEE4052CCAC80047A02108002DA61DEC2CCB4022A19F6364FB601088
        44D06E33A1A8E8797C9C9A4BA5755F7F0C4BD510FE453062586A3E36874A5F46
        A34080608723F09A05EC4E37E3D9FBB7C0F98508BCBB111BC83A9B1D0E706479
        B06134EA6736D8C20C34595F23C0EE1919468246B325819BBFBD0DFE5D4F22BD
        DB8F5D12705F6E0E38AB9540703AF89441B8242AF66E5B1BE0F3E2922D03B3E6
        6F4165BF081C78148E90018D761BAC92A42F9402AE592BA88325296800B46B05
        10E9594904BC5EFA2C8E677C1DF8A168C3AF2D264CCDCBD79F652335578A0423
        C00C90324457171169457B9605B7CD7DE94A397E2E026FADC3C3B28AED767BCF
        626CA17098013361D2D869B00FC885644A2714E4165586DBDD86F293C5F0F8BA
        C0E441566C24622544EAA1BC3C7D0E06B437F8D4758A00330223C18EC646BA8F
        61C3E26DF8CF3E13D8F70F78C720E181B4B41E2BA52C3377FA2A982CC48C4BFA
        9ECDC8BE644A57391CFC60073CDDED8846A03240049E63D24B814FCD97BA4E49
        2845800DE6D1A6662213C3D3CB5EC10FFA4C60D7F7719A8C3B3615686C31269B
        82ECAF60CAE459C9B0640236F44CCBF444231E0960C73B2FB327C0F4CE460A68
        0AB8DF0F385D6024B5B84AC9941D2CAE7CF4FD707B867A7396E396214F369DEA
        33819DDF47AB390D79A2D8E3E6F64E60D6371E4466CE509A8545B33169BE642A
        51289A958476FDD1D1F7505357039BEDD3049C945B424113BE36651A32B30AD0
        1DF423140912F0306432BD89180D2D188134E75972857B0DB7A4E227FDF1409B
        D18C5C069CB9D36CD6175EB1E829DDEA0CBC91B113F519E5A4781311CD0BBED6
        7AEC3AF4161C49024C22A918723A452C9BBF068285BE14D83C647E5ED0E7A1C8
        4722AABBE1522DB9AA6107B7B4FAA13E13D8F1086AC810E3588A0C85F5CF460D
        1D896FDEBD80AE787D51C1AC93608498E519F8182D2ED34B6117DEDCBB0D62FA
        95045A2E02774E998151374ED28D20D03C22CD2388C93CCCC0B34C41049C14C5
        EED3BFE6965415F599C0CFD6E05DD580FB19F81993A622C6193072C4AD3048AC
        9A99F4058D669D8841D0416BE0E98538CBB32E1CF9601F5A626EA4597A8A1F23
        B066F1E33D0660E267F330225A612123C493045C17286BD47CC02DAB9ED66702
        BB1FC1F78231FCC448A67B68DAB701DB20DDCD9A6CCC7AC267EEA754A5790424
        9F784CF702D39CBF0391FA2378BFF50CC4649C336FAA0907E6DDB722E9453204
        0B326610E60D45D50D21477523B8C803CE3387B96555F7F699C0817518E80D61
        F3BC9BC6DE929E3BBA10037274BD334BA53CA09551319903590CB06A16D50978
        2FC25D5F8ADFB4D56B04582C8542803D6D088AEE9E432B08BA17580AE2590C24
        D3B1D69724B40280F67A3244E34FB9A5552BFB4C2075A83B27BE0663F62A3806
        EB5261E035DD0BFABD9646D9E24CBF8ABE300BE6AEF3683E771C473B2EC09824
        C002D8913E184577521AE6D887A9E62AD94F68A5444E966322D15243D75D6BB9
        C5555BFB4FE06713D742B5BE80EC617ADED72CDF8B00D7BB0AC997D3282EFE09
        65B5D5680C77C1C0F7B41B46D870FF8C85FAE44C82AC8A0B067D1E25E94935AE
        57B3FA52155C6222F770F589FE13D87FC704B81395C8BB89D3F3BEA0EBD590AC
        48E07BA6D5CA6872F10BC7D4776A6A2AFC8948612A88192F971B583D7B690F78
        6D1E069CCDA5E80FB141951C97CE9FC4EAAAF1641FB5FF04D8F33B261E8369D0
        64A4397A1130E832E0F89E27538BFB2E019E0BE5BB6BAABF158EE228611CC3EA
        0823E1F501778D9B82D1C3C724DB905E5E4C1D2C03B59D526133CCE21E28FFD5
        D598FABC23232FCC242FFC1259C339CD720C784AB72CF8D4A484D8216B8B2BC8
        E0EEE11654145341CCA3EE751FBD3295252E85CD173360E9D419D00C72B99FE2
        7564AC06781A5498E42DDCC2134F5C0B4FBFB694EA9EC29710E11F812D9FD302
        990187A1C772ECCC52A0EB9C0A8BBC959B7F7C5DEADD2D5BC137968EDD94636A
        DF30D8E2E6E2C4354BE2316BDCCD9446AD7A6663B28BF93502DBCE4CA878AAFC
        CEAFFB2B5784FF2C04BA1E1DE2703AE5A50387A43F3F7078BA05E6015480D2F5
        02C480B3F21F216D849D3857EE56CAF6B4FED8CA275EBF2F88D318F702457CCE
        F3E0138F490503C51B739DB0B71CC692B9768C2A5C8CC1EE3258E22E52920951
        6A149FFD5D2EDE78FD0C1153CEC26C5F8EB27947FB4DC0B91822E718BDD6E38F
        FD232FF076D14C1B62034973D450984D54B0029D9AEB555ABC531A8D52FEAB88
        BCF8122C9E76F8BA62B22528EF59307E7BAE9A619E56303A07628699129884BA
        833578EEE5D9183DCC0A131509336DB28564AB71E8701DB66CAF42EEC81C3457
        9C0F93B116A26CC17B7D26A03E3B6248AB933F404966424696C409E47239AE20
        E24FC04D7B8261AFD6C2E773C3D5D1814E4F10CEAE4EB8BBBD30EDDE867CCF19
        481922A5712F9A5D46FC74D16E446D991A4091B66BCD279B51785B3696AF984C
        C0554884DE4092E4C99B95272EE15F7FF0074C9C3309AE262725B3862004DBDF
        A062C1C92B09ACC444BC81AA6B818F6D1C33A223142F91D28C0503B225520987
        57E35D5820DB20C538785AFD88668C41FAFA3D70538BEAEC6CA7DD1891F10720
        BDBD1D051DA760B14BA42C059D9FF8D0E849C32B2B7F41D637821922E28FA0A5
        A201AFEE5CA8D50E81D7093035363579F14FEB0F61FCBCDB9108C7A818B7A1AB
        A1E338AABAEF00D62B3D0456E1185D3D80D7D07C85E53764A75F0C5B8F896986
        B1D681265A9427D970B83778169D5C02FB6283911D31A0F3BC17213E1BF1A235
        F03A86C11D082070F6346C6FFC1083F28D94DE39CA860A794DC5A51A37CA0AA6
        E397B337C1C4C5A8F9945073F004162D2F44E11D379093A95EB13FAA782DCD6E
        6CFEE7628C7F6032E2C128156505674B6AD504679A8BB2EFFC776F0267E8BD00
        22B80BBB114C11703F36F2B510B855D61C893226A7116013CF0C9D43F7B81CB4
        D63763A72F1F634302F56B51B85B7C087527B43E4E0ED16624D34CD951A28652
        D608C4D90827D0FE273F5E5EF9738433F3A81331C0DBEE45E7A9663CB3753633
        9BD689F0B44EEDC936EC7AB30237DF7B2B1188516157E06CEA82F39CA71855CB
        A6F726502A0E12EE88B5277E0F13E6E0C7E88E3E32F2D6D6A85C99916D120489
        A57CB2BEC06B2FCC94CF63E8ACC9DADB07FF588ECDAD764C2769B0B888125839
        9AD07AB07894804793C0E9CC4828E405D7392F4A86CD4571D14698C9938245C4
        272567509067C583DFFB5B2A230AF57506ECDF710C2D9782187CEB10DA9AC6A8
        FD4850831B4763694394D2783E6A57B95204DEB58E37DFAF92EDFDE7C34D046C
        F3B178C15DD982383FCD66D42D2F18B45E8D6973261A316A4E21F232ED88505F
        BCEFC3A35854CFE3E156AB0692E93D11D1816BF71A78F9F27DC41B434B1B871F
        AD3B0A0B75AC3C7981C9ACEEF7B5D4972AF8CAA41B689B19C599B20B1873EF6D
        54E8797A8F1945A6BE4E41537523CD19FF16AABE7B30456053DA8DD253D61B2C
        305060062F114177140EEA86B3285D98585EA3C00A090A02BC82768B82857F37
        1583688F68A6169805F65B1F7D8451D51E3C536F071F5575E0570DCD0BE40139
        2EC35517C08BCBF723E01844FD1B052EF5180622E2B9E842C019D0626DE0D01C
        DA620854D0D96F95F41EB995C9A8A3A11D21576023AABFFBEFA92C3447CA37FE
        DC31368D72B1A86DA4D95962935258897416E9338B494486C58C74B349037EC5
        B344F4FDCA4A788FD6E3858F1DC8603F76F506DFCB1B3281F09D0D62EFB4A751
        77D30CCA3CB2A679F6931F03CE0CC236348AA2685657287855BAEFF8A48D480A
        D4652BE8EEF0FD177960B54E60051CBC856BCFFEDA00E365604970E6E4594A7E
        7E05F05EDFB3CF8C04E0685D1DFE585C8E1F950DA0CACA27095CE911968D026D
        011C1ABB04476E5F0923470458EAA47E8A9DB5AD40B21954083803ACCA2ADCE4
        1D160BA25984B7C5FD0E3EFEFBF93D856C250E654E4A2FCAC8367F1A682FC057
        13BBFC2C0D23798159AFAEB5157B0FFD0E1B4B244C681134D95C8E0D46800885
        BB82F830B708EFDFBD0122E2F41E79804F5A5F4FE2FA7680F545AA7EF6BBFCF0
        B57AF45BD9F8042A976EE921F030EE911CC2A1DC423B67BA1A1C930803FD1924
        D8594C129069B1EDC5C51851DC8147CB2CBA07E23A8170775CDBACC4A88055DA
        A660CF3D9B21D1BE97595F23C07329F8C9CE96325B288E903788B0274069387E
        11E2802751BE60CFA75B8955F86DD66DD6699937A47F6EEB9B52C4E89A1150C8
        ED3B4A4A90F39B8B58574AA955938C2E239902B1EB4208A2C50025144375DA2D
        7865CAD3301B12A47D81F2044986402BA47B394E5987324F2C14532970BBC19B
        8E50A4BF058F7200F54BA2D7EE8596613097C61D1F3C2573903D3B4D07DA2B06
        AE96D5D5F72C0618F82C02FF44591AF5FABAE559E6D0CE6C7BDC14D20819159C
        787ACC733B5BD2870FA52FB2A87F1035ADC864015EF542E5691B263750013A4D
        A04FF706FDD9CDDC0ADCC259B8C3F9E31C79F923EC3AD0A484FE2FEBBF5D5A4A
        E05BF044793AEDE7551D388D585046C01343D8C7AAB4E2A21DC49681346652E3
        FD79BBE1FFEDB87637BA1A949CB1C56C15E7E78DB4F383F26C70D8D3298D4A57
        C8E9728622F0BF385E01EB7B4D587DD0A8816755381A26F02199E9C24FE63D42
        FBAC03D484EE7F109FFD6FA32F4E2075ACC5187A62018C98CA19315A900C365E
        E0782A27E292D95F3764DBAC9A677E75BC0AF1C38D8D6BB7E19881E294DEA41D
        0DDC54B8CF936A4E7500B5EBF1E5FCC3AF7FFFA5FC377CF4D09C3BBF9A45047E
        5B55838F2F5CD88B6C2CC13CC85F06C82F83401911B8BDAABE11358D4DFB9087
        C5D7037CFF096C42E5D02159132FB477EDA59DC412BC7B7DC07F2102D4243590
        DA17E15924AE17F8FE13781EEBA9FA6FBDDEE0FB4FE02FE8F81F609EC58B5404
        6D760000000049454E44AE426082}
    end
    object prbStatus: TRzProgressBar
      Left = 14
      Top = 210
      Width = 406
      Height = 6
      Anchors = [akLeft, akBottom]
      BarColor = clGray
      BarColorStop = clSilver
      BarStyle = bsGradient
      BorderOuter = fsFlat
      BorderWidth = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      InteriorOffset = 0
      ParentFont = False
      PartsComplete = 0
      Percent = 0
      ShowPercent = False
      ThemeAware = False
      TotalParts = 0
      Visible = False
    end
    object lblStatus: TLabel
      Left = 14
      Top = 195
      Width = 3
      Height = 13
      Anchors = [akLeft, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblVersion: TLabel
      Left = 136
      Top = 54
      Width = 223
      Height = 13
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = 'Version 4'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object edUsername: TRzEdit
      Left = 189
      Top = 88
      Width = 121
      Height = 22
      Text = ''
      CharCase = ecUpperCase
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
      OnChange = edUsernameChange
    end
    object edPassword: TRzEdit
      Left = 189
      Top = 117
      Width = 121
      Height = 22
      Text = ''
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = edPasswordKeyPress
    end
    object pnlClose: TRzPanel
      Left = 227
      Top = 164
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 13816530
      BorderWidth = 1
      Color = clMenu
      TabOrder = 2
      object btnClose: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        BorderStyle = bsNone
        Caption = 'Close'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnCloseClick
      end
    end
    object pnlLogin: TRzPanel
      Left = 171
      Top = 164
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 13816530
      BorderWidth = 1
      Color = clMenu
      TabOrder = 3
      object btnLogin: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        BorderStyle = bsNone
        Caption = 'Login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnLoginClick
      end
    end
  end
end
