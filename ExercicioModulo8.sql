-- Exercício 1
-- Baseado na tabela, construa uma transação que atualiza o valor aplicado em cada conta bancária baseado no índice 
-- de correção percentual de 3%, garantindo que a instrução de UPDATE seja realizada na tabela toda, com as propriedades ACID.

USE curso_sql;

CREATE TABLE CONTA_BANCARIA
(
CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT, -- Código interno (PK)
TITULAR VARCHAR(32) NOT NULL, -- Nome do titular da conta
SALDO DOUBLE NOT NULL, -- Representa o saldo da conta
PRIMARY KEY(CODIGO) -- Define o campo CODIGO como PK (Primary Key)
) ENGINE = InnoDB;

INSERT INTO CONTA_BANCARIA VALUES (1, 'André', 213);
INSERT INTO CONTA_BANCARIA VALUES (2, 'Diogo', 489);
INSERT INTO CONTA_BANCARIA VALUES (3, 'Rafael', 568);
INSERT INTO CONTA_BANCARIA VALUES (4, 'Carlos', 712);
INSERT INTO CONTA_BANCARIA VALUES (5, 'Peter', -38);

SELECT * FROM conta_bancaria;

START TRANSACTION;
UPDATE conta_bancaria SET saldo = saldo + (saldo * 0.03);
COMMIT;