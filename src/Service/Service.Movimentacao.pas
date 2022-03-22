unit Service.Movimentacao;

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
  TServiceMovimentacao = class(TdmConexao)
    qryMovimentacao: TFDQuery;
    qryMovimentacaoidMovimentacao: TFDAutoIncField;
    qryMovimentacaodataMovimentacao: TStringField;
    qryMovimentacaocaixaTotal: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListAll: TFDQuery;
    function GetById(const AID : String): TFDQuery;
    function Insert(const AMovimentacao: TJSONObject): TFDQuery;
    function Delete: Boolean;
    function Update(const AMovimentacao: TJSONObject) : Boolean;
  end;

var
  ServiceMovimentacao: TServiceMovimentacao;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServiceMovimentacao }

uses
  DataSet.Serialize;

function TServiceMovimentacao.Delete: Boolean;
begin
  qryMovimentacao.Delete;
  Result := qryMovimentacao.IsEmpty;
end;

function TServiceMovimentacao.GetById(const AID: String): TFDQuery;
begin
  Result := qryMovimentacao;
  qryMovimentacao.SQL.Add('where idMovimentacao = :idMovimentacao');
  qryMovimentacao.ParamByName('idMovimentacao').AsString := AID;
  qryMovimentacao.Open();
end;

function TServiceMovimentacao.Insert(
  const AMovimentacao: TJSONObject): TFDQuery;
begin
  Result := qryMovimentacao;
  qryMovimentacao.SQL.Add('where 1 <> 1');
  qryMovimentacao.Open();
  qryMovimentacao.LoadFromJSON(AMovimentacao, False);
end;

function TServiceMovimentacao.ListAll: TFDQuery;
begin
  Result := qryMovimentacao;
  qryMovimentacao.Open();
end;

function TServiceMovimentacao.Update(const AMovimentacao: TJSONObject): Boolean;
begin
  qryMovimentacao.MergeFromJSONObject(AMovimentacao, False);
  Result := True;
end;

end.
