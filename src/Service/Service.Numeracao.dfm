inherited ServiceNumeracao: TServiceNumeracao
  OldCreateOrder = True
  inherited FDConnection: TFDConnection
    Connected = True
  end
  object qryNumeracao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select '
      'idNumeracao, '
      'num30, '
      'num31,'
      'num32,'
      'num33,'
      'num34,'
      'num35,'
      'num36,'
      'num37,'
      'num38,'
      'num39,'
      'num40,'
      'num41,'
      'num42,'
      'num43,'
      'num44,'
      'num45,'
      'num46,'
      'idProdutoNumeracao '
      ''
      'from numeracao')
    Left = 128
    Top = 80
    object qryNumeracaoidNumeracao: TFDAutoIncField
      FieldName = 'idNumeracao'
      Origin = 'idNumeracao'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryNumeracaoquantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object qryNumeracaotamanho: TIntegerField
      FieldName = 'tamanho'
      Origin = 'tamanho'
      Required = True
    end
    object qryNumeracaoidProdutoNumeracao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idProdutoNumeracao'
      Origin = 'idProdutoNumeracao'
      ReadOnly = True
    end
  end
end
