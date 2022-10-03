
/* script loja de bebidas */

DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco
CREATE DATABASE aula_banco;         -- criar aula_banco
USE aula_banco;                     -- selecionar aula_banco

CREATE TABLE estado(                -- criando a tabela estado
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE  
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT pk_estado PRIMARY KEY (id)  
);

CREATE TABLE cidade (               -- criando a tabela cidade
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
); 

CREATE TABLE cliente (               -- criando a tabela cliente
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,cpf_cnpj VARCHAR(18) NOT NULL 
,cidade_id INT NOT NULL 
,CONSTRAINT pk_cliente PRIMARY KEY (id)
,CONSTRAINT fk_cliente_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (id)
);

CREATE TABLE funcionario (               -- criando a tabela funcionario
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,cpf VARCHAR(14) NOT NULL 
,cidade_id INT NOT NULL 
,CONSTRAINT pk_funcionario PRIMARY KEY (id)
,CONSTRAINT fk_funcionario_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (id)
); 

CREATE TABLE categoria (               -- criando a tabela categoria
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,descricao VARCHAR(200)  
,CONSTRAINT pk_categoira PRIMARY KEY (id)
);

CREATE TABLE unidade_medida(
id INT NOT NULL auto_increment
,nome VARCHAR(100) NOT NULL 
,sigla VARCHAR(10) NOT NULL UNIQUE
,ativo CHAR DEFAULT 'A' NOT NULL
,data_cadasstro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
,CONSTRAINT pk_unidade_medida PRIMARY KEY (id)
);

CREATE TABLE marca(
id INT NOT NULL auto_increment
,nome VARCHAR(100) NOT NULL 
,descricao VARCHAR(100)
,ativo CHAR DEFAULT 'A' NOT NULL
,data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
,CONSTRAINT pk_marca PRIMARY KEY (id)
);

CREATE TABLE produto( 
id INT NOT NULL auto_increment
,nome VARCHAR(100) NOT NULL 
,descricao VARCHAR(2000) 
,conteudo DECIMAL(15,2)
,unidade INT
,preco_custo DECIMAL(12,2) NOT NULL 
,preco_venda DECIMAL(12,2) NOT NULL 
,ativo CHAR DEFAULT 'A' NOT NULL
,data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL 
,estoque INT DEFAULT 0 NOT NULL 
,controla_lote CHAR NOT NULL
,unidade_medida_id INT NOT NULL
,marca_id INT NOT NULL
,CONSTRAINT produto_id PRIMARY KEY (id)
,CONSTRAINT fk_produto_unidade_medida FOREIGN KEY (unidade_medida_id) REFERENCES unidade_medida(id)
,CONSTRAINT fk_marca FOREIGN KEY (marca_id) REFERENCES marca (id)
);

CREATE TABLE venda (               -- criando a tabela venda
id INT NOT NULL AUTO_INCREMENT
,data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,funcionario_id INT NOT NULL 
,cliente_id INT NOT NULL 
,CONSTRAINT pk_venda PRIMARY KEY (id)
,CONSTRAINT fk_venda_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionario (id) 
,CONSTRAINT fk_venda_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id)
); 

CREATE TABLE item_venda  (               -- criando a tabela item_venda
produto_id INT NOT NULL  
,venda_id INT NOT NULL  
,quantidade INT NOT NULL  
,preco_unidade DECIMAL(14,2) NOT NULL 
,CONSTRAINT fk_item_venda_produto FOREIGN KEY (produto_id) REFERENCES produto (id) 
,CONSTRAINT fk_item_venda_venda FOREIGN KEY (venda_id) REFERENCES venda (id) 
); 

INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PARANÁ','PR','S','2015-2-25');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SÃO PAULO','SP','S','2015-10-31');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('MATO GROSSO','MT','N','2015-12-02');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SANTA CATARINA','SC','S','2016-08-13');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO GRANDE DO SUL','RS','N','2016-08-30');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('ACRE','AC','N','2017-01-22');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('TOCANTINS','TO','S','2018-03-01');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('ALAGOAS','AL','N','2018-04-25');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SERGIPE','SE','N','2019-03-12');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PARÁ','PA','S','2019-03-15');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RORAIMA','RO','S','2019-04-04');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('DISTRITO FEDERAL','DF','N','2019-10-26');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('BAHIA','BA','N','2020-4-03');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PIAUÍ','PI','S','2020-6-13');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('ESPÍRITO SANTO','ES','N','2020-6-15');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO DE JANEIRO','RJ','S','2020-7-18');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('MARANHÃO','MA','S','2020-8-22');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('CEARÁ','CE','S','2020-9-16');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO GRANDE DO NORTE','RN','N','2020-9-20');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('GOIÁS','GO','S','2020-10-19');

-- inserindo cidades
INSERT INTO cidade (nome, estado_id) VALUES ('BAURU',2);
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('GUARULHOS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('CAMPINAS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('FLORIANÓPOLIS',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PARANAVAÍ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CUIABA',3);
INSERT INTO cidade (nome, estado_id) VALUES ('BALNEÁRIO CAMBORIÚ',4);
INSERT INTO cidade (nome, estado_id) VALUES ('LONDRINA',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CASCAVEL',1);
INSERT INTO cidade (nome, estado_id) VALUES ('JOINVILLE',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PORTO ALEGRE',5);
INSERT INTO cidade (nome, estado_id) VALUES ('BLUMENAL',4);
INSERT INTO cidade (nome, estado_id) VALUES ('BARRA DOS GARÇAS',3);
INSERT INTO cidade (nome, estado_id) VALUES ('CHAPECÓ',4);
INSERT INTO cidade (nome, estado_id) VALUES ('ITAJAÍ',4);

-- inserindo cidades
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Tomás Costa',				'940.432.928-21'	,12);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Arthur Carvalho',			'384.005.249-18'	,12);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Nicolash Gomes',			'885.308.584-33'	,12);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Ryan Cunha',				'973.372.786-59'	,12);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Vinícius Castro',			'116.330.860-97'	,3);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Rafaela Azevedo',			'396.517.755-99'	,3);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Vitória Rodrigues',		'504.274.885-75'	,3);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Marisa Rocha',				'958.761.683-94'	,3);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Danilo Araujo',			'953.035.474-69'	,3);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Leonor Alves',				'334.295.054-45'	,3);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Laura Pinto',				'317.326.283-27'	,3);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Leonardo Goncalves',		'948.212.210-04'	,3);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Júlio Costa',				'858.771.807-03'	,3);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Vitor Ribeiro',			'196.716.916-09'	,11);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Gustavo Barbosa',			'135.960.821-45'	,11);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Vinicius Oliveira',		'286.813.463-77'	,11);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Ana Goncalves',			'794.746.269-01'	,11);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Pedro Souza',				'581.002.462-97'	,11);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Pedro Castro',				'376.230.665-60'	,11);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Vitór Souza',				'472.210.368-29'	,11);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Vinicius Ferreira',		'887.964.103-45'	,8);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Felipe Correia',			'436.760.190-08'	,8);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Brenda Ribeiro',			'125.867.084-40'	,8);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Erick Cavalcanti',			'639.940.057-01'	,1);			
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Leila Carvalho',			'172.293.261-92'	,9);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Camila Cunha',				'390.929.064-76'	,9);				
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Luís Cunha',				'712.330.160-91'	,9);				
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Tomás Carvalho',			'396.486.099-93'	,9);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Joao Melo',				'305.574.649-00'	,9);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Júlio Cavalcanti',			'221.733.190-60'	,10);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Vitor Cunha',				'871.323.887-62'	,10);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('André Cunha',				'220.699.267-10'	,10);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Leonor Santos',			'759.797.153-20'	,10);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Caio Fernandes',			'400.050.083-01'	,10);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Murilo Pereira',			'145.545.560-18'	,10);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Kauã Fernandes',			'613.470.992-12'	,16);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Julian Pinto',				'546.598.390-60'	,16);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Ana Melo',					'836.767.043-47'	,16);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Davi Rocha',				'352.301.191-44'	,16);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Gabriel Costa',			'135.852.144-10'	,16);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Luana Cavalcanti',			'322.366.587-02'	,16);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Raissa Almeida',			'662.905.589-60'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Júlia Barros',				'510.737.257-07'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('João Barros',				'865.210.504-94'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Igor Dias',				'517.621.544-63'	,7);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Felipe Silva',				'607.290.437-89'	,7);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Anna Gomes',				'741.557.041-37'	,7);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Fábio Castro',				'187.271.972-47'	,7);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Carla Costa',				'720.658.466-74'	,14);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Carla Pereira'	,			'777.603.174-76'	,14);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Nicolas Goncalves'	,		'543.793.784-97'	,14);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('André Costa'	,			'318.134.252-13'	,14);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Estevan Dias'	,			'337.432.098-88'	,6);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Emily Ferreira'	,		'122.435.596-25'	,6);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Marina Santos'	,			'443.386.823-02'	,6);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Júlia Rocha'	,			'566.550.578-17'	,6);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Gabriela Costa'	,		'220.878.782-00'	,6);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Miguel Oliveira'	,		'510.889.112-18'	,6);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Rodrigo Almeida'	,		'268.743.192-30'	,6);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Beatriz Sousa'	,			'721.232.580-59'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Tiago Ferreira'	,		'533.522.136-40'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Sophia Lima'	,			'321.109.923-95'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Erick Barros'	,			'425.514.611-03'	,4);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Fábio Pereira'	,			'659.602.749-06'	,4);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Nicolash Lima'	,			'891.331.171-28'	,4);	
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Victor Correia'	,		'255.888.661-42'	,4);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Thiago Rocha'	,			'791.076.815-00'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Lucas Lima'	,			'611.473.403-31'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Giovanna Pinto'	,		'356.548.280-02'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Matilde Rodrigues'	,		'736.682.044-03'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Estevan Rocha'	,			'849.118.473-28'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Estevan Costa'	,			'560.659.635-00'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Rodrigo Cunha'	,			'834.368.600-42'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Diego Araujo'	,			'832.265.270-45'	,5);		
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Luana Barros'	,			'415.504.573-73'	,5);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Enzo Azevedo'	,			'609.018.702-00'	,5);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Alex Dias'	,				'762.870.607-00'	,5);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Ryan Silva'	,			'323.709.423-47'	,5);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Maria Souza'	,			'852.760.245-88'	,15);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('José Alves'	,			'997.635.630-70'	,15);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Luan Cunha'	,			'333.564.942-79'	,15);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Arthur Santos'	,			'546.445.692-91'	,15);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Eduardo Cavalcanti'	,	'307.876.730-21'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Nicole Ferreira'	,		'873.063.300-12'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Samuel Cunha'	,			'835.469.756-85'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Diego Barbosa'	,			'570.806.933-30'	,1);
INSERT INTO cliente (nome	,cpf_cnpj	,cidade_id) VALUES ('Igor Oliveira'	,			'708.982.040-89'	,1);

INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Davi Rodrigues',				'151.338.392-27',6);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Júlia Alves',					'515.364.390-53',7);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('André Cunha',					'120.240.316-68',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Larissa Azevedo',				'696.166.620-58',9);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Gabrielle Azevedo',			'766.688.211-46',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Antônio Gomes',				'551.067.304-49',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Ryan Gomes',					'159.148.559-26',9);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Clara Azevedo',				'831.225.623-75',8);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Diego Rodrigues',				'824.450.808-60',9);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Mariana Alves',				'470.755.667-17',8);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Ágatha Ferreira',				'556.688.641-89',7);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Luís Castro',					'749.134.060-19',6);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Danilo Oliveira',				'138.536.850-05',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Brenda Rodrigues',				'437.536.752-02',5);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Lara Barbosa',					'411.750.728-18',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Aline Goncalves',				'294.569.932-05',4);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Vinícius Rocha',				'469.371.385-63',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('João Castro',					'778.557.993-89',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Otávio Correia',				'226.872.688-60',4);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Felipe Dias',					'901.054.699-39',3);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Igor Cavalcanti',				'480.630.415-85',3);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Paulo Castro',					'982.524.371-68',2);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Melissa Oliveira',				'668.128.328-47',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Felipe Fernandes',				'945.041.085-26',15);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Julian Alves',					'323.005.175-07',14);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Marcos Goncalves',				'863.127.041-57',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Davi Goncalves',				'735.476.047-10',13);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Diego Azevedo',				'422.647.581-04',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Sarah Gomes',					'687.812.716-54',12);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Otávio Rocha',					'374.442.183-07',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Vitór Barros',					'691.157.117-06',1);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Vitor Costa',					'440.767.697-32',11);
INSERT INTO funcionario (nome	,cpf	,cidade_id) VALUES ('Thiago Goncalves',				'755.645.830-00',10);

