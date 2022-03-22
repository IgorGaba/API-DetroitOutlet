unit Service.Despesa;

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
  TServiceDespesa = class(TdmConexao)
    qryDespesa: TFDQuery;
    qryDespesaidDespesa: TFDAutoIncField;
    qryDespesadescricaoDespesa: TStringField;
    qryDespesavalor: TBCDField;
    qryDespesaidMovimentacaoDespesa: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListAll: TFDQuery;
    function GetById(const AID : Int64): TFDQuery;
    function Insert(const ADespesa: TJSONObject): TFDQuery;
    function Delete: Boolean;
    function Update(const ADespesa: TJSONObject) : Boolean;
  end;

var
  ServiceDespesa: TServiceDespesa;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServiceDespesa }

uses
  DataSet.Serialize;

function TServiceDespesa.Delete: Boolean;
begin
  qryDespesa.Delete;
  Result := qryDespesa.IsEmpty;
end;

function TServiceDespesa.GetById(const AID: Int64): TFDQuery;
begin
  Result := qryDespesa;
  qryDespesa.SQL.Add('where idDespesa = :idDespesa');
  qryDespesa.ParamByName('idDespesa').AsLargeInt := AID;
  qryDespesa.Open();
end;

function TServiceDespesa.Insert(const ADespesa: TJSONObject): TFDQuery;
begin
  Result := qryDespesa;
  qryDespesa.SQL.Add('where 1 <> 1');
  qryDespesa.Open();
  qryDespesa.LoadFromJSON(ADespesa, False);
end;

function TServiceDespesa.ListAll: TFDQuery;
begin
  Result := qryDespesa;
  qryDespesa.Open();
end;

function TServiceDespesa.Update(const ADespesa: TJSONObject): Boolean;
begin
  qryDespesa.MergeFromJSONObject(ADespesa, False);
  Result := True;
end;

end.
