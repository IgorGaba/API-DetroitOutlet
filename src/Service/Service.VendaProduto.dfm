inherited ServiceVendaProduto: TServiceVendaProduto
  OldCreateOrder = True
  inherited FDConnection: TFDConnection
    Connected = True
  end
  object qryVendaProduto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select idVendaProduto, fkIdProduto, fkIdVenda from venda_produto')
    Left = 136
    Top = 64
    object qryVendaProdutoidVendaProduto: TFDAutoIncField
      FieldName = 'idVendaProduto'
      Origin = 'idVendaProduto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryVendaProdutofkIdProduto: TIntegerField
      FieldName = 'fkIdProduto'
      Origin = 'fkIdProduto'
      ReadOnly = True
      Required = True
    end
    object qryVendaProdutofkIdVenda: TIntegerField
      FieldName = 'fkIdVenda'
      Origin = 'fkIdVenda'
      ReadOnly = True
      Required = True
    end
  end
end
