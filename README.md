## Projeto Banco de Dados: Taverna (Gerenciamento de Transações)

Este projeto de banco de dados modela um sistema de gerenciamento para uma "Taverna", abrangendo clientes, funcionários, estoque de bebidas e comidas, hospedagem e até mesmo um "quadro de missões". Inclui o modelo conceitual e o script SQL completo com a criação do esquema, consultas e exemplos de transações.

---

### 1. 🖼️ Modelo Conceitual (Diagrama de Entidade-Relacionamento)

O arquivo `Projeto Banco de Dados.drawio.jpg` apresenta o **Diagrama de Entidade-Relacionamento (DER)** do sistema.

* **Entidades Principais:**
    * **Cliente**     * **Funcionário**
    * **Comida**
    * **Bebida**
    * **Quarto**
    * **Fornecedor**
    * **Quadro de Missões**
* **Relacionamentos Chave:** A modelagem utiliza tabelas intermediárias (relacionamentos N:M) para rastrear:
    * Quais **clientes compram** quais comidas e bebidas (`compraClienteComida`, `compraClienteBebida`).
    * Quais **funcionários vendem** quais comidas e bebidas (`vendeFuncComida`, `vendeFuncBebida`).
    * As relações de **fornecimento** (`vendeFornComida`, `vendeFornBebida`).
    * **Hospedagem** (Cliente para Quarto).

---

### 2. 💾 Script SQL (`Gerenciamento de Transacoes.sql`)

Este arquivo contém o script completo para a criação e manipulação do banco de dados `Taverna`.

#### **Criação do Esquema**

O script começa criando o banco de dados `Taverna` e define todas as tabelas, estabelecendo as chaves primárias e as chaves estrangeiras (Foreign Keys) conforme o Modelo Conceitual.

* **Tabelas Funcionais:** `cargo`, `fornecedor`, `bebida`, `comida`, `quarto`, `qdmissoes` (quadro de missões).
* **Tabelas de Relacionamento (N:M):** `hospedagem`, `vendeFornBebida`, `compraClienteComida`, `atendimento`, entre outras.
* **Inserção de Dados:** Fornece comandos `INSERT INTO` para popular todas as tabelas com dados de exemplo (nomes, datas, preços, etc.).

#### **Consultas de Informação (Extração de Dados)**

O script inclui uma lista de consultas SQL para responder a diversas perguntas sobre o funcionamento da Taverna, utilizando filtros (`WHERE`), agregações (`AVG`, `COUNT`, `SUM`), e ordenação (`ORDER BY`):

* **Agregações e Médias:** Preço médio de bebidas raras e suítes, recompensa média das missões, e teor alcoólico médio.
* **Ranking:** Cliente que mais compra bife, funcionário que mais vende bebidas.
* **Filtros Complexos:** Clientes com consumo mensal acima de R$200, clientes que compram bebida mas não compram comida.
* **Busca de Correspondência:** Verifica se há fornecedores que são clientes, ou se o nome de algum cliente coincide com o nome de alguma bebida.
* **Funções de Data:** Calcula a idade do cliente mais velho.

#### **Exemplos de Transações (Integridade de Dados)**

O script finaliza com exemplos práticos de transações SQL, que utilizam o conceito de **BEGIN/COMMIT** para garantir que as operações sejam executadas de forma atômica e consistente.

* **Aumento de Preço:** Aumento de $5\%$ no preço do bife, seguido por `COMMIT` para salvar a alteração.
* **Diminuição de Preço:** Diminuição de $10\%$ no preço de todos os quartos, seguido por `COMMIT`.

---
