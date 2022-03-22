unit Controller.Movimentacao;

interface

procedure Registry;

implementation

uses
  Horse,
  Service.Movimentacao,
  System.JSON,
  DataSet.Serialize,
  System.SysUtils,
  Data.DB;

procedure ListarMovimentacao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceMovimentacao;
begin
  LService := TServiceMovimentacao.Create(nil);
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray());
  finally
    LService.Free
  end;
end;

procedure ObterMovimentacao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDMovimentacao : String;
  LService : TServiceMovimentacao;
begin
  LService := TServiceMovimentacao.Create(nil);
  try
    LIDMovimentacao := Req.Params.Items['idMovimentacao'];
    if LService.GetById(LIDMovimentacao).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Movimentação não existe!');

    Res.Send<TJSONObject>(LService.qryMovimentacao.ToJSONObject());
  finally
    LService.Free
  end;
end;

procedure SalvarMovimentacao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceMovimentacao;
begin
  LService := TServiceMovimentacao.Create(nil);
  try
    Res
      .Send<TJSONObject>(LService.Insert(Req.Body<TJSONObject>)
      .ToJSONOBject()).Status(THTTPStatus.Created);
  finally
    LService.Free
  end;
end;

procedure AlterarMovimentacao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDMovimentacao : String;
  LService : TServiceMovimentacao;
begin
  LService := TServiceMovimentacao.Create(nil);
  try
    LIDMovimentacao := Req.Params.Items['idMovimentacao'];
    if LService.GetById(LIDMovimentacao).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Movimentação não existe!');

    if LService.Update(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure DeletarMovimentacao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDMovimentacao : String;
  LService : TServiceMovimentacao;
begin
  LService := TServiceMovimentacao.Create(nil);
  try
    LIDMovimentacao := Req.Params.Items['idMovimentacao'];
    if LService.GetById(LIDMovimentacao).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Movimentação não existe!');

    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure Registry;
begin
  THorse.Get('/movimentacoes', ListarMovimentacao);
  THorse.Get('/movimentacoes/:idMovimentacao', ObterMovimentacao);
  THorse.Post('/movimentacoes', SalvarMovimentacao);
  THorse.Put('/movimentacoes/:idMovimentacao', AlterarMovimentacao);
  THorse.Delete('/movimentacoes/:idMovimentacao', DeletarMovimentacao);
end;

end.
