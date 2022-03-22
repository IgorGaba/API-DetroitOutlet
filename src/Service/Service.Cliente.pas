unit Service.Cliente;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.ConsoleUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.JSON,
  Provider.Conexao;

type
  TServiceCliente = class(TdmConexao)
    qryCliente: TFDQuery;
    qryClienteidCliente: TFDAutoIncField;
    qryClientenomeCliente: TStringField;
    qryClientetelefoneCliente: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListAll: TFDQuery;
    function GetById(const AID : Int64): TFDQuery;
    function Insert(const ACliente: TJSONObject): TFDQuery;
    function Delete: Boolean;
    function Update(const ACliente: TJSONObject) : Boolean;
  end;

var
  ServiceCliente: TServiceCliente;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServiceCliente }

uses
  DataSet.Serialize;

function TServiceCliente.Delete: Boolean;
begin
  qryCliente.Delete;
  Result := qryCliente.IsEmpty;
end;

function TServiceCliente.GetById(const AID: Int64): TFDQuery;
begin
  Result := qryCliente;
  qryCliente.SQL.Add('where idCliente = :idCliente');
  qryCliente.ParamByName('idCliente').AsLargeInt := AID;
  qryCliente.Open();
end;

function TServiceCliente.Insert(const ACliente: TJSONObject): TFDQuery;
begin
  Result := qryCliente;
  qryCliente.SQL.Add('where 1 <> 1');//abre dataset vazio, sem os registros
  qryCliente.Open();
  qryCliente.LoadFromJSON(ACliente, False); //recurso não nativo do delphi
end;

function TServiceCliente.ListAll: TFDQuery;
begin
  Result := qryCliente;
  qryCliente.Open();
end;

function TServiceCliente.Update(const ACliente: TJSONObject): Boolean;
begin
  qryCliente.MergeFromJSONObject(ACliente, False);//pega registro atual do dataset para atualizar
  Result := True;
end;

end.
