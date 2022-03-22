inherited ServiceVenda: TServiceVenda
  OldCreateOrder = True
  inherited FDConnection: TFDConnection
    Connected = True
    Left = 32
    Top = 16
  end
  object qryVenda: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'select idVenda, descricao, valorTotal, dataVenda, idClienteVenda' +
        ', idMovimentacaoVenda from venda')
    Left = 144
    Top = 24
    object qryVendaidVenda: TFDAutoIncField
      FieldName = 'idVenda'
      Origin = 'idVenda'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryVendadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 400
    end
    object qryVendavalorTotal: TBCDField
      FieldName = 'valorTotal'
      Origin = 'valorTotal'
      Required = True
      Precision = 7
      Size = 2
    end
    object qryVendadataVenda: TStringField
      FieldName = 'dataVenda'
      Origin = 'dataVenda'
      Required = True
      Size = 60
    end
    object qryVendaidClienteVenda: TIntegerField
      FieldName = 'idClienteVenda'
      Origin = 'idClienteVenda'
      Required = True
    end
    object qryVendaidMovimentacaoVenda: TIntegerField
      FieldName = 'idMovimentacaoVenda'
      Origin = 'idMovimentacaoVenda'
      Required = True
    end
  end
end
