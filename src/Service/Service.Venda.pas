unit Service.Venda;

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
  TServiceVenda = class(TdmConexao)
    qryVenda: TFDQuery;
    qryVendaidVenda: TFDAutoIncField;
    qryVendadescricao: TStringField;
    qryVendavalorTotal: TBCDField;
    qryVendadataVenda: TStringField;
    qryVendaidClienteVenda: TIntegerField;
    qryVendaidMovimentacaoVenda: TIntegerField;
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
  ServiceVenda: TServiceVenda;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServiceVenda }

uses
  DataSet.Serialize;

function TServiceVenda.Delete: Boolean;
begin
  qryVenda.Delete;
  Result := qryVenda.IsEmpty;
end;

function TServiceVenda.GetById(const AID: Int64): TFDQuery;
begin
  Result := qryVenda;
  qryVenda.SQL.Add('where idVenda = :idVenda');
  qryVenda.ParamByName('idVenda').AsLargeInt := AID;
  qryVenda.Open();
end;

function TServiceVenda.Insert(const AProduto: TJSONObject): TFDQuery;
begin
  Result := qryVenda;
  qryVenda.SQL.Add('where 1 <> 1');
  qryVenda.Open();
  qryVenda.LoadFromJSON(AProduto, False);
end;

function TServiceVenda.ListAll: TFDQuery;
begin
  Result := qryVenda;
  qryVenda.Open();
end;

function TServiceVenda.Update(const AProduto: TJSONObject): Boolean;
begin
  qryVenda.MergeFromJSONObject(AProduto, False);
  Result := True;
end;

end.
