# Desafios - Banco de Dados I - 3o Trimestre.

**Equipe: SQL Dolphins;** <br /> 
**Integrantes:** João Victor, Keren A. Cardoso, Natália A. Oliveira e Vinícius Margonar.


# Quando devemos utilizar o JOIN ? Qual sua utilidade ?

Quando você tem tabelas que a resposta de uma consulta pode estar relacionada em outra tabela, muitas vezes para exibirmos de maneira simplificada precisamos fazer tipos de consultas um pouco mais complexas. É nesse momento que utiliza-se uma cláusula JOIN,que é usada para combinar linhas de duas ou mais tabelas, com base em uma coluna relacionada entre elas.

**Dentro do SQL existem determinados tipos de JOIN, sendo alguns deles:**

**1 - INNER JOIN:** Retorna registros que possuem valores correspondentes nas duas tabelas.<br />
**2 - LEFT JOIN:** Retorna todos os registros da tabela esquerda e os registros correspondentes da tabela direita.<br />
**3 - RIGHT JOIN:** Retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda.<br />
**4 - CROSS JOIN:** Retorna todas as linhas das tabelas por cruzamento, ou seja, para cada linha da tabela esquerda queremos todos os linhas da tabelas direita ou vice-versa.<br />

<sub>Para melhor exemplificação, oberseve a imagem abaixo:<sub>
![alt text](https://www.alphacodingskills.com/mysql/img/mysql-join.PNG)

# Sintaxe básica JOIN:
 
A sintaxe básica para um Join baseia-se fortemente na teoria dos conjuntos, suas operações são literalmente as operações de união, subtração e intersecção da teoria 
de conjuntos em formas de comando no SQL. Para execuçao de tais comandos, é preciso tabelas que tenham relação para que a combinação faça sentido, 
ademais para que os relacionamentos façam sentido é necessário o uso da comparação da PK de uma tabela, com a FK referenciando a pk da tabela tendo portanto a
Sintaxe descrita abaixo:
  
**SELECT** 
    {nome_coluna1}
    ,{nome_coluna2}
    , [... outras colunas]<br />
**FROM** {nome_tabela1}, {nome_tabela2}, [... outras tabelas]<br />
**WHERE** pk = fk; <br />
 <sub> Vale ressaltar que é possível utilizar vários operadores lógicos (>= ; <=; =; <; >) no **WHERE**.<sub> <br />
 

![EquipeLogoSQL](https://user-images.githubusercontent.com/103221467/194791516-6c2c5137-2617-4077-b7cf-a47d6e7f09e3.png)

