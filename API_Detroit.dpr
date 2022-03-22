program API_Detroit;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.BasicAuthentication,
  System.SysUtils,
  Provider.Conexao in 'src\Provider\Provider.Conexao.pas' {dmConexao: TDataModule},
  Service.Cliente in 'src\Service\Service.Cliente.pas' {ServiceCliente: TDataModule},
  Controller.Cliente in 'src\Controller\Controller.Cliente.pas',
  Service.Movimentacao in 'src\Service\Service.Movimentacao.pas' {ServiceMovimentacao: TDataModule},
  Service.Venda in 'src\Service\Service.Venda.pas' {ServiceVenda: TDataModule},
  Service.Despesa in 'src\Service\Service.Despesa.pas' {ServiceDespesa: TDataModule},
  Service.Produto in 'src\Service\Service.Produto.pas' {ServiceProduto: TDataModule},
  Service.VendaProduto in 'src\Service\Service.VendaProduto.pas' {ServiceVendaProduto: TDataModule},
  Service.Numeracao in 'src\Service\Service.Numeracao.pas' {ServiceNumeracao: TDataModule},
  Controller.Despesa in 'src\Controller\Controller.Despesa.pas',
  Controller.Movimentacao in 'src\Controller\Controller.Movimentacao.pas',
  Controller.Numeracao in 'src\Controller\Controller.Numeracao.pas',
  Controller.Produto in 'src\Controller\Controller.Produto.pas',
  Controller.Venda in 'src\Controller\Controller.Venda.pas',
  Controller.VendaProduto in 'src\Controller\Controller.VendaProduto.pas';

begin
  THorse
    .Use(Jhonson())
    .Use(HandleException)
    .Use(HorseBasicAuthentication(
      function(const aUsername, aPassword: string): Boolean
      begin
        Result := aUsername.Equals('detroit') and aPassword.Equals('outlet');
      end));

  Controller.Cliente.Registry;
  Controller.Despesa.Registry;
  Controller.Movimentacao.Registry;
  Controller.Numeracao.Registry;
  Controller.Produto.Registry;
  Controller.Venda.Registry;
  Controller.VendaProduto.Registry;

  THorse.Listen(9000);
end.
