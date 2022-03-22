unit Controller.Numeracao;

interface

procedure Registry;

implementation

uses
  Horse,
  Service.Numeracao,
  System.JSON,
  DataSet.Serialize,
  System.SysUtils,
  Data.DB;

procedure ListarNumeracao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceNumeracao;
begin
  LService := TServiceNumeracao.Create(nil);
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray());
  finally
    LService.Free
  end;
end;

procedure ObterNumeracao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDNumeracao : Int64;
  LService : TServiceNumeracao;
begin
  LService := TServiceNumeracao.Create(nil);
  try
    LIDNumeracao := Req.Params.Items['idMovimentacao'].ToInt64;
    if LService.GetById(LIDNumeracao).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Numerações não existe!');

    Res.Send<TJSONObject>(LService.qryNumeracao.ToJSONObject());
  finally
    LService.Free
  end;
end;

procedure SalvarNumeracao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceNumeracao;
begin
  LService := TServiceNumeracao.Create(nil);
  try
    Res
      .Send<TJSONObject>(LService.Insert(Req.Body<TJSONObject>)
      .ToJSONOBject()).Status(THTTPStatus.Created);
  finally
    LService.Free
  end;
end;

procedure AlterarNumeracao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDNumeracao : Int64;
  LService : TServiceNumeracao;
begin
  LService := TServiceNumeracao.Create(nil);
  try
    LIDNumeracao := Req.Params.Items['idMovimentacao'].ToInt64;
    if LService.GetById(LIDNumeracao).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Numerações não existe!');

    if LService.Update(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure DeletarNumeracao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDNumeracao : Int64;
  LService : TServiceNumeracao;
begin
  LService := TServiceNumeracao.Create(nil);
  try
    LIDNumeracao := Req.Params.Items['idMovimentacao'].ToInt64;
    if LService.GetById(LIDNumeracao).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Numerações não existe!');

    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure Registry;
begin
  THorse.Get('/numeracoes', ListarNumeracao);
  THorse.Get('/numeracoes/:idMovimentacao', ObterNumeracao);
  THorse.Post('/numeracoes', SalvarNumeracao);
  THorse.Put('/numeracoes/:idMovimentacao', AlterarNumeracao);
  THorse.Delete('/numeracoes/:idMovimentacao', DeletarNumeracao);
end;

end.
