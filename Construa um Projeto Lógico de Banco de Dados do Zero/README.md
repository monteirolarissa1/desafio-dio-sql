# Planejamento de Colheita Florestal

Este projeto foi desenvolvido em **MySQL** com foco em representar um modelo de dados empresarial voltado para o **planejamento e controle de colheita florestal**, inspirado em operações de grandes empresas do setor como Suzano, Klabin e Arauco.

---

## Objetivo

Modelar e consultar informações relacionadas a fazendas, talhões, espécies, plantios, inventários, ordens de colheita, equipamentos e custos operacionais.

O banco foi projetado para apoiar atividades de **planejamento florestal**, fornecendo visões sobre produtividade, volume colhido, utilização de equipamentos e custos.

---

**OBS: este projeto é resposta de um desafio proposto pelo Bootcamp de Analise de dados, parceria entre a plataforma Dio e Klabin.**

O repositório com o desafio original pode ser encontrado em: [Desafio SQL Curso - Juliana Mascarenhas](https://github.com/julianazanelatto/mysql_sql_database_specialist/tree/main/M%C3%B3dulo%203/desafio)

---

## Modelo Lógico

**Tabelas principais:**

* **fazenda:** dados cadastrais e área total das propriedades florestais.
* **talhao:** compartimentos (unidades de manejo) com área e tipo de solo.
* **especie:** espécies florestais e seu ciclo médio.
* **plantio:** registros de plantios por talhão.
* **inventario:** volume e densidade obtidos em medições periódicas.
* **contratante:** empresas terceirizadas responsáveis pela colheita.
* **colheita_ordem:** ordens de colheita planejadas, em execução ou concluídas.
* **equipamento:** máquinas e veículos utilizados.
* **alocacao_equip:** alocação de equipamentos a ordens.
* **custo_estimado:** custos operacionais associados às ordens.

---

## Estrutura SQL

O script principal contém:

* **DDL:** criação do banco e das tabelas com chaves primárias e estrangeiras.
* **DML:** inserção de dados de exemplo.
* **Consultas SQL:** análises de volume, rendimento, custos e planejamento.



### Exemplo de criação de tabela

```sql
CREATE TABLE fazenda (
  id_fazenda INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  regiao VARCHAR(45),
  area_total_ha DECIMAL(10,2)
);
```

---

## Consultas Incluídas

1. Resumo de área e volume por talhão.
2. Volume total previsto por contratante.
3. Talhões com inventário desatualizado.
4. Rendimento médio (m³/ha) por espécie.

---

##  Diagrama Entidade-Relacionamento (ER)


> O diagrama mostra o relacionamento entre as principais entidades do sistema, incluindo fazenda → talhão → plantio → inventário → colheita_ordem, e suas conexões com contratantes, equipamentos e custos.

---

## Como Executar

1. Instale o **MySQL Server** (versão 8.0 ou superior).
2. Execute o script 'criando_tabelas' em seu cliente SQL.
3. Execute o script 'ingestão_dados' em seu cliente SQL.
4. Execute o script 'consultas' em seu cliente SQL.
5. Utilize as consultas de exemplo para testar o modelo.

---

##  Possíveis Extensões Futuras

* Integração com **GIS** (dados geoespaciais).
* Inclusão de **views** e **procedures** para automatizar relatórios.
* Cálculo de produtividade real (colheita vs inventário).
* Integração com dados de **logística e transporte**.
* Desdobramento em operações das atividades (ex: corte, arraste e traçamento).
* Criação de módulos de colheita e tipo de Modal (exemplo: CTL  e FT).
