unit Controller.Despesa;

interface

procedure Registry;

implementation

uses
  Horse,
  Service.Despesa,
  System.JSON,
  DataSet.Serialize,
  System.SysUtils,
  Data.DB;

procedure ListarDespesa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceDespesa;
begin
  LService := TServiceDespesa.Create(nil);
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray());
  finally
    LService.Free
  end;
end;

procedure ObterDespesa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDDespesa : Int64;
  LService : TServiceDespesa;
begin
  LService := TServiceDespesa.Create(nil);
  try
    LIDDespesa := Req.Params.Items['idCliente'].ToInt64;
    if LService.GetById(LIDDespesa).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Despesa não existe!');

    Res.Send<TJSONObject>(LService.qryDespesa.ToJSONObject());
  finally
    LService.Free
  end;
end;

procedure SalvarDespesa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService : TServiceDespesa;
begin
  LService := TServiceDespesa.Create(nil);
  try
    Res
      .Send<TJSONObject>(LService.Insert(Req.Body<TJSONObject>)
      .ToJSONOBject()).Status(THTTPStatus.Created);
  finally
    LService.Free
  end;
end;

procedure AlterarDespesa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDDespesa : Int64;
  LService : TServiceDespesa;
begin
  LService := TServiceDespesa.Create(nil);
  try
    LIDDespesa := Req.Params.Items['idCliente'].ToInt64;
    if LService.GetById(LIDDespesa).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Despesa não existe!');

    if LService.Update(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure DeletarDespesa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIDDespesa : Int64;
  LService : TServiceDespesa;
begin
  LService := TServiceDespesa.Create(nil);
  try
    LIDDespesa := Req.Params.Items['idCliente'].ToInt64;
    if LService.GetById(LIDDespesa).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Despesa não existe!');

    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free
  end;
end;

procedure Registry;
begin
  THorse.Get('/despesas', ListarDespesa);
  THorse.Get('/despesas/:idDespesa', ObterDespesa);
  THorse.Post('/despesas', SalvarDespesa);
  THorse.Put('/despesas/:idDespesa', AlterarDespesa);
  THorse.Delete('/despesas/:idDespesa', DeletarDespesa);
end;

end.
