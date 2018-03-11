object dmEmployee: TdmEmployee
  OldCreateOrder = False
  Height = 451
  Width = 593
  object dsEmployee: TDataSource
    DataSet = dstEmployee
    Left = 160
    Top = 32
  end
  object dsReligion: TDataSource
    DataSet = dstReligion
    Left = 360
    Top = 32
  end
  object dsCivilStatus: TDataSource
    DataSet = dstCivilStatus
    Left = 360
    Top = 96
  end
  object dsBloodType: TDataSource
    DataSet = dstBloodType
    Left = 360
    Top = 160
  end
  object dstEmployee: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_employee;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 80
    Top = 33
  end
  object dstReligion: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_religions;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 280
    Top = 33
  end
  object dstCivilStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_civil_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 280
    Top = 97
  end
  object dstBloodType: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_blood_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 280
    Top = 161
  end
  object dscEmpAddressH: TDataSource
    DataSet = dstEmpAddressH
    Left = 160
    Top = 96
  end
  object dstEmpAddressH: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empaddress_h;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = ''
      end>
    Left = 72
    Top = 96
  end
  object dscEmpAddressP: TDataSource
    DataSet = dstEmpAddressP
    Left = 160
    Top = 160
  end
  object dstEmpAddressP: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empaddress_p;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = ''
      end>
    Left = 72
    Top = 160
  end
  object dscEmpContactH: TDataSource
    DataSet = dstEmpContactH
    Left = 160
    Top = 224
  end
  object dstEmpContactH: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empcontact_h;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 72
    Top = 224
  end
  object dscEmpContactP: TDataSource
    DataSet = dstEmpContactP
    Left = 160
    Top = 288
  end
  object dstEmpContactP: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empcontact_p;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 72
    Top = 288
  end
  object dscEmpEmergency: TDataSource
    DataSet = dstEmpEmergency
    Left = 160
    Top = 352
  end
  object dstEmpEmergency: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empemergency;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = ''
      end>
    Left = 72
    Top = 352
  end
  object dscTowns: TDataSource
    DataSet = dstTowns
    Left = 357
    Top = 224
  end
  object dstTowns: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_town_with_prov;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 277
    Top = 224
  end
end
