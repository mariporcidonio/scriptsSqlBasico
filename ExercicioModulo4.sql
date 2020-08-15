USE VENDA_CURSOS;

INSERT INTO TIPO (TIPO) VALUES ('Banco de dados');
INSERT INTO TIPO (TIPO) VALUES ('Programação');
INSERT INTO TIPO (TIPO) VALUES ('Modelagem de dados');

INSERT INTO INSTRUTOR (INSTRUTOR, TELEFONE) VALUES ('André Milani', '1111-1111');
INSERT INTO INSTRUTOR (INSTRUTOR, TELEFONE) VALUES ('Carlos Tosin', '2222-2222');

INSERT INTO CURSO (CURSO, CODIGO_INSTRUTOR, CODIGO_TIPO, VALOR) VALUES
('Java Fundamentos', 2, 2, 270),
('Java Avançado', 2, 2, 330),
('SQL Completo', 1, 1, 170),
('PHP Básico', 2, 1, 270);

INSERT INTO ALUNO (ALUNO, ENDERECO, EMAIL, NASCIMENTO) VALUES
('José', 'Rua XV de Novembro 72', 'jose@softblue.com.br', '1990-08-20'),
('Wagner', 'Av. Paulista', 'wagner@softblue.com.br', '1991-07-15'),
('Emílio', 'Rua Lajes 103, ap: 701', 'emilio@softblue.com.br', '1996-07-12'),
('Cris', 'Rua Tauney 22', 'cris@softblue.com.br', '1989-05-30'),
('Regina', 'Rua Salles 305', 'regina@softblue.com.br', '1998-10-31'),
('Fernando', 'Av. Central 30', 'fernando@softblue.com.br', '1979-03-02');

INSERT INTO PEDIDO (CODIGO_ALUNO, DATA_PEDIDO) VALUES
(2, '2010-04-15 11:23:32'),
(2, '2010-04-15 14:36:21'),
(3, '2010-04-16 11:17:45'),
(4, '2010-04-17 14:27:22'),
(5, '2010-04-18 11:18:19'),
(6, '2010-04-19 13:47:35'),
(6, '2010-04-20 18:13:44');

INSERT INTO PEDIDO_DETALHE (CODIGO_PEDIDO, CODIGO_CURSO, VALOR) VALUES
(36, 1, 270),
(36, 2, 330),
(37, 1, 270),
(37, 2, 330),
(37, 3, 170),
(38, 4, 270),
(39, 2, 330),
(39, 4, 270),
(40, 3, 170),
(41, 3, 170),
(42, 4, 270);

/*Exibir todas as informações de todos os alunos;*/
SELECT * FROM ALUNO;

/*Exibir somente o título de cada curso da Softblue;*/
SELECT CURSO FROM CURSO;

/*Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200;*/
SELECT CURSO, VALOR FROM CURSO WHERE VALOR > 200;

/*Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200 e menor que 300;*/
SELECT CURSO, VALOR FROM CURSO WHERE VALOR > 200 AND VALOR < 300;
/*Outra solução para o exercício seria esta;*/
SELECT CURSO, VALOR FROM CURSO WHERE VALOR BETWEEN 200 AND 300;

/*Exibir as informações da tabela PEDIDOS para os pedidos realizados entre 15/04/2010 e 18/04/2010;*/
SELECT * FROM PEDIDO WHERE DATA_PEDIDO >='2010-04-15' AND DATA_PEDIDO <='2010-04-18';
/*Outra solução para o exercício seria esta;*/
SELECT * FROM PEDIDO WHERE DATA_PEDIDO BETWEEN '2010-04-15' AND '2010-04-18';

/*Exibir as informações da tabela PEDIDOS para os pedidos realizados na data de 15/04/2010;*/
SELECT * FROM PEDIDO WHERE DATA_PEDIDO BETWEEN '2010-04-15 00:00:00' AND '2010-04-15 23:59:59';

/*Altere o endereço do aluno JOSÉ para 'Av. Brasil 778';*/
UPDATE ALUNO SET ENDERECO = 'Av. Brasil 778' WHERE ALUNO = 'JOSE';

/*Altere o e-mail do aluno CRIS para 'cristiano@softblue.com.br';*/
UPDATE ALUNO SET EMAIL = 'cristiano@softblue.com.br' WHERE ALUNO = 'CRIS';

/*Aumente em 10% o valor dos cursos abaixo de 300;*/
UPDATE CURSO SET VALOR = ROUND(VALOR * 1.1, 2) WHERE VALOR < 300;

/*Altere o nome do curso de Php Básico para Php Fundamentos;*/
UPDATE CURSO SET CURSO = 'PHP Fundamentos' WHERE CURSO = 'PHP Básico';