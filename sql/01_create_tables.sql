CREATE TABLE AUTOR (
    id_autor INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome varchar(50) NOT NULL,
    nacionalidade varchar(20)
);

CREATE TABLE USUARIO (
    id_usuario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome varchar(50) NOT NULL,
    telefone varchar(20) NOT NULL,
    email varchar(50) NOT NULL UNIQUE
);

CREATE TABLE LIVRO (
    id_livro INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo varchar(50) NOT NULL,
    data_publicacao DATE NOT NULL,
    genero VARCHAR(25),
    id_autor INTEGER NOT NULL REFERENCES AUTOR(id_autor)
);

CREATE TABLE EMPRESTIMO (
    id_emprestimo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    valor_multa NUMERIC(10,2) NOT NULL DEFAULT 0,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    id_livro INTEGER NOT NULL REFERENCES LIVRO(id_livro),
    id_usuario INTEGER NOT NULL REFERENCES USUARIO(id_usuario)
);