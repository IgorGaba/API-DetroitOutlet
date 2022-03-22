inherited ServiceDespesa: TServiceDespesa
  OldCreateOrder = True
  inherited FDConnection: TFDConnection
    Connected = True
  end
  object qryDespesa: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'select idDespesa, descricaoDespesa, valor, idMovimentacaoDespesa' +
        ' from despesa')
    Left = 136
    Top = 80
    object qryDespesaidDespesa: TFDAutoIncField
      FieldName = 'idDespesa'
      Origin = 'idDespesa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryDespesadescricaoDespesa: TStringField
      FieldName = 'descricaoDespesa'
      Origin = 'descricaoDespesa'
      Required = True
      Size = 180
    end
    object qryDespesavalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 7
      Size = 2
    end
    object qryDespesaidMovimentacaoDespesa: TIntegerField
      FieldName = 'idMovimentacaoDespesa'
      Origin = 'idMovimentacaoDespesa'
      Required = True
    end
  end
end
