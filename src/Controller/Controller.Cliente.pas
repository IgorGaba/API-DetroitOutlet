unit Controller.Cliente;

interface

procedure Registry;

implementation

uses
  Horse,
  Service.Cliente,
  System.JSON,
  DataSet.Serialize,
  System.SysUtils,
  Data.DB;

procedure ListarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray());
  finally
    LService.Free
  end;
end;

procedure ObterCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDCliente : Int64;
  LService : TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);
  try
    LIDCliente := Req.Params.Items['idCliente'].ToInt64;
    if LService.GetById(LIDCliente).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Cliente não existe!');

    Res.Send<TJSONObject>(LService.qryCliente.ToJSONObject());
  finally
    LService.Free
  end;
end;

procedure SalvarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);
  try
    Res
      .Send<TJSONObject>(LService.Insert(Req.Body<TJSONObject>)
      .ToJSONOBject()).Status(THTTPStatus.Created);
  finally
    LService.Free
  end;
end;

procedure AlterarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDCliente : Int64;
  LService : TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);
  try
    LIDCliente := Req.Params.Items['idCliente'].ToInt64;
    if LService.GetById(LIDCliente).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Cliente não existe!');

    if LService.Update(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure DeletarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDCliente : Int64;
  LService : TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);
  try
    LIDCliente := Req.Params.Items['idCliente'].ToInt64;
    if LService.GetById(LIDCliente).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Cliente não existe!');

    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure Registry;
begin
  THorse.Get('/clientes', ListarCliente);
  THorse.Get('/clientes/:idCliente', ObterCliente);
  THorse.Post('/clientes', SalvarCliente);
  THorse.Put('/clientes/:idCliente', AlterarCliente);
  THorse.Delete('/clientes/:idCliente', DeletarCliente);
end;

end.
