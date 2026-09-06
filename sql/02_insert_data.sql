INSERT INTO AUTOR (nome, nacionalidade)
VALUES
    ('Franz Kafka', 'Tcheco'),
    ('Clarice Lispector', 'Brasileira'),
    ('Neil Gaiman', 'Britânico'),
    ('Hamilton Luiz Guidorizzi', 'Brasileiro'),
    ('Hitoshi Iwaaki', 'Japonês');



INSERT INTO USUARIO(nome, telefone, email)
VALUES
    ('Luka', '(91) 99999-0001', 'luka@example.com'),
    ('Chris', '(91) 99999-0002', 'chris@example.com'),
    ('Anya', '(91) 99999-0003', 'anya@example.com'),
    ('Lucas', '(91) 99999-0004', 'lucas@example.com'),
    ('Gabriel', '(91) 99999-0005', 'gabriel@example.com');



INSERT INTO LIVRO (titulo, data_publicacao, genero, id_autor)
VALUES
    ('A Metamorfose', '1915-01-01', 'Ficção', 1),
    ('A Hora da Estrela', '1977-01-01', 'Novela', 2),
    ('Coraline', '2002-07-02', 'Fantasia', 3),
    ('Um Curso de Cálculo Vol. 1', '2018-07-20', 'Cálculo', 4),
    ('Parasyte', '1988-01-01', 'Mangá', 5);



INSERT INTO EMPRESTIMO (
    valor_multa,
    data_emprestimo,
    data_prevista_devolucao,
    data_devolucao,
    id_livro,
    id_usuario
)
VALUES
    (0, '2026-08-20', '2026-09-03', NULL, 5, 1),
    (0, '2026-07-01', '2026-07-15', '2026-07-10', 1, 3),
    (25.00, '2026-06-01', '2026-06-15', '2026-06-20', 4, 4),
    (0, '2026-07-10', '2026-07-24', '2026-07-22', 3, 2),
    (0, '2026-08-25', '2026-09-08', NULL, 2, 5);