unit Service.VendaProduto;

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
  FireDAC.Comp.Client,
  System.JSON;

type
  TServiceVendaProduto = class(TdmConexao)
    qryVendaProduto: TFDQuery;
    qryVendaProdutoidVendaProduto: TFDAutoIncField;
    qryVendaProdutofkIdProduto: TIntegerField;
    qryVendaProdutofkIdVenda: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListAll: TFDQuery;
    function GetById(const AID : Int64): TFDQuery;
    function Insert(const AVendaProduto: TJSONObject): TFDQuery;
    function Delete: Boolean;
    function Update(const AVendaProduto: TJSONObject) : Boolean;
  end;

var
  ServiceVendaProduto: TServiceVendaProduto;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServiceVendaProduto }

uses
  DataSet.Serialize;

function TServiceVendaProduto.Delete: Boolean;
begin
  qryVendaProduto.Delete;
  Result := qryVendaProduto.IsEmpty;
end;

function TServiceVendaProduto.GetById(const AID: Int64): TFDQuery;
begin
  Result := qryVendaProduto;
  qryVendaProduto.SQL.Add('where idVendaProduto = :idVendaProduto');
  qryVendaProduto.ParamByName('idVendaProduto').AsLargeInt := AID;
  qryVendaProduto.Open();
end;

function TServiceVendaProduto.Insert(
  const AVendaProduto: TJSONObject): TFDQuery;
begin
  Result := qryVendaProduto;
  qryVendaProduto.SQL.Add('where 1 <> 1');
  qryVendaProduto.Open();
  qryVendaProduto.LoadFromJSON(AVendaProduto, False);
end;

function TServiceVendaProduto.ListAll: TFDQuery;
begin
  Result := qryVendaProduto;
  qryVendaProduto.Open();
end;

function TServiceVendaProduto.Update(const AVendaProduto: TJSONObject): Boolean;
begin
  qryVendaProduto.MergeFromJSONObject(AVendaProduto, False);
  Result := True;
end;

end.
