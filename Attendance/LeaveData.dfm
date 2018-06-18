object dmLeave: TdmLeave
  OldCreateOrder = False
  Height = 299
  Width = 418
  object dstLeaves: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'dtr_get_leaves;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end
      item
        Name = '@branch_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = ''
      end>
    Left = 47
    Top = 24
  end
end