INSERT INTO categoria (nome) VALUES ('BEBIDA ALCOÓLICA');
INSERT INTO categoria (nome) VALUES ('BEBIDA NÃO ALCOÓLICA');
INSERT INTO categoria (nome) VALUES ('BOMBONIERE');
INSERT INTO categoria (nome) VALUES ('CARNES');
INSERT INTO categoria (nome) VALUES ('CESTA BÁSICA');
INSERT INTO categoria (nome) VALUES ('CHOCOTONE');
INSERT INTO categoria (nome) VALUES ('CONGELADOS');
INSERT INTO categoria (nome) VALUES ('FRIOS');
INSERT INTO categoria (nome) VALUES ('HORTIFRUTIGRANJEIROS');
INSERT INTO categoria (nome) VALUES ('LATICÍNIOS');
INSERT INTO categoria (nome) VALUES ('MATINAIS');
INSERT INTO categoria (nome) VALUES ('MERCEARIA');
INSERT INTO categoria (nome) VALUES ('PADARIA / CONFEITARIA');
INSERT INTO categoria (nome) VALUES ('PANETONE');
INSERT INTO categoria (nome) VALUES ('PAPINHA PARA BEBÊ');
INSERT INTO categoria (nome) VALUES ('SOBREMESAS / CONFEITARIA');
INSERT INTO categoria (nome) VALUES ('CRISTAL / PORCELANA / VIDRO');
INSERT INTO categoria (nome) VALUES ('ESCULTURA');
INSERT INTO categoria (nome) VALUES ('FOTOS');
INSERT INTO categoria (nome) VALUES ('GRAVURA');
INSERT INTO categoria (nome) VALUES ('OBJETOS DE DECORAÇÃO');
INSERT INTO categoria (nome) VALUES ('OUTROS ARTIGOS DE ARTE / ANTIGUIDADES');
INSERT INTO categoria (nome) VALUES ('PAPEL');
INSERT INTO categoria (nome) VALUES ('PEÇAS EM ARTESANATO');
INSERT INTO categoria (nome) VALUES ('PEDRA');
INSERT INTO categoria (nome) VALUES ('PEDRAS PRECIOSAS');
INSERT INTO categoria (nome) VALUES ('PINTURA');
INSERT INTO categoria (nome) VALUES ('POSTER');
INSERT INTO categoria (nome) VALUES ('ARTIGOS BUDISTAS');
INSERT INTO categoria (nome) VALUES ('ARTIGOS CATÓLICOS');
INSERT INTO categoria (nome) VALUES ('ARTIGOS DE CANDOMBLÉ');
INSERT INTO categoria (nome) VALUES ('ARTIGOS DE UMBANDA');
INSERT INTO categoria (nome) VALUES ('ARTIGOS ESPÍRITAS');
INSERT INTO categoria (nome) VALUES ('ARTIGOS EVANGÉLICOS');
INSERT INTO categoria (nome) VALUES ('ARTIGOS ISLÂMICOS');
INSERT INTO categoria (nome) VALUES ('ARTIGOS JUDAICOS');
INSERT INTO categoria (nome) VALUES ('JOIAS RELIGIOSAS');
INSERT INTO categoria (nome) VALUES ('MÓVEIS PARA IGREJA');
INSERT INTO categoria (nome) VALUES ('ÁLBUM DE FIGURINHAS');
INSERT INTO CATEGORIA (nome) VALUES ('APOSTILA PARA CONCURSOS / CURSOS');
INSERT INTO CATEGORIA (nome) VALUES ('ASSINATURAS DE JORNAIS');
INSERT INTO CATEGORIA (nome) VALUES ('ASSINATURAS DE REVISTAS');

