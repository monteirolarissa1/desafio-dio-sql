# Cenário de Vendas – Consultas SQL

Este repositório contém exemplos de consultas SQL aplicadas a um **banco de dados de vendas**, com tabelas de clientes, pedidos, produtos, fornecedores, estoque e avaliações, simulando um site online de vendas de produtos de mercado.

**OBS: este projeto é resposta de um desafio proposto pelo Bootcamp de Analise de dados, parceria entre a plataforma Dio e Klabin.**

O repositório com o desafio original pode ser encontrado em: [Desafio sql curso - Juliana Mascarenhas](https://github.com/julianazanelatto/mysql_sql_database_specialist/tree/main/M%C3%B3dulo%203/desafio)

---

## Estrutura do Banco de Dados

O banco `cenario_vendas` possui as seguintes tabelas principais:

* **Cliente** – informações dos clientes (nome, CPF, endereço, data de nascimento, município e estado)
* **Pedido** – pedidos realizados, incluindo status, descrição, frete e referência ao cliente
* **Produto** – catálogo de produtos, com categoria, descrição e valor
* **Produto_pedido** – relação entre produtos e pedidos, incluindo quantidade e status do item
* **Terceiro_Vendedor** – fornecedores ou vendedores externos
* **Produtos_vendedor** – produtos associados a vendedores, com quantidade disponível
* **Fornecedor** – informações dos fornecedores
* **Produto_fornecedor** – relação produtos x fornecedores, com quantidade fornecida
* **Estoque** – locais de estoque e quantidade total disponível
* **Produto_em_Estoque** – relação produtos x estoques, com localização dentro do estoque
* **Avaliacoes** – notas e feedbacks de clientes para produtos e pedidos

OBS: A base de dados pode também ser criada em Python para ingestão de maiores quantidades de dados, utilizando bibliotecas como numpy, faker, random e mysql.connector. 


*(O script completo de criação e inserção de dados está disponível no arquivo `cenario_vendas.sql`.)*

Além disso, este repositório contém o **diagrama ERR** das tabelas para referência visual da estrutura do banco.

---

## Consultas SQL

As consultas iniciais estão disponíveis no arquivo `consultas_iniciais.sql` e foram organizadas em diferentes categorias:

### 1. Pedidos e Clientes

* Consultas que mostram pedidos junto com informações do cliente, produtos comprados, quantidade e valor total.

### 2. Análise de Pedidos

* Consultas que calculam o **valor total de pedidos**, permitem agrupar por cliente e ordenar pelos pedidos mais caros.

### 3. Estoque

* Consultas que mostram a **disponibilidade de produtos por estoque**, categorizando por tipo de produto e permitindo análises de quantidade disponível.

### 4. Avaliações

* Consultas que relacionam **notas de produtos com clientes**, permitindo gerar métricas de satisfação e classificação de produtos.

---

## Observações

* Todas as consultas podem ser executadas no **MySQL**.
* Recomenda-se criar **views** para consultas repetitivas ou análises frequentes.
* É possível combinar várias tabelas para gerar relatórios mais complexos, utilizando **JOINs**, **GROUP BY**, **HAVING** e colunas calculadas.

---

## Como usar

1. Clone este repositório:

```bash
git clone https://github.com/seu-usuario/repositorio.git
```

2. Execute o script SQL para criar o banco e popular as tabelas:

```sql
source cenario_vendas.sql;
```

3. Execute as consultas iniciais no arquivo `consultas_iniciais.sql` para analisar os dados.

---

## Badges e Recursos

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat\&logo=mysql\&logoColor=white)


**Arquivos principais:**

* [cenario_vendas.sql](cenario_vendas.sql) – Criação da estrutura e ingestão de dados
* [consultas_iniciais.sql](consultas_iniciais.sql) – Consultas e análises iniciais
* [Diagrama ERR](Modelo_refinado.png) – Diagrama de relacionamento das tabelas
S