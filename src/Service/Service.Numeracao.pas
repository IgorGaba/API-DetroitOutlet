unit Service.Numeracao;

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
  TServiceNumeracao = class(TdmConexao)
    qryNumeracao: TFDQuery;
    qryNumeracaoidNumeracao: TFDAutoIncField;
    qryNumeracaoquantidade: TIntegerField;
    qryNumeracaotamanho: TIntegerField;
    qryNumeracaoidProdutoNumeracao: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListAll: TFDQuery;
    function GetById(const AID : Int64): TFDQuery;
    function Insert(const ANumeracao: TJSONObject): TFDQuery;
    function Delete: Boolean;
    function Update(const ANumeracao: TJSONObject) : Boolean;
  end;

var
  ServiceNumeracao: TServiceNumeracao;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServiceNumeracao }

uses
  DataSet.Serialize;

function TServiceNumeracao.Delete: Boolean;
begin
  qryNumeracao.Delete;
  Result := qryNumeracao.IsEmpty;
end;

function TServiceNumeracao.GetById(const AID: Int64): TFDQuery;
begin
  Result := qryNumeracao;
  qryNumeracao.SQL.Add('where idNumeracao = :idNumeracao');
  qryNumeracao.ParamByName('idNumeracao').AsLargeInt := AID;
  qryNumeracao.Open();
end;

function TServiceNumeracao.Insert(const ANumeracao: TJSONObject): TFDQuery;
begin
  Result := qryNumeracao;
  qryNumeracao.SQL.Add('where 1 <> 1');
  qryNumeracao.Open();
  qryNumeracao.LoadFromJSON(ANumeracao, False);
end;

function TServiceNumeracao.ListAll: TFDQuery;
begin
  Result := qryNumeracao;
  qryNumeracao.Open();
end;

function TServiceNumeracao.Update(const ANumeracao: TJSONObject): Boolean;
begin
  qryNumeracao.MergeFromJSONObject(ANumeracao, False);
  Result := True;
end;

end.