INSERT INTO marca (nome) VALUES ('COCA-COLA');
INSERT INTO marca (nome) VALUES ('COCA-COLA ZERO');
INSERT INTO marca (nome) VALUES ('FANTA LARANJA');
INSERT INTO marca (nome) VALUES ('GUARANÁ ANTARCTICA');
INSERT INTO marca (nome) VALUES ('PEPSI');
INSERT INTO marca (nome) VALUES ('SKOL');
INSERT INTO marca (nome) VALUES ('BRAHMA');
INSERT INTO marca (nome) VALUES ('KAISER');

INSERT INTO unidade_medida (nome, sigla) VALUES ('LITRO','L');
INSERT INTO unidade_medida (nome, sigla) VALUES ('MILILITRO','ML');
INSERT INTO unidade_medida (nome, sigla) VALUES ('UNIDADE','UN');
INSERT INTO unidade_medida (nome, sigla) VALUES ('METRO LINEAR','MT');
INSERT INTO unidade_medida (nome, sigla) VALUES ('METRO QUADRADO','M2');
INSERT INTO unidade_medida (nome, sigla) VALUES ('METRO CÚBICO','M3');

INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA GARRAFA PET 2 L',			'',	  2,01,4.50,6.07,'S',1,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA LATA 350 ML',				'', 350,01,1.58,2.99,'S',1,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA GARRAFA PET 600 ML',			'', 600,01,2.19,3.99,'S',1,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA GARRAFA PET 2,5 L',			'',	2.5,01,4.50,6.07,'S',1,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA GARRAFA PET 1,5 L',			'',	1.5,01,3.19,5.49,'S',1,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA LATA 250 ML',				'',	250,01,1.01,2.45,'S',1,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA GARRAFA PET 2 L 6 UNIDADES',	'',   2,06,29.90,35.50,'S',1,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA GARRAFA PET 1 L',			'',   1,01,2.79,3.79,'S',1,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA GARRAFA PET 250 ML',			'', 250,01,1.39,1.49,'S',1,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA GARRAFA PET 3 L',			'',   3,01,5.21,7.65,'S',1,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA GARRAFA PET 500 ML',			'',	500,01,2.89,3.21,'S',1,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA LATA 350 ML 12 UNIDADES',	'',	350,12,21.30,26.9,'S',1,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('REFRIGERANTE COCA-COLA LATA 350 ML 6 UNIDADES',		'', 350,06,10.45,14.46,'S',1,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN LATA 473 ML 1 UNIDADES','', 476,1, 2.19, 4.99,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN LATA 350 ML 1 UNIDADES','', 350,1, 1.66, 3.49,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN LONG NECK 355 ML 1 UNIDADES','', 355,1, 2.05, 3.10,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN LATA 269 ML 1 UNIDADES','', 296,1, 1.40, 1.99,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN LATA 350 ML 12 UNIDADES','', 350,12,20.00,35.99,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN GARRAFA 1000 ML 1 UNIDADE','', 1,1, 4.12, 4.38,'S',6,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN LONG NECK 250 ML 1 UNIDADE','', 250,1, 1.68, 1.75,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL 360° PILSEN LATA 350 ML 1 UNIDADE','', 350,1, 2.19, 2.82,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN LATA 269 ML 15 UNIDADES','', 269,15,21.50,29.85,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN GARRAFA 600 ML 1 UNIDADE','', 600,1, 2.58, 3.60,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('SKOL 1 LITRO CAIXA COM 12 UNIDADES','', 1,12,49.50,60.70,'S',6,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('SKOL LONG NECK 24 UNIDADES','', 350,24,48.50,55.00,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('SKOL LATÃO 473 ML','', 320,1, 2.20, 4.50,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('SKOL 330ML','', 330,1, 3.22, 4.00,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL LATA 269ML','', 269,1, 1.99, 3.50,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL LATA 269ML PCT 15 UNIDADES','', 269,15,24.75,27.00,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL LATA 350ML PCT 12 UNIDADES','', 350,12,31.99,37.20,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL LATÃO 473ML PCT 12 UNIDADES','', 473,12,42.55,49.99,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA LATA SKOL 350ML','', 350,1, 2.19, 3.78,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL LT 550ML','', 550,1, 2.35, 3.50,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN ONE WAY 300ML','', 300,1, 1.49, 2.79,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL 1L C / CASC','', 1,1, 4.99, 5.60,'S',6,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL LATA 350ML CX COM 12UN','', 350,1,22.67,26.77,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA SKOL PILSEN LATA 350ML','', 350,1, 2.47, 3.20,'S',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA AK LATÃO 473ML PCT 12 UNIDADES','', 473,12,42.55,49.99,'N',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA LATA AK 350ML','', 350,1, 2.19, 3.78,'N',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA AK LT 550ML','', 550,1, 2.35, 3.50,'N',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA AK PILSEN ONE WAY 300ML','', 300,1, 1.49, 2.79,'N',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA AK 1L C / CASC','', 1,1, 4.99, 5.60,'N',6,2);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA AK LATA 350ML CX COM 12UN','', 350,1,22.67,26.77,'N',6,1);
INSERT INTO produto (nome,descricao,conteudo,unidade,preco_custo,preco_venda,controla_lote,marca_id,unidade_medida_id) VALUES ('CERVEJA AK PILSEN LATA 350ML','', 350,1, 2.47, 3.20,'N',6,1);
 
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,69);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (14,74);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (9,2);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (17,17);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (15,5);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (12,77);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (5,6);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,48);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (31,75);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (6,48);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (9,76);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (10,35);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (11,41);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (30,56);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (5,53);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (31,70);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (28,53);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (8,75);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (33,2);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (26,62);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (17,54);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,52);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,8);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,45);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (22,19);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (33,84);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (19,62);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (23,42);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,2);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (15,58);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (21,2);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,46);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (30,24);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,77);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (28,47);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (13,6);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (8,16);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (3,24);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (15,21);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (22,54);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (28,57);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,4);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,55);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (5,1);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (9,75);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (2,71);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (6,46);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (11,14);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (33,57);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (7,10);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (21,18);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (21,71);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (28,37);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (19,35);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (10,73);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (3,71);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (13,75);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (24,64);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (1,31);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (10,19);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (7,21);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (20,86);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (21,52);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (14,7);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (29,67);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (18,19);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (10,13);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (3,72);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (7,60);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,70);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (23,84);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (12,38);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,40);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (26,44);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (10,17);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,18);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (3,60);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (8,13);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (2,22);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (14,74);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (9,85);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (16,69);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (27,66);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,85);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (21,11);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (7,85);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,14);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (20,20);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (31,60);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,45);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (17,67);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (27,26);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (20,76);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (11,55);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (17,69);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (30,81);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (29,21);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (15,18);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (3,82);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (14,74);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (17,66);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (23,19);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (24,71);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,83);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (27,76);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,74);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,5);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (12,50);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (24,18);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (8,53);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (13,75);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (11,23);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (18,76);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (17,26);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (15,26);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (19,58);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (15,38);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (1,22);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (28,29);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (6,9);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (11,22);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (28,34);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (11,54);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (11,4);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,81);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (9,38);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (9,58);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (5,2);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,84);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (21,15);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (8,49);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (23,75);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,70);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (1,10);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (28,12);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (21,11);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (26,63);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,84);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (5,60);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (33,38);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (24,37);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (2,33);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (3,37);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (31,52);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (11,4);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (18,51);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (13,37);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (17,38);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (23,31);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (2,19);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (22,51);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (19,36);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (18,2);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (14,79);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (18,72);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (22,73);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (3,81);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (33,12);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (2,63);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (33,52);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (19,38);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (19,28);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (26,1);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,80);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (26,26);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (9,37);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (15,26);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (31,31);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (10,73);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (7,73);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (5,59);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (15,1);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (7,27);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (1,58);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (7,16);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,44);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,43);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (26,64);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (13,31);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,77);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (19,73);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (32,81);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (8,22);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (18,56);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (31,34);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,2);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (12,57);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (30,43);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,19);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (13,6);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (31,73);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (7,86);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (12,60);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,48);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (8,83);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (25,40);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (4,22);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (2,86);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (19,43);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (11,32);
INSERT INTO venda (funcionario_id,cliente_id) VALUES (22,67);

INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,1,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,1,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,2,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,2,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,3,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,3,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,3,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,4,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,4,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,4,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,5,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,5,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,6,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (40,6,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 40));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,6,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,6,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,7,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,7,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,7,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,8,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (31,8,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 31));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,9,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,9,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,9,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,10,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,10,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,10,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,11,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,11,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,12,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,12,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,12,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,13,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,13,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,13,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,14,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,14,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,15,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,15,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,15,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,16,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,16,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,16,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,17,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (40,17,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 40));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,18,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,18,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,18,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (31,19,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 31));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,19,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,19,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,20,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,20,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (31,21,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 31));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,21,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,21,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (2,22,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 2));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,22,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,23,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,23,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (2,23,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 2));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (9,24,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 9));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,24,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,24,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,25,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,25,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,26,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,26,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,26,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,27,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,27,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (18,27,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 18));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,28,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,28,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,29,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,29,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,29,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,30,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (23,30,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 23));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,30,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,31,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (7,31,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 7));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,32,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,32,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (20,32,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 20));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (18,33,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 18));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,33,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (6,33,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 6));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,34,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,34,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,35,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,35,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,35,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,36,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,36,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,37,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,37,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,37,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,38,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (20,38,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 20));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,38,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,39,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,39,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (20,40,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 20));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,40,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,40,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (35,41,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 35));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,41,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,41,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,42,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,42,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,43,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,43,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,43,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,44,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,44,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,44,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,45,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,45,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,46,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,46,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,46,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,47,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,47,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,48,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (2,48,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 2));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,48,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,49,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,49,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,49,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (7,50,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 7));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,50,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,51,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,51,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,51,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (40,52,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 40));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,52,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,52,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,53,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,53,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,54,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,54,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,54,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,55,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,55,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,55,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (20,56,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 20));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (20,56,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 20));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,57,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,57,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,57,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,58,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,58,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,58,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,59,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,59,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,60,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,60,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (7,60,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 7));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,61,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,61,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,62,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,62,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,62,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,63,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,63,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (18,63,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 18));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,64,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,64,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,65,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,65,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,65,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (18,66,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 18));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (40,66,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 40));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,66,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,67,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (23,67,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 23));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,68,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,68,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,68,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,69,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,69,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,69,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,70,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,70,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,71,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (18,71,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 18));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (20,71,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 20));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,72,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,72,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (20,72,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 20));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (6,73,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 6));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,73,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (9,74,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 9));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,74,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (2,74,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 2));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,75,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,75,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,76,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,76,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,76,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (20,77,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 20));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,77,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,77,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,78,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,78,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (6,79,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 6));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,79,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,79,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,80,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,80,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (6,80,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 6));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,81,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,81,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,82,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,82,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,82,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,83,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,83,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,83,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,84,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,84,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,85,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (23,85,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 23));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,85,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,86,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,86,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (40,86,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 40));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,87,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,87,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,88,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,88,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,88,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (9,89,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 9));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,89,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (7,90,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 7));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,90,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,90,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,91,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (18,91,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 18));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (40,91,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 40));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (6,92,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 6));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (35,92,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 35));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (23,93,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 23));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,93,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,93,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,94,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,94,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,94,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,95,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,95,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,96,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,96,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,96,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,97,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,97,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,97,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (33,98,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 33));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,98,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (7,99,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 7));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,99,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,99,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,100,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,100,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,101,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,101,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,101,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,102,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,102,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,102,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,103,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,103,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,104,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,104,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (9,104,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 9));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,105,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,105,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (35,105,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 35));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (9,106,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 9));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,106,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,107,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (31,107,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 31));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (40,107,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 40));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,108,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,108,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,108,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,109,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,109,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,110,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,110,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,110,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (35,111,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 35));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,111,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,111,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (40,112,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 40));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (33,112,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 33));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,113,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,113,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,113,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,114,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,114,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,115,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,115,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,115,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,116,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,116,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (6,116,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 6));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,117,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,117,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,118,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,118,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,118,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,119,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,119,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,119,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,120,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,120,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,121,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,121,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,121,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,122,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,122,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,122,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,123,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,123,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,124,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (18,124,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 18));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,124,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,125,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (33,125,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 33));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,125,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,126,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,126,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,127,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (23,127,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 23));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,127,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,128,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,128,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,129,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,129,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,129,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,130,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,130,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,130,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (23,131,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 23));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,131,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,132,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,132,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,132,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,133,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,133,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (23,133,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 23));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,134,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,134,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,135,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,135,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,135,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (9,136,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 9));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,136,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,136,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,137,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,137,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,138,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,138,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,138,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,139,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,139,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,139,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,140,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (2,140,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 2));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,141,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,141,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,141,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,142,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,142,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,143,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (33,143,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 33));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,143,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (31,144,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 31));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,144,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,144,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,145,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,145,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,146,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (9,146,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 9));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,146,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,147,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,147,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,147,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,148,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,148,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,149,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,149,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (7,149,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 7));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,150,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,150,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,150,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,151,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,151,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,152,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,152,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,152,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,153,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,153,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,154,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,154,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,154,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,155,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,155,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,155,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,156,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (23,156,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 23));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,157,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,157,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,157,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,158,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,158,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (7,158,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 7));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,159,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (33,159,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 33));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,160,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (12,160,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 12));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,160,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,161,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,161,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,161,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,162,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,162,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,163,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,163,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,163,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,164,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,164,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,164,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (7,165,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 7));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (6,165,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 6));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,166,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,166,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,166,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,167,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,167,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,168,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,168,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,168,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (24,169,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 24));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,169,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (9,169,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 9));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,170,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,170,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,171,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (10,171,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 10));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,171,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,172,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,172,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,172,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,173,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,173,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,174,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,174,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,174,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,175,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (33,175,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 33));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (6,175,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 6));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,176,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,176,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,177,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,177,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (19,177,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 19));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,178,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,178,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,178,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,179,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,179,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,180,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (33,180,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 33));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,180,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (9,181,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 9));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,181,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (32,182,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 32));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (14,182,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 14));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,182,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,183,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,183,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (33,183,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 33));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,184,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (27,184,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 27));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,185,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,185,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,185,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (3,186,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 3));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (41,186,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 41));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (22,186,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 22));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,187,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (39,187,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 39));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,188,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (17,188,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 17));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (26,188,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 26));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (5,189,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 5));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (2,189,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 2));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (34,189,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 34));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,190,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,190,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (28,191,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 28));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (4,191,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 4));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (2,191,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 2));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,192,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,192,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (8,192,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 8));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (37,193,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 37));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (1,193,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 1));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (15,194,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 15));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (44,194,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 44));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,194,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,195,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (38,195,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 38));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,196,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (13,196,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 13));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (36,196,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 36));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (16,197,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 16));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (25,197,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 25));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (2,197,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 2));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,198,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (29,198,1,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 29));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (30,199,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 30));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (35,199,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 35));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (7,199,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 7));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (11,200,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 11));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (18,200,4,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 18));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (43,200,2,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 43));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (42,201,5,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 42));
INSERT INTO item_venda(produto_id,venda_id,quantidade,preco_unidade) VALUES (21,201,3,(SELECT PRECO_VENDA FROM PRODUTO WHERE ID = 21));

SELECT cidade.nome, estado.sigla
FROM estado;

SELECT cidade.nome, cidade.estado_id
FROM cidade, estado
WHERE cidade.estado_id = estado.id;

SELECT * FROM estado;
SELECT * FROM cidade; 



select * from cliente;

 
-- 4.	Liste o nome e o telefone dos funcionarios ATIVOS que moram na região SUL.
-- Nível 2


SELECT funcionario.nome, estado.nome
FROM funcionario, cidade, estado
WHERE funcionario.cidade_id = cidade.estado_id
AND estado.sigla = 'PR';

-- 5. Informe o nome dos produtos e a respectiva unidade de medida da venda com o código 3.

SELECT produto.nome, unidade_medida.nome, venda.id
FROM produto, venda, unidade_medida
WHERE produto.unidade_medida_id = unidade_medida.id
AND venda.id = 3;

-- 6. Liste os nomes dos funcionários que já venderam o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.








 

