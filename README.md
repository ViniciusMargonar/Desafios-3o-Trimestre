# Desafios - Banco de Dados I - 3o Trimestre.

**Equipe:** João Victor, Keren A. Cardoso, Natália A. Oliveira e Vinícius Margonar.


# Quando devemos utilizar o JOIN ? Qual sua utilidade ?

Quando você tem tabelas que a resposta de uma consulta pode estar relacionada em outra tabela, muitas vezes para exibirmos de maneira simplificada precisamos fazer tipos de consultas um pouco mais complexas. É nesse momento que utiliza-se uma cláusula JOIN,que é usada para combinar linhas de duas ou mais tabelas, com base em uma coluna relacionada entre elas.

**Dentro do SQL existem alguns tipos de JOIN, sendo alguns deles:**

**1 - INNER JOIN:** Retorna registros que possuem valores correspondentes nas duas tabelas.<br />
**2- LEFT JOIN:** Retorna todos os registros da tabela esquerda e os registros correspondentes da tabela direita.<br />
**3 - RIGHT JOIN:** Retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda.<br />
**4 - CROSS JOIN:** Retorna todas as linhas das tabelas por cruzamento, ou seja, para cada linha da tabela esquerda queremos todos os linhas da tabelas direita ou vice-versa.<br />

<sub> Para maior exemplificação, oberseve a imagem abaixo: <sub>
![alt text](https://www.alphacodingskills.com/mysql/img/mysql-join.PNG)
