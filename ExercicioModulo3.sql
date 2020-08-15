CREATE DATABASE venda_cursos;

USE venda_cursos;

CREATE TABLE tipo
(
	codigo int unsigned not null auto_increment,
    tipo varchar(45) not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE instrutor
(
	codigo int unsigned not null auto_increment,
    instrutor varchar(45) not null,
    telefone int unsigned not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE aluno
(
	codigo int unsigned not null auto_increment,
    aluno varchar(45) not null,
    endereco varchar(45) not null default '',
    email varchar(45) not null default '',
    PRIMARY KEY (codigo)
);

CREATE TABLE pedido
(
	codigo int unsigned not null auto_increment,
    codigo_aluno int unsigned not null,
    data_pedido date not null,
    hora_pedido time not null,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_codigo_aluno FOREIGN KEY (codigo_aluno) REFERENCES aluno (codigo)
);

CREATE TABLE curso
(
	codigo int unsigned not null auto_increment,
    codigo_tipo int unsigned not null,
    codigo_instrutor int unsigned not null,
    curso varchar(45) not null,
    valor float unsigned not null,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_codigo_tipo FOREIGN KEY (codigo_tipo) REFERENCES tipo (codigo),
    CONSTRAINT fk_codigo_instrutor FOREIGN KEY (codigo_instrutor) REFERENCES instrutor (codigo)
);

CREATE TABLE pedido_detalhe
(
	codigo_pedido int unsigned not null,
    codigo_curso int unsigned not null,
    valor float unsigned not null,
    CONSTRAINT fk_codigo_pedido FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo),
    CONSTRAINT fk_codigo_curso FOREIGN KEY (codigo_curso) REFERENCES curso (codigo)
);

CREATE INDEX alunos ON pedido (codigo_aluno);
CREATE INDEX tipos ON curso (codigo_tipo);
CREATE INDEX instrutores ON curso (codigo_instrutor);
CREATE INDEX pedidos ON pedido_detalhe (codigo_pedido);
CREATE INDEX cursos ON pedido_detalhe (codigo_curso);

ALTER TABLE aluno ADD data_nascimento varchar(10);
ALTER TABLE aluno CHANGE COLUMN data_nascimento nascimento date;
CREATE INDEX alunos ON aluno (aluno);
ALTER TABLE instrutor ADD email varchar(100);
CREATE INDEX instrutores ON instrutor (codigo);
ALTER TABLE instrutor DROP COLUMN email;

ALTER TABLE instrutor CHANGE COLUMN telefone telefone VARCHAR(9) NULL;
ALTER TABLE curso CHANGE COLUMN valor valor DOUBLE NOT NULL;
ALTER TABLE pedido DROP COLUMN hora_pedido;
ALTER TABLE pedido CHANGE COLUMN data_pedido data_pedido DATETIME NOT NULL;
ALTER TABLE pedido_detalhe CHANGE COLUMN valor valor DOUBLE NOT NULL;