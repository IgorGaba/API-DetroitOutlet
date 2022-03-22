inherited ServiceProduto: TServiceProduto
  OldCreateOrder = True
  inherited FDConnection: TFDConnection
    Connected = True
  end
  object qryProduto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select '
      '  idProduto, '
      '  marcaProduto, '
      '  modeloProduto, '
      '  categoriaProduto, '
      '  fornecedorProduto, '
      '  precoUnitarioProduto,  '
      '  precoAtacadoProduto, '
      '  quantidadeNum30,'
      '  quantidadeNum31,'
      '  quantidadeNum32,'
      '  quantidadeNum33,'
      '  quantidadeNum34,'
      '  quantidadeNum35,'
      '  quantidadeNum36,'
      '  quantidadeNum37,'
      '  quantidadeNum38,'
      '  quantidadeNum39,'
      '  quantidadeNum40,'
      '  quantidadeNum41,'
      '  quantidadeNum42,'
      '  quantidadeNum43,'
      '  quantidadeNum44,'
      '  quantidadeNum45'
      'from produto')
    Left = 136
    Top = 72
    object qryProdutoidProduto: TFDAutoIncField
      FieldName = 'idProduto'
      Origin = 'idProduto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryProdutomarcaProduto: TStringField
      FieldName = 'marcaProduto'
      Origin = 'marcaProduto'
      Required = True
      Size = 80
    end
    object qryProdutomodeloProduto: TStringField
      FieldName = 'modeloProduto'
      Origin = 'modeloProduto'
      Required = True
      Size = 80
    end
    object qryProdutocategoriaProduto: TStringField
      FieldName = 'categoriaProduto'
      Origin = 'categoriaProduto'
      Required = True
      Size = 60
    end
    object qryProdutofornecedorProduto: TStringField
      FieldName = 'fornecedorProduto'
      Origin = 'fornecedorProduto'
      Required = True
      Size = 60
    end
    object qryProdutoprecoUnitarioProduto: TBCDField
      FieldName = 'precoUnitarioProduto'
      Origin = 'precoUnitarioProduto'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryProdutoprecoAtacadoProduto: TBCDField
      FieldName = 'precoAtacadoProduto'
      Origin = 'precoAtacadoProduto'
      Required = True
      Precision = 5
      Size = 2
    end
    object qryProdutoquantidadeNum30: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum30'
      Origin = 'quantidadeNum30'
    end
    object qryProdutoquantidadeNum31: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum31'
      Origin = 'quantidadeNum31'
    end
    object qryProdutoquantidadeNum32: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum32'
      Origin = 'quantidadeNum32'
    end
    object qryProdutoquantidadeNum33: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum33'
      Origin = 'quantidadeNum33'
    end
    object qryProdutoquantidadeNum34: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum34'
      Origin = 'quantidadeNum34'
    end
    object qryProdutoquantidadeNum35: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum35'
      Origin = 'quantidadeNum35'
    end
    object qryProdutoquantidadeNum36: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum36'
      Origin = 'quantidadeNum36'
    end
    object qryProdutoquantidadeNum37: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum37'
      Origin = 'quantidadeNum37'
    end
    object qryProdutoquantidadeNum38: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum38'
      Origin = 'quantidadeNum38'
    end
    object qryProdutoquantidadeNum39: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum39'
      Origin = 'quantidadeNum39'
    end
    object qryProdutoquantidadeNum40: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum40'
      Origin = 'quantidadeNum40'
    end
    object qryProdutoquantidadeNum41: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum41'
      Origin = 'quantidadeNum41'
    end
    object qryProdutoquantidadeNum42: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum42'
      Origin = 'quantidadeNum42'
    end
    object qryProdutoquantidadeNum43: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum43'
      Origin = 'quantidadeNum43'
    end
    object qryProdutoquantidadeNum44: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum44'
      Origin = 'quantidadeNum44'
    end
    object qryProdutoquantidadeNum45: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeNum45'
      Origin = 'quantidadeNum45'
    end
  end
end
