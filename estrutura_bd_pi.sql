CREATE DATABASE pi;
USE pi;

CREATE TABLE CLIENTE(
ID_PESSOA INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
EMAIL VARCHAR(55) NOT NULL,
SENHA VARCHAR(12) NOT NULL,
NOME_CPLT VARCHAR(50) NOT NULL,
CPF_PESSOA VARCHAR(11) NOT NULL,
TELEFONE VARCHAR(11),
PRIMARY KEY(ID_PESSOA)
);

CREATE TABLE ENDERECOCLIENTE(
ID_ENDERECO INTEGER UNSIGNED NOT NULL PRIMARY KEY auto_increment,
ID_PESSOA INTEGER UNSIGNED,
ESTADO VARCHAR(30) NOT NULL,
CIDADE VARCHAR(50) NOT NULL,
RUA VARCHAR(50) NOT NULL,
BAIRRO VARCHAR(50) NOT NULL,
CEP VARCHAR(8) NOT NULL,
NUMERO_CASA VARCHAR(10) NOT NULL,
COMPLEMENTO VARCHAR(100),

CONSTRAINT FOREIGN KEY (ID_PESSOA) REFERENCES CLIENTE(ID_PESSOA)
);

CREATE TABLE CARTAO(
ID_CARTAO INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
N_CARTAO VARCHAR(20),
DT_VALIDADE VARCHAR(9),
NOME_CARTAO VARCHAR(100),
CVV VARCHAR(3),
ID_PESSOA INTEGER UNSIGNED,
CONSTRAINT FOREIGN KEY (ID_PESSOA) REFERENCES CLIENTE(ID_PESSOA)
);

CREATE TABLE PRODUTO(
ID_PRODUTO INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
NOME_PRODUTO VARCHAR(100) NOT NULL,
MODELO VARCHAR(100),
ESPECIFICACOES TEXT,
VALOR DOUBLE (6,2) not null,
CATEGORIA VARCHAR(50)
);

CREATE TABLE PEDIDO(
N_PEDIDO INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
ID_PESSOA INTEGER UNSIGNED NOT NULL, -- usar select dentro do insert into para inserir o mesmo id
ID_PRODUTO INTEGER UNSIGNED NOT NULL, -- usar select dentro do insert into para inserir o mesmo id
DT_PEDIDO DATE,
STATUS_PEDIDO VARCHAR(50),
STATUS_ENTREGA VARCHAR(50),
CONSTRAINT FOREIGN KEY (ID_PESSOA) REFERENCES CLIENTE(ID_PESSOA),
CONSTRAINT FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO)
);

CREATE TABLE LOGIN(
	USER_NAME VARCHAR(55) NOT NULL,
    SENHA VARCHAR(12) NOT NULL,
    TIPO_USER VARCHAR(10) NOT NULL,
    
    PRIMARY KEY(USER_NAME)
);

-- drop database pi;

select * from cliente;
select * from enderecocliente;
select * from cartao;
select * from produto;
select * from pedido;
SELECT A.*, B.*, C.* FROM CLIENTE AS A 
LEFT JOIN ENDERECOCLIENTE AS B ON A.ID_PESSOA = B.ID_PESSOA
LEFT JOIN CARTAO AS C ON A.ID_PESSOA = C.ID_PESSOA;

select * from produto where categoria = "Performace";
select * from produto where id_produto = 2;





INSERT INTO PRODUTO(NOME_PRODUTO, VALOR, CATEGORIA) VALUES('fueltech', 150.55, 'Performace');
INSERT INTO PRODUTO(NOME_PRODUTO, VALOR, CATEGORIA) VALUES('Coletor', 192.55, 'Performace');
INSERT INTO PRODUTO(NOME_PRODUTO, VALOR, CATEGORIA) VALUES('kit turbo', 545.55, 'Performace');

-- TESTES INSERT
-- INSERT INTO PEDIDO (ID_PESSOA, ID_PRODUTO) VALUES ((SELECT ID_PESSOA FROM TB_CAD_PESSOA WHERE ID_PESSOA = 1), ((SELECT ID_PRODUTO FROM PRODUTO)) );
-- SELECT * FROM PEDIDO

-- INSERT INTO TB_CAD_PESSOA(EMAIL, SENHA, NOME_CPLT, CPF_PESSOA) 
-- VALUES ('thiago2510silva@outlook.com', 'saveiro', 'Thiago de Souza Silva', 44984547820),
-- ('marcosvinicius@outlook.com', 'twister', 'Marcos Vinicius', 12345678);
-- INSERT INTO TB_CAD_ENDERECO (RUA, BAIRRO, UF, CEP, NUMERO_CASA) 
-- VALUES ('RUA DO ENSINO', 'JARDIM ALTO ALEGRE', 'SP', 08381680, 500),
-- ('RAGUEB CHOFI', 'JARDIM IGUATEMY', 'SP', 063254123, 494);



-- SELECT * FROM TB_CAD_PESSOA;
-- SELECT * FROM TB_CAD_ENDERECO;