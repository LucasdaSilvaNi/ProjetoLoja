CREATE DATABASE ProjetoLoja
GO
USE ProjetoLoja
CREATE TABLE TipoPessoa (idTipoPessoa tinyint IDENTITY NOT NULL, descricao varchar(20) NOT NULL, PRIMARY KEY (idTipoPessoa));
CREATE TABLE StatusTransacao (idStatus int IDENTITY NOT NULL, descricao varchar(20) NOT NULL, PRIMARY KEY (idStatus));
CREATE TABLE TipoPagamento (idTipoPagamento tinyint IDENTITY NOT NULL, descricao varchar(15) NOT NULL, PRIMARY KEY (idTipoPagamento));
CREATE TABLE TipoEndereco (idTipoEndereco tinyint IDENTITY NOT NULL, descricao varchar(100) NOT NULL, PRIMARY KEY (idTipoEndereco));
CREATE TABLE Cidade (idCidade int IDENTITY NOT NULL, nome varchar(100) NOT NULL, PRIMARY KEY (idCidade));
CREATE TABLE PessoaJuridica (idPessoa int NOT NULL, CNPJ varchar(18) NOT NULL UNIQUE, nomeFantasia varchar(80) NOT NULL, razaoSocial varchar(80) NOT NULL, PRIMARY KEY (idPessoa));
CREATE TABLE PessoaFisica (idPessoa int NOT NULL, CPF varchar(14) NOT NULL UNIQUE, RG varchar(11) NOT NULL, PRIMARY KEY (idPessoa));
CREATE TABLE CaracteristicaProduto (idCaracteristica int IDENTITY NOT NULL, idProduto int NOT NULL, titulo varchar(80) NOT NULL, descricao text NOT NULL, PRIMARY KEY (idCaracteristica));
CREATE TABLE NotaFiscal (idTransacao int NOT NULL, numero varchar(100) NOT NULL, dataHora date NOT NULL, PRIMARY KEY (idTransacao));
CREATE TABLE ProdutoVigenciaPreco (idVigencia int NOT NULL, idProduto int NOT NULL, dataVigenciaInicio date NOT NULL, dataVigenciaFim date, preco float(10) NOT NULL, PRIMARY KEY (idVigencia, idProduto));
CREATE TABLE UnidadeFederativa (UF char(2) NOT NULL, nome varchar(100), PRIMARY KEY (UF));
CREATE TABLE Marca (idMarca int IDENTITY NOT NULL, descricao varchar(80) NOT NULL, PRIMARY KEY (idMarca));
CREATE TABLE Modelo (idModelo int IDENTITY NOT NULL, descricao varchar(80) NOT NULL, idMarca int NOT NULL, PRIMARY KEY (idModelo));
CREATE TABLE PagamentoCartao (idTransacao int NOT NULL, tipoCartao char(1) NOT NULL, numeroTransacao varchar(100) NOT NULL, qtdParcelas smallint NOT NULL, valorParcela money NOT NULL, PRIMARY KEY (idTransacao));
CREATE TABLE PagamentoAVista (idTransacao int NOT NULL, valorRecebido float(10) NOT NULL, idTipoPagamento tinyint NOT NULL, PRIMARY KEY (idTransacao));
CREATE TABLE Pagamento (idTransacao int NOT NULL, valorTotal float(10) NOT NULL, PRIMARY KEY (idTransacao));
CREATE TABLE TransacaoProduto (idTransacao int NOT NULL, idProduto int NOT NULL, qtdProduto int NOT NULL, valorUnitario money NOT NULL, PRIMARY KEY (idTransacao, idProduto));
CREATE TABLE TipoTransacao (idTipoTransacao tinyint IDENTITY NOT NULL, descricao varchar(10) NOT NULL, PRIMARY KEY (idTipoTransacao));
CREATE TABLE Transacao (idTransacao int IDENTITY NOT NULL, data date, desconto float(10), idTipoTransacao tinyint NOT NULL, idCliente int NOT NULL, idStatus int NOT NULL, idFuncionario int NOT NULL, PRIMARY KEY (idTransacao));
CREATE TABLE TipoUsuario (idTipoUsuario int IDENTITY NOT NULL, descricao varchar(60) NOT NULL, PRIMARY KEY (idTipoUsuario));
CREATE TABLE Usuario (idPessoa int NOT NULL, senha varchar(256) NOT NULL, idTipoUsuario int NOT NULL, PRIMARY KEY (idPessoa));
CREATE TABLE OrdemServico (idTransacao int NOT NULL, dataEntrada date NOT NULL, dataPrevistaEntrega date NOT NULL, dataEntrega date, descricao varchar(100) NOT NULL, valor real, PRIMARY KEY (idTransacao));
CREATE TABLE ImagemProduto (idAlbumFoto int IDENTITY NOT NULL, caminho varchar(100) NOT NULL, idProduto int NOT NULL, PRIMARY KEY (idAlbumFoto));
CREATE TABLE Produto (idProduto int IDENTITY NOT NULL, idMarcaProduto int NOT NULL, nome varchar(100) NOT NULL, descricao varchar(255) NOT NULL, qtdMinima int NOT NULL, qtdAtual int NOT NULL, idModelo int NOT NULL, PRIMARY KEY (idProduto));
CREATE TABLE Endereco (idEndereco int NOT NULL, idPessoa int NOT NULL, logradouro varchar(80) NOT NULL, numero int NOT NULL, complemento varchar(100), referencia varchar(50), bairro varchar(80) NOT NULL, UF char(2) NOT NULL, idCidade int NOT NULL, CEP varchar(10) NOT NULL, idTipoEndereco tinyint NOT NULL, PRIMARY KEY (idEndereco, idPessoa));
CREATE TABLE TipoTelefone (idTipoTelefone tinyint IDENTITY NOT NULL, descricao varchar(20) NOT NULL, PRIMARY KEY (idTipoTelefone));
CREATE TABLE Telefone (idTelefone int IDENTITY NOT NULL, numero varchar(15) NOT NULL, idPessoa int NOT NULL, idTipoTelefone tinyint NOT NULL, PRIMARY KEY (idTelefone));
CREATE TABLE Pessoa (idPessoa int IDENTITY NOT NULL, nome varchar(80) NOT NULL, email varchar(150), idTipoPessoa tinyint NOT NULL, PRIMARY KEY (idPessoa));
ALTER TABLE Pessoa ADD CONSTRAINT FKPessoa328913 FOREIGN KEY (idTipoPessoa) REFERENCES TipoPessoa (idTipoPessoa);
ALTER TABLE Produto ADD CONSTRAINT FKProduto379653 FOREIGN KEY (idModelo) REFERENCES Modelo (idModelo);
ALTER TABLE CaracteristicaProduto ADD CONSTRAINT FKCaracteris858294 FOREIGN KEY (idProduto) REFERENCES Produto (idProduto);
ALTER TABLE Endereco ADD CONSTRAINT FKEndereco362332 FOREIGN KEY (idCidade) REFERENCES Cidade (idCidade);
ALTER TABLE Endereco ADD CONSTRAINT FKEndereco263487 FOREIGN KEY (idTipoEndereco) REFERENCES TipoEndereco (idTipoEndereco);
ALTER TABLE OrdemServico ADD CONSTRAINT FKOrdemServi748459 FOREIGN KEY (idTransacao) REFERENCES Transacao (idTransacao);
ALTER TABLE PagamentoAVista ADD CONSTRAINT FKPagamentoA750421 FOREIGN KEY (idTipoPagamento) REFERENCES TipoPagamento (idTipoPagamento);
ALTER TABLE Transacao ADD CONSTRAINT FKTransacao547363 FOREIGN KEY (idStatus) REFERENCES StatusTransacao (idStatus);
ALTER TABLE PessoaFisica ADD CONSTRAINT FKPessoaFisi179779 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE PessoaJuridica ADD CONSTRAINT FKPessoaJuri138880 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE Modelo ADD CONSTRAINT FKModelo452020 FOREIGN KEY (idMarca) REFERENCES Marca (idMarca);
ALTER TABLE Endereco ADD CONSTRAINT FKEndereco335589 FOREIGN KEY (UF) REFERENCES UnidadeFederativa (UF);
ALTER TABLE Usuario ADD CONSTRAINT FKUsuario624817 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE ProdutoVigenciaPreco ADD CONSTRAINT FKProdutoVig90587 FOREIGN KEY (idProduto) REFERENCES Produto (idProduto);
ALTER TABLE Pagamento ADD CONSTRAINT FKPagamento323132 FOREIGN KEY (idTransacao) REFERENCES Transacao (idTransacao);
ALTER TABLE NotaFiscal ADD CONSTRAINT FKNotaFiscal277307 FOREIGN KEY (idTransacao) REFERENCES Transacao (idTransacao);
ALTER TABLE PagamentoAVista ADD CONSTRAINT FKPagamentoA869264 FOREIGN KEY (idTransacao) REFERENCES Pagamento (idTransacao);
ALTER TABLE PagamentoCartao ADD CONSTRAINT FKPagamentoC183659 FOREIGN KEY (idTransacao) REFERENCES Pagamento (idTransacao);
ALTER TABLE Telefone ADD CONSTRAINT FKTelefone476788 FOREIGN KEY (idTipoTelefone) REFERENCES TipoTelefone (idTipoTelefone);
ALTER TABLE Telefone ADD CONSTRAINT FKTelefone320442 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE Endereco ADD CONSTRAINT FKEndereco760014 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE ImagemProduto ADD CONSTRAINT FKImagemProd470431 FOREIGN KEY (idProduto) REFERENCES Produto (idProduto);
ALTER TABLE Usuario ADD CONSTRAINT FKUsuario557876 FOREIGN KEY (idTipoUsuario) REFERENCES TipoUsuario (idTipoUsuario);
ALTER TABLE Transacao ADD CONSTRAINT FKTransacao266380 FOREIGN KEY (idTipoTransacao) REFERENCES TipoTransacao (idTipoTransacao);
ALTER TABLE Transacao ADD CONSTRAINT FKTransacao806039 FOREIGN KEY (idCliente) REFERENCES Pessoa (idPessoa);
ALTER TABLE Transacao ADD CONSTRAINT FKTransacao803746 FOREIGN KEY (idFuncionario) REFERENCES Pessoa (idPessoa);
ALTER TABLE TransacaoProduto ADD CONSTRAINT FKTransacaoP922972 FOREIGN KEY (idProduto) REFERENCES Produto (idProduto);
ALTER TABLE TransacaoProduto ADD CONSTRAINT FKTransacaoP933760 FOREIGN KEY (idTransacao) REFERENCES Transacao (idTransacao);
