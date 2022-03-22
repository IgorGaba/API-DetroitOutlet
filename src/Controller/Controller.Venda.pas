unit Controller.Venda;

interface

procedure Registry;

implementation

uses
  Horse,
  Service.Venda,
  System.JSON,
  DataSet.Serialize,
  System.SysUtils,
  Data.DB;

procedure ListarVenda(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceVenda;
begin
  LService := TServiceVenda.Create(nil);
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray());
  finally
    LService.Free
  end;
end;

procedure ObterVenda(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDVenda : Int64;
  LService : TServiceVenda;
begin
  LService := TServiceVenda.Create(nil);
  try
    LIDVenda := Req.Params.Items['idVenda'].ToInt64;
    if LService.GetById(LIDVenda).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Venda não existe!');

    Res.Send<TJSONObject>(LService.qryVenda.ToJSONObject());
  finally
    LService.Free
  end;
end;

procedure SalvarVenda(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceVenda;
begin
  LService := TServiceVenda.Create(nil);
  try
    Res
      .Send<TJSONObject>(LService.Insert(Req.Body<TJSONObject>)
      .ToJSONOBject()).Status(THTTPStatus.Created);
  finally
    LService.Free
  end;
end;

procedure AlterarVenda(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDVenda : Int64;
  LService : TServiceVenda;
begin
  LService := TServiceVenda.Create(nil);
  try
    LIDVenda := Req.Params.Items['idVenda'].ToInt64;
    if LService.GetById(LIDVenda).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Venda não existe!');

    if LService.Update(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure DeletarVenda(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDVenda : Int64;
  LService : TServiceVenda;
begin
  LService := TServiceVenda.Create(nil);
  try
    LIDVenda := Req.Params.Items['idVenda'].ToInt64;
    if LService.GetById(LIDVenda).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Venda não existe!');

    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure Registry;
begin
  THorse.Get('/vendas', ListarVenda);
  THorse.Get('/vendas/:idVenda', ObterVenda);
  THorse.Post('/vendas', SalvarVenda);
  THorse.Put('/vendas/:idVenda', AlterarVenda);
  THorse.Delete('/vendas/:idVenda', DeletarVenda);
end;

end.
