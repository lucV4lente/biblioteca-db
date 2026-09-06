# Modelagem do Banco de Dados

## Entidades

O banco de dados possui quatro entidades principais:

- Autor
- Livro
- Usuário
- Empréstimo

---

## Autor

| Atributo | Descrição |
|---|---|
| id_autor | Identificador do autor |
| nome | Nome do autor |
| nacionalidade | Nacionalidade do autor |

**Chave Primária:** `id_autor`

---

## Livro

| Atributo | Descrição |
|---|---|
| id_livro | Identificador do livro |
| titulo | Título do livro |
| data_publicacao | Data de publicação |
| genero | Gênero literário |
| id_autor | Autor responsável pelo livro |

**Chave Primária:** `id_livro`

**Chave Estrangeira:** `id_autor` → `Autor(id_autor)`

---

## Usuário

| Atributo | Descrição |
|---|---|
| id_usuario | Identificador do usuário |
| nome | Nome do usuário |
| telefone | Telefone para contato |
| email | Email do usuário |

**Chave Primária:** `id_usuario`

**Chave Alternativa:** `email`

---

## Empréstimo

| Atributo | Descrição |
|---|---|
| id_emprestimo | Identificador do empréstimo |
| valor_multa | Valor da multa |
| data_emprestimo | Data em que o livro foi emprestado |
| data_prevista_devolucao | Data prevista para devolução |
| data_devolucao | Data em que o livro foi devolvido |
| id_livro | Livro relacionado ao empréstimo |
| id_usuario | Usuário responsável pelo empréstimo |

**Chave Primária:** `id_emprestimo`

**Chaves Estrangeiras:**

- `id_livro` → `Livro(id_livro)`
- `id_usuario` → `Usuário(id_usuario)`

---

# Relacionamentos

## Autor — Livro

- Um livro possui exatamente um autor.
- Um autor pode possuir zero ou vários livros.

Cardinalidade:

`Autor (0,N) — Livro (1,1)`

## Livro — Empréstimo

- Um empréstimo está relacionado a exatamente um livro.
- Um livro pode participar de zero ou vários empréstimos ao longo do tempo.

Cardinalidade:

`Livro (0,N) — Empréstimo (1,1)`

## Usuário — Empréstimo

- Um empréstimo está relacionado a exatamente um usuário.
- Um usuário pode realizar zero ou vários empréstimos ao longo do tempo.

Cardinalidade:

`Usuário (0,N) — Empréstimo (1,1)`