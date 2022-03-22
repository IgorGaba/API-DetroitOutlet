unit Controller.VendaProduto;

interface

procedure Registry;

implementation

uses
  Horse,
  Service.VendaProduto,
  System.JSON,
  DataSet.Serialize,
  System.SysUtils,
  Data.DB;

procedure ListarVendaProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceVendaProduto;
begin
  LService := TServiceVendaProduto.Create(nil);
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray());
  finally
    LService.Free
  end;
end;

procedure ObterVendaProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDVendaProduto : Int64;
  LService : TServiceVendaProduto;
begin
  LService := TServiceVendaProduto.Create(nil);
  try
    LIDVendaProduto := Req.Params.Items['idVendaProduto'].ToInt64;
    if LService.GetById(LIDVendaProduto).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Venda Produto não existe!');

    Res.Send<TJSONObject>(LService.qryVendaProduto.ToJSONObject());
  finally
    LService.Free
  end;
end;

procedure SalvarVendaProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceVendaProduto;
begin
  LService := TServiceVendaProduto.Create(nil);
  try
    Res
      .Send<TJSONObject>(LService.Insert(Req.Body<TJSONObject>)
      .ToJSONOBject()).Status(THTTPStatus.Created);
  finally
    LService.Free
  end;
end;

procedure AlterarVendaProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDVendaProduto : Int64;
  LService : TServiceVendaProduto;
begin
  LService := TServiceVendaProduto.Create(nil);
  try
    LIDVendaProduto := Req.Params.Items['idVendaProduto'].ToInt64;
    if LService.GetById(LIDVendaProduto).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Venda Produto não existe!');

    if LService.Update(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure DeletarVendaProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDVendaProduto : Int64;
  LService : TServiceVendaProduto;
begin
  LService := TServiceVendaProduto.Create(nil);
  try
    LIDVendaProduto := Req.Params.Items['idVendaProduto'].ToInt64;
    if LService.GetById(LIDVendaProduto).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Venda Produto não existe!');

    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure Registry;
begin
  THorse.Get('/venda-produtos', ListarVendaProduto);
  THorse.Get('/venda-produtos/:idVendaProduto', ObterVendaProduto);
  THorse.Post('/venda-produtos', SalvarVendaProduto);
  THorse.Put('/venda-produtos/:idVendaProduto', AlterarVendaProduto);
  THorse.Delete('/venda-produtos/:idVendaProduto', DeletarVendaProduto);
end;

end.
