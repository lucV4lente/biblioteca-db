--Inicio das consultas

SELECT * FROM AUTOR;

SELECT titulo FROM LIVRO;

SELECT titulo, genero FROM LIVRO;

SELECT nome, email FROM USUARIO;

SELECT data_emprestimo, data_prevista_devolucao, valor_multa FROM EMPRESTIMO;

--Consultas condicionadas

SELECT titulo FROM LIVRO
WHERE genero = 'Fantasia';

SELECT nome, email FROM USUARIO
WHERE nome = 'Luka';

SELECT data_emprestimo, valor_multa FROM EMPRESTIMO
WHERE valor_multa > 0;

SELECT id_livro, id_usuario, data_emprestimo FROM EMPRESTIMO
WHERE data_devolucao IS NULL;

SELECT id_livro, id_usuario, data_devolucao FROM EMPRESTIMO
WHERE data_devolucao IS NOT NULL;

--Consultas ordenadas

SELECT titulo, data_publicacao FROM LIVRO
ORDER BY data_publicacao;

SELECT titulo, genero, data_publicacao FROM LIVRO
ORDER BY genero, data_publicacao;

SELECT titulo, data_publicacao FROM LIVRO
WHERE EXTRACT(YEAR FROM data_publicacao) > 1950
ORDER BY data_publicacao;

SELECT titulo, genero, data_publicacao FROM LIVRO
WHERE EXTRACT(YEAR FROM data_publicacao) > 1950 AND genero = 'Fantasia';

SELECT titulo, genero FROM LIVRO
WHERE genero = 'Fantasia' OR genero = 'Mangá';

SELECT titulo, genero, data_publicacao FROM LIVRO
WHERE (genero = 'Fantasia' OR genero = 'Mangá')
AND EXTRACT(YEAR FROM data_publicacao) > 1950;

--Consultas com Join

SELECT LIVRO.titulo, AUTOR.nome FROM LIVRO
JOIN AUTOR ON LIVRO.id_autor = AUTOR.id_autor;

SELECT USUARIO.nome, EMPRESTIMO.data_emprestimo FROM USUARIO
JOIN EMPRESTIMO ON EMPRESTIMO.id_usuario = USUARIO.id_usuario;

SELECT LIVRO.titulo, EMPRESTIMO.data_emprestimo FROM LIVRO
JOIN EMPRESTIMO ON LIVRO.id_livro = EMPRESTIMO.id_livro;

SELECT USUARIO.nome, LIVRO.titulo, EMPRESTIMO.data_emprestimo FROM USUARIO
JOIN EMPRESTIMO ON USUARIO.id_usuario = EMPRESTIMO.id_usuario
JOIN LIVRO ON EMPRESTIMO.id_livro = LIVRO.id_livro;

SELECT USUARIO.nome as usuario, LIVRO.titulo as livro, EMPRESTIMO.data_emprestimo, AUTOR.nome as autor FROM USUARIO
JOIN EMPRESTIMO ON USUARIO.id_usuario = EMPRESTIMO.id_usuario
JOIN LIVRO ON EMPRESTIMO.id_livro = LIVRO.id_livro
JOIN AUTOR ON LIVRO.id_autor = AUTOR.id_autor;

SELECT USUARIO.nome, LIVRO.titulo, EMPRESTIMO.data_emprestimo FROM USUARIO
JOIN EMPRESTIMO ON EMPRESTIMO.id_usuario = USUARIO.id_usuario
JOIN LIVRO ON LIVRO.id_livro = EMPRESTIMO.id_livro
WHERE data_devolucao IS NULL;

SELECT USUARIO.nome, LIVRO.titulo, EMPRESTIMO.valor_multa FROM USUARIO
JOIN EMPRESTIMO ON USUARIO.id_usuario = EMPRESTIMO.id_usuario
JOIN LIVRO ON LIVRO.id_livro = EMPRESTIMO.id_livro
WHERE valor_multa > 0;

SELECT USUARIO.nome, LIVRO.titulo, EMPRESTIMO.data_prevista_devolucao, AUTOR.nome FROM USUARIO
JOIN EMPRESTIMO ON USUARIO.id_usuario = EMPRESTIMO.id_usuario
JOIN LIVRO ON LIVRO.id_livro = EMPRESTIMO.id_livro
JOIN AUTOR ON AUTOR.id_autor = LIVRO.id_autor
WHERE data_devolucao IS NULL
ORDER BY data_prevista_devolucao;

SELECT USUARIO.nome, LIVRO.titulo, EMPRESTIMO.data_emprestimo, EMPRESTIMO.data_devolucao FROM USUARIO
JOIN EMPRESTIMO ON USUARIO.id_usuario = EMPRESTIMO.id_usuario
JOIN LIVRO ON LIVRO.id_livro = EMPRESTIMO.id_livro
WHERE data_devolucao IS NOT NULL
ORDER BY data_devolucao DESC;

SELECT USUARIO.nome, LIVRO.titulo, EMPRESTIMO.valor_multa FROM USUARIO
JOIN EMPRESTIMO ON EMPRESTIMO.id_usuario = USUARIO.id_usuario
JOIN LIVRO ON LIVRO.id_livro = EMPRESTIMO.id_livro
ORDER BY valor_multa DESC;

--Consultas filtradas

SELECT titulo, genero from LIVRO
WHERE genero IN ('Fantasia', 'Mangá', 'Cálculo');

SELECT titulo, data_publicacao FROM LIVRO
WHERE EXTRACT(YEAR FROM data_publicacao) BETWEEN 1970 AND 2010;

SELECT titulo FROM LIVRO
WHERE titulo LIKE 'A%';

SELECT titulo FROM LIVRO
WHERE titulo LIKE '%1';

--Consultas agregadas

SELECT COUNT(id_livro) FROM LIVRO;

SELECT COUNT(EMPRESTIMO.id_emprestimo), USUARIO.nome FROM EMPRESTIMO
JOIN USUARIO ON EMPRESTIMO.id_usuario = USUARIO.id_usuario
GROUP BY USUARIO.nome;

SELECT SUM(valor_multa) FROM EMPRESTIMO;

SELECT COUNT(*) AS quantidade_livros
FROM LIVRO;

SELECT SUM(valor_multa) AS total_multas
FROM EMPRESTIMO;

SELECT AVG(valor_multa) AS media_multas
FROM EMPRESTIMO;

SELECT MAX(valor_multa) AS maior_multa
FROM EMPRESTIMO;

SELECT MIN(valor_multa) AS menor_multa
FROM EMPRESTIMO;

--Grupos filtrados

SELECT USUARIO.nome, COUNT(EMPRESTIMO.id_emprestimo) AS quantidade_emprestimos
FROM EMPRESTIMO
JOIN USUARIO ON EMPRESTIMO.id_usuario = USUARIO.id_usuario
WHERE EMPRESTIMO.data_devolucao IS NOT NULL
GROUP BY USUARIO.nome
HAVING COUNT(EMPRESTIMO.id_emprestimo) >= 1;

--Subconsulta

SELECT titulo, data_publicacao
FROM LIVRO
WHERE id_autor IN (
    SELECT id_autor
    FROM AUTOR
    WHERE nacionalidade = 'Brasileiro'
);