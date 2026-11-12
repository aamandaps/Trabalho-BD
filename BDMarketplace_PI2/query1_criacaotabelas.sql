USE Marketplace

CREATE TABLE cliente (
	cpf				VARCHAR(11)		NOT NULL,
	nome			VARCHAR(60)		NOT NULL,
	habilitacao		VARCHAR(20)		NOT NULL,
	telefone		CHAR(11)		NOT NULL,
	email			VARCHAR(20)		NOT NULL,
	enderecoID		INT				NOT NULL /*Chave estrangeira*/

	PRIMARY KEY(cpf))

CREATE TABLE endereco (
	id				INT				NOT NULL,
	logradouro		VARCHAR(200)	NOT NULL,
	complemento		VARCHAR(200)	NOT NULL,
	num				INT				NOT NULL,
	cep				CHAR(8)			NOT NULL

	PRIMARY KEY(id))

CREATE TABLE funcionario (
	cpf				VARCHAR(11)		NOT NULL,
	nome			VARCHAR(100)	NOT NULL,
	email			VARCHAR(20)		NOT NULL,

	PRIMARY KEY(cpf))

CREATE TABLE veiculo (
	chassi			CHAR(17)		NOT NULL,
	placa			VARCHAR(8)		NOT NULL,
	modelo			VARCHAR(20)		NOT NULL,
	cor				VARCHAR(20)		NOT NULL,
	ano				INT				NOT NULL,
	precoFIPE		DECIMAL(10,2)	NOT NULL,
	statusVeiculo	VARCHAR(60)		NOT NULL,
	id_grupo		INT				NOT NULL /*chave estrangeira*/
	
	PRIMARY KEY(chassi))

CREATE TABLE grupoVeiculo (
	id				INT				NOT NULL,
	tipo			VARCHAR			NOT NULL,
	preco_diaria	DECIMAL(10,2)	NOT NULL

	PRIMARY KEY(id))

CREATE TABLE reserva (
	id				INT				NOT NULL,
	dt_retirada		DATETIME		NOT NULL,
	dt_devolucao	DATETIME		NOT NULL,
	valor_total		DECIMAL(10,2)	NOT NULL,
	statusReserva	VARCHAR(20)		NOT NULL,
	/*chaves estrangeiras*/
	clienteID		VARCHAR(11)		NOT NULL,
	grupoID			INT				NOT NULL,
	veiculoID		VARCHAR(17)		NOT NULL,
	protecaoID		INT				NOT NULL

	PRIMARY KEY(id))

CREATE TABLE contrato (
	id				INT				NOT NULL,
	reservaID		INT				NOT NULL, /*chave estrangeira*/
	termos			VARCHAR(200)	NOT NULL,
	assinatura		VARCHAR(60)		NOT NULL,
	dtHora_Geracao	DATETIME		NOT NULL

	PRIMARY KEY(id))

CREATE TABLE locacao (
	id					INT				NOT NULL,
	dtHora_Retirada		DATETIME		NOT NULL,
	dtHoraDevolucao		DATETIME		NOT NULL,
	statusLocacao		VARCHAR(60)		NOT NULL,
	descricaoValores	VARCHAR(200)	NOT NULL,
	/*chaves estrangeiras*/
	reservaID			INT				NOT NULL,
	veiculoChassi		VARCHAR(17)		NOT NULL

	PRIMARY KEY(id))

CREATE TABLE protecao (
	id				INT				NOT NULL,
	nome			VARCHAR(60)		NOT NULL,
	descricao		VARCHAR(200)	NOT NULL,
	valorDiaria		DECIMAL(10,2)	NOT NULL

	PRIMARY KEY(id))

CREATE TABLE PAGAMENTO (
	id					INT				NOT NULL,
	reservaID			INT				NOT NULL,
	dtHora				DATETIME		NOT NULL,
	tipo				VARCHAR(20)		NOT NULL,
	statusPagamento		VARCHAR(20)		NOT NULL

	PRIMARY KEY(id))

CREATE TABLE inspecao (
	id				INT				NOT NULL,
	descricao		VARCHAR(200)	NOT NULL,
	relatorio		VARCHAR(200)	NOT NULL,
	locacaoID		INT				NOT NULL /*chave estrangeira*/

	PRIMARY KEY(id))

CREATE TABLE manutencao (
	id				INT				NOT NULL,
	dataManutencao	DATETIME		NOT NULL,
	descricao		VARCHAR(200)	NOT NULL,
	preco			DECIMAL(10,2)	NOT NULL,
	/*chaves estrangeiras*/
	veiculoChassi	VARCHAR(17)		NOT NULL,
	funcionarioID	VARCHAR(11)		NOT NULL

	PRIMARY KEY(id))