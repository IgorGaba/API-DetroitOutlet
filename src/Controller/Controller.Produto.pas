unit Controller.Produto;

interface

procedure Registry;

implementation

uses
  Horse,
  Service.Produto,
  System.JSON,
  DataSet.Serialize,
  System.SysUtils,
  Data.DB;

procedure ListarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceProduto;
begin
  LService := TServiceProduto.Create(nil);
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray());
  finally
    LService.Free
  end;
end;

procedure ObterProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDProduto : Int64;
  LService : TServiceProduto;
begin
  LService := TServiceProduto.Create(nil);
  try
    LIDProduto := Req.Params.Items['idProduto'].ToInt64;
    if LService.GetById(LIDProduto).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Produto não existe!');

    Res.Send<TJSONObject>(LService.qryProduto.ToJSONObject());
  finally
    LService.Free
  end;
end;

procedure SalvarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceProduto;
begin
  LService := TServiceProduto.Create(nil);
  try
    Res
      .Send<TJSONObject>(LService.Insert(Req.Body<TJSONObject>)
      .ToJSONOBject()).Status(THTTPStatus.Created);
  finally
    LService.Free
  end;
end;

procedure AlterarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDProduto : Int64;
  LService : TServiceProduto;
begin
  LService := TServiceProduto.Create(nil);
  try
    LIDProduto := Req.Params.Items['idProduto'].ToInt64;
    if LService.GetById(LIDProduto).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Produto não existe!');

    if LService.Update(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure DeletarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDProduto : Int64;
  LService : TServiceProduto;
begin
  LService := TServiceProduto.Create(nil);
  try
    LIDProduto := Req.Params.Items['idProduto'].ToInt64;
    if LService.GetById(LIDProduto).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Produto não existe!');

    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure Registry;
begin
  THorse.Get('/produtos', ListarProduto);
  THorse.Get('/produtos/:idProduto', ObterProduto);
  THorse.Post('/produtos', SalvarProduto);
  THorse.Put('/produtos/:idProduto', AlterarProduto);
  THorse.Delete('/produtos/:idProduto', DeletarProduto);
end;

end.
