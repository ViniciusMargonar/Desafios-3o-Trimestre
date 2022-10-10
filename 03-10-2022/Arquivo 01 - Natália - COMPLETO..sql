-- 1.	Liste os nomes de todas as cidades ATIVAS do estado PARANÁ.

SELECT cidade.nome cidade_nome, estado.nome estado_nome
FROM cidade, estado
WHERE cidade.estado_id = estado.id
AND estado.ativo = 'S'
AND estado.nome = 'PARANA';

-- 2.	Liste o nome e o telefone dos fornecedores que estão ativos e moram em PARANAVAÍ.

-- A TABELA FORNECEDOR NÃO EXISTE

-- 3.	Escreva o comando que liste os nomes dos clientes que moram nas seguintes cidades: MARINGÁ, PARANAVAÍ e CIARNORTE. 

SELECT cliente.nome nome_cliente, cidade.nome nome_cidade
FROM cidade, cliente
WHERE cliente.cidade_id = cidade_id
AND cidade.nome =  'PARANAVAI'
OR  cidade.nome = 'MARINGA'
OR cidade.nome = 'CIANORTE';

-- 4.	Liste o nome e o telefone dos funcionarios ATIVOS que moram na região SUL.
-- Nível 2

SELECT funcionario.nome nome_funcionario, estado.nome nome_estado
FROM funcionario, cidade, estado
WHERE funcionario.cidade_id = cidade.estado_id
AND estado.sigla in ('PR','SC','RS');

-- 5. Informe o nome dos produtos e a respectiva unidade de medida da venda com o código 3.

SELECT produto.nome niome_produto, unidade_medida.nome unidadem_nome, venda.id venda_id
FROM produto, venda, unidade_medida
WHERE produto.unidade_medida_id = unidade_medida.id
AND venda.id = 3;

-- 6. Liste os nomes dos funcionários que já venderam o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.

SELECT funcionario.nome nome_funcionario
FROM funcionario, produto, item_venda, venda
WHERE funcionario.id = venda.funcionario_id
AND venda.id = item_venda.venda_id
AND item_venda.produto_id = produto.id
AND produto.nome = 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L';

-- 7. Liste os nomes dos fornecedores dos estados PARANÁ, MATO GROSSO e RIO GRANDE DO NORTE.

-- A TABELA FORNECEDOR NÃO EXISTE

-- 8. Liste os nomes dos produtos vendidos no dia XXX (pode escolher um dia existente).

SELECT produto.nome nome_produto
FROM produto, item_venda, venda
WHERE produto.id = item_venda.produto_id
AND item_venda.venda_id = venda.id
AND venda.data = "2022-10-09 22:46:15";

-- 9. Feliz com um bom atendimento, um determinado cliente entra em contato com o gerente para enviar uma lembrança ao funcionário.
-- O problema é que, além de não informar a sua identidade, ele não lembra do nome do funcionário. Sabe apenas que,na conversa, moraram 
-- na mesma cidade e possuem o mesmo nome. Neste contexto, faça as consultas necesárias para identificar o funcionário. 

SELECT cliente.nome nome_cliente, funcionario.nome funcionario_nome
FROM venda, funcionario, cliente
WHERE venda.funcionario_id = funcionario.id
AND venda.cliente_id = cliente.id
AND cliente.nome = funcionario.nome;

/*
-- 10. Um cliente entra em contato com o gerente solicitando um possível erro de troco. O cliente não lembra o nome do funcionário, 
mas possui as seguintes informações:
 (1) nome completo do cliente: Sophia Lima
 (2) CPF do cliente: 321.109.923-95
 (3) cidade onde cliente nasceu: BAURU/SÃO PAULO
 (4) a cliente alega estar faltando 30 reais
Neste contexto, faça as consultas necessárias para descobrir o possível nome do funcionário. Justifique!
*/

SELECT venda.funcionario_id, funcionario.nome nome_funcionario, cliente.nome nome_cliente 
FROM item_venda, venda, funcionario, cliente
WHERE item_venda.venda_id = venda.id 
AND funcionario.id = venda.funcionario_id
AND cliente.id = venda.cliente_id 
AND cliente.id = 62;

-- Com as tabelas existentes, o resultado aproximado(Nome do funcionario) que foi possível se chegar foi: Otávio Correia e Marcos Goncalves. 

-- 11. De acordo com o projeto do SEU COLEGA, elabore uma consulta RELEVANTE que ajude de alguma forma a empresa. 
-- A consulta deve envolver mais de 4 tabelas.

SELECT cliente.nome_fantasia nome_cliente, pagamento.parcelas_pagas
FROM pagamento, cliente, honorario, funcionario
WHERE cliente.id = pagamento.cliente_id
AND honorario.id = pagamento.honorario_id
AND cliente.id = honorario.cliente_id;



		
    
        


	