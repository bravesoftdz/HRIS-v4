object dmApplication: TdmApplication
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 175
  Width = 483
  object acMain: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=HRIS;Data Source=BRYAN-X1C\' +
      'DEVELOPMENT;Use Procedure for Prepare=1;Auto Translate=True;Pack' +
      'et Size=4096;Workstation ID=BRYAN;Initial File Name="";Use Encry' +
      'ption for Data=False;Tag with column collation when possible=Fal' +
      'se;MARS Connection=False;DataTypeCompatibility=0;Trust Server Ce' +
      'rtificate=False;Server SPN="";Application Intent=READWRITE;'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    BeforeConnect = acMainBeforeConnect
    Left = 56
    Top = 24
  end
  object dstUser: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sec_get_user_by_username'
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
        Name = '@username'
        Attributes = [paNullable]
        DataType = ftString
        Size = 25
        Value = ''
      end>
    Left = 128
    Top = 24
  end
  object dstConfig: TADODataSet
    Connection = acMain
    LockType = ltReadOnly
    CommandText = 'sysconfig'
    CommandType = cmdTableDirect
    Parameters = <>
    Left = 128
    Top = 80
  end
  object dstPayrollCode: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'dtr_dd_get_payroll_codes;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 216
    Top = 24
  end
  object dstLocation: TADODataSet
    Connection = acMain
    LockType = ltReadOnly
    CommandText = 'hris_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 216
    Top = 80
  end
  object dstEmployees: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    BeforeOpen = dstEmployeesBeforeOpen
    CommandText = 'dtr_get_employees;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 328
    Top = 24
  end
  object dscEmployees: TDataSource
    DataSet = dstEmployees
    Left = 400
    Top = 24
  end
end
