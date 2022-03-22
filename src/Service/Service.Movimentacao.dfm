inherited ServiceMovimentacao: TServiceMovimentacao
  OldCreateOrder = True
  inherited FDConnection: TFDConnection
    Connected = True
  end
  object qryMovimentacao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'select idMovimentacao, dataMovimentacao, caixaTotal from movimen' +
        'tacao')
    Left = 128
    Top = 88
    object qryMovimentacaoidMovimentacao: TFDAutoIncField
      FieldName = 'idMovimentacao'
      Origin = 'idMovimentacao'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryMovimentacaodataMovimentacao: TStringField
      FieldName = 'dataMovimentacao'
      Origin = 'dataMovimentacao'
      Required = True
      Size = 60
    end
    object qryMovimentacaocaixaTotal: TBCDField
      FieldName = 'caixaTotal'
      Origin = 'caixaTotal'
      Required = True
      Precision = 7
      Size = 2
    end
  end
end
