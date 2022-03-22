unit Service.Produto;

interface

uses
  System.SysUtils,
  System.Classes,
  Provider.Conexao,
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
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.JSON;

type
  TServiceProduto = class(TdmConexao)
    qryProduto: TFDQuery;
    qryProdutoidProduto: TFDAutoIncField;
    qryProdutomarcaProduto: TStringField;
    qryProdutomodeloProduto: TStringField;
    qryProdutocategoriaProduto: TStringField;
    qryProdutofornecedorProduto: TStringField;
    qryProdutoprecoUnitarioProduto: TBCDField;
    qryProdutoprecoAtacadoProduto: TBCDField;
    qryProdutoquantidadeNum30: TIntegerField;
    qryProdutoquantidadeNum31: TIntegerField;
    qryProdutoquantidadeNum32: TIntegerField;
    qryProdutoquantidadeNum33: TIntegerField;
    qryProdutoquantidadeNum34: TIntegerField;
    qryProdutoquantidadeNum35: TIntegerField;
    qryProdutoquantidadeNum36: TIntegerField;
    qryProdutoquantidadeNum37: TIntegerField;
    qryProdutoquantidadeNum38: TIntegerField;
    qryProdutoquantidadeNum39: TIntegerField;
    qryProdutoquantidadeNum40: TIntegerField;
    qryProdutoquantidadeNum41: TIntegerField;
    qryProdutoquantidadeNum42: TIntegerField;
    qryProdutoquantidadeNum43: TIntegerField;
    qryProdutoquantidadeNum44: TIntegerField;
    qryProdutoquantidadeNum45: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListAll: TFDQuery;
    function GetById(const AID : Int64): TFDQuery;
    function Insert(const AProduto: TJSONObject): TFDQuery;
    function Delete: Boolean;
    function Update(const AProduto: TJSONObject) : Boolean;
  end;

var
  ServiceProduto: TServiceProduto;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServiceProduto }

uses
  DataSet.Serialize;

function TServiceProduto.Delete: Boolean;
begin
  qryProduto.Delete;
  Result := qryProduto.IsEmpty;
end;

function TServiceProduto.GetById(const AID: Int64): TFDQuery;
begin
  Result := qryProduto;
  qryProduto.SQL.Add('where idProduto = :idProduto');
  qryProduto.ParamByName('idProduto').AsLargeInt := AID;
  qryProduto.Open();
end;

function TServiceProduto.Insert(const AProduto: TJSONObject): TFDQuery;
begin
  Result := qryProduto;
  qryProduto.SQL.Add('where 1 <> 1');
  qryProduto.Open();
  qryProduto.LoadFromJSON(AProduto, False);
end;

function TServiceProduto.ListAll: TFDQuery;
begin
  Result := qryProduto;
  qryProduto.Open();
end;

function TServiceProduto.Update(const AProduto: TJSONObject): Boolean;
begin
  qryProduto.MergeFromJSONObject(AProduto, False);//pega registro atual do dataset para atualizar
  Result := True;
end;

end.
