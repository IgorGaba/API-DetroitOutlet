inherited ServiceCliente: TServiceCliente
  OldCreateOrder = True
  inherited FDConnection: TFDConnection
    Connected = True
  end
  object qryCliente: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select idCliente, nomeCliente, telefoneCliente from cliente')
    Left = 128
    Top = 24
    object qryClienteidCliente: TFDAutoIncField
      FieldName = 'idCliente'
      Origin = 'idCliente'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryClientenomeCliente: TStringField
      FieldName = 'nomeCliente'
      Origin = 'nomeCliente'
      Required = True
      Size = 160
    end
    object qryClientetelefoneCliente: TStringField
      FieldName = 'telefoneCliente'
      Origin = 'telefoneCliente'
      Required = True
      Size = 44
    end
  end
end
