# Requisitos do Sistema

## Descrição

O projeto consiste no desenvolvimento de um banco de dados para gerenciar uma biblioteca.

O sistema deve permitir o controle de autores, livros, usuários e empréstimos.

## Requisitos Funcionais

O sistema deve permitir:

- Cadastrar autores.
- Cadastrar livros.
- Associar cada livro a um autor.
- Cadastrar usuários da biblioteca.
- Registrar empréstimos de livros.
- Registrar a data em que um livro foi emprestado.
- Registrar a data prevista para devolução.
- Registrar a data real de devolução.
- Controlar multas relacionadas a atrasos na devolução.

## Regras de Negócio

- Cada livro deve possuir exatamente um autor.
- Um autor pode possuir zero ou vários livros cadastrados.
- Cada empréstimo deve estar relacionado a exatamente um livro.
- Um livro pode participar de vários empréstimos ao longo do tempo.
- Um livro não pode possuir mais de um empréstimo ativo simultaneamente.
- Cada empréstimo deve estar relacionado a exatamente um usuário.
- Um usuário pode realizar vários empréstimos ao longo do tempo.
- A data de devolução pode ser nula enquanto o livro ainda não foi devolvido.
- O valor da multa deve iniciar em zero quando não houver atraso.