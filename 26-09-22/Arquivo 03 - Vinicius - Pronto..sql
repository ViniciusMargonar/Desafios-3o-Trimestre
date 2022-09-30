
-- 1.	Escreva o comando que liste os nomes de todas as cidades e as respectivas siglas do estado.
SELECT cidade.nome nome_cidade, estado.sigla sigla_estado
FROM cidade, estado
WHERE estado.id = cidade.estado_id;

-- 2.	Escreva o comando que liste os nomes das cidades ativas e as respectivas siglas do estado. 
SELECT cidade.nome nome_cidade, estado.sigla sigla_estado
FROM cidade, estado
WHERE estado.id = cidade.estado_id AND cidade.ativo = 'S';

-- 3.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. 
SELECT cliente.nome nome_cliente, cidade.nome nome_cidade -- cidade.id id_cidade
FROM cidade, cliente
WHERE cliente.cidade_id = cidade.id;

-- 4.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na cidade de Paranavaí.
SELECT cliente.nome nome_cliente, cidade.nome nome_cidade -- cidade.id id_cidade
FROM cidade, cliente
WHERE cliente.cidade_id = cidade.id AND cliente.cidade_id = 6;

-- 5.	Escreva o comando que liste os nomes das cidades e as respectivas siglas do estado. Liste somente as cidades ativas.
SELECT cidade.nome nome_cidade, estado.sigla sigla_estado
FROM cidade, estado
WHERE estado.id = cidade.estado_id AND cidade.ativo = 'S';

-- 6.	Escreva o comando que liste os nomes dos funcionários e os nomes das respectivas cidades. 
SELECT funcionario.nome nome_funcionario, cidade.nome nome_cidade 
FROM cidade, funcionario
WHERE funcionario.cidade_id = cidade.id;

-- 7.	Escreva o comando que liste os nomes dos funcionários e a sigla do respectivo estado. 
SELECT funcionario.nome nome_funcionario, estado.sigla sigla_estado
FROM estado, funcionario
WHERE funcionario.cidade_id = estado.id;

-- 8.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na região sul.
SELECT cliente.nome nome_cliente, cidade.nome nome_cidade
FROM cliente, cidade
WHERE cliente.cidade_id = cidade.id AND cidade.estado_id = 1;

-- 9.	Escreva o comando que liste os nomes dos estados com cadastros ativos que possuem algum cliente cadastrado.
SELECT estado.nome nome_estado
FROM estado, cidade, cliente 
WHERE cidade.id = cliente.cidade_id AND estado.id = cidade.estado_id AND estado.ativo = 'S';

-- 10.	Escreva o comando que liste todas as vendas e o nome do respectivo funcionário que a realizou.
SELECT venda.id venda_id, funcionario.nome nome_funcionario
FROM funcionario, venda 
WHERE funcionario.id = venda.funcionario_id;
-- 11.	Liste o nome dos produtos, o preço de venda e o nome da unidade de medida.
SELECT produto.nome nome_produto, produto.preco_venda, unidade_medida.nome tipo_medida
FROM produto, venda, unidade_medida
WHERE unidade_medida.id = produto.unidade_medida_id;

-- 12.	Liste o nome dos produtos da marca "Coca-cola".
SELECT produto.nome nome_produto, marca.nome nome_marca
FROM produto, marca
WHERE produto.marca_id = marca.id;

-- 13. DESAFIO!!! Liste os nomes dos clientes do estado de São Paulo que já compraram o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.
SELECT cliente.nome nome_cliente, estado.nome nome_estado, produto.nome nome_produto
FROM cliente, estado, produto
WHERE produto.id = 10 AND estado.id = 2;

/*
-- 1.	Em que caso devemos utilizar o JOIN? Quais tabelas podem ser utilizando em um comando JOIN?

O uso dos JOIN é essencial para conectar os dados entre as tabelas no banco de dados, possibilitando utilizar as tabelas que tem algum relacionamento entre si, ou seja uma
caso de dependência entre uma tabela para com outra 

-- 2.	No caso do JOIN, o que é condição de junção. Qual cuidado devemos ter. 

Correspondente a uma operação de junção em álgebra relacional, combina colunas de uma ou mais tabelas em um banco de dados relacional. Ela cria um conjunto que pode ser salvo como uma tabela ou usado da forma como está.
Existem vários tipos de junções, como exemplo: Junção interna, junção externa (junção externa esquerda ou junção esquerda, junção externa direita ou junção direita e junção externa completa ) 
e auto-adesão.
É importante que as tabelas sejam associadas em pares mesmo que podem ser juntadas com apenas um só comando, para isso é necessário uma chave estrangeira de uma tabela
para ralacionar em outra. Os valores dentro da tabela tem de ser comparadas por um operador lógico que é definido pelo JOIN e utilizada pelo operador ON,
como sinal de =, quando o CROSS JOIN for usado sem a clausula ON, poderão ser usados parênteses para indicar a junção.

-- 3.	Em relação a sintaxe, em um JOIN não é necessário utilizarmos condições (WHERE) - o comando irá executar normalmente. Porém, em questão de semântica, a cada junção é necessário ter ao menos 1 condição. Explique.

A sintaxe está sim de forma correta mas em relação a semantica não pois ele fará o produto cartesiano de todas as colunas selecionados independentemente se tem relacionamento ou não
então para que haja o relacionamento correto é necessário aa utilização do WHERE.

-- 4.	O que é produto cartesiano? Como funciona? Qual a relação com o JOIN.

O produto cartesianpo é a combinação de todos os dados da tabela A com a tabela B, ligando  todos os dados das colunas de A coma de B, nesse caso utilizamos no relacionamento das tabelas 
do JOIN para obter a conbinação dos dados.É uma ferramenta matemática gráfica como um projeto para analisar suas dimensões, é composto por retas numericas perpendiculares que possuem ponto em comum, ou seja é marcasdo como zero de ambas a retas que dão origem ao plano 
carteziano pois a partir disso que vai ser possivel a localização de quaisquer pontos do plano.
Sua principal função  é localizar os elementos de um espaço no qual o JOIN tem a mesma função.

-- 5.	Na elaboração de um consulta que envolve 1587 tabelas, serão necessários, quantas condições de junção?

Serao necessarias 1586 condições de junção.

*/
