# 🎬 Projeto – Modelagem de Dados em Grafos para Serviço de Streaming

Este projeto apresenta a modelagem e implementação de um **grafo de conhecimento** para um serviço de streaming de filmes e séries, utilizando conceitos de **banco de dados orientado a grafos** (ex: Neo4j).

O foco principal está nos **relacionamentos**, permitindo a construção de **sistemas de recomendação inteligentes**, baseados no comportamento dos usuários e nas conexões entre conteúdos, gêneros, atores e diretores.

---

## 🚀 Objetivo do Projeto

Projetar um modelo de dados em grafo capaz de:

* Representar usuários, filmes, séries e profissionais do entretenimento
* Registrar avaliações de usuários
* Facilitar recomendações baseadas em similaridade e conexões

Este projeto é ideal para fins **acadêmicos**, **portfólio profissional** e **demonstração prática** de Graph Databases.

---

## 🧠 Tecnologias e Conceitos Utilizados

* Banco de Dados em Grafo (Neo4j)
* Linguagem **Cypher**
* Modelagem de Grafos
* Sistemas de Recomendação
* Knowledge Graph

---

## 🧩 Modelo de Dados

### 📌 Nós (Entidades)

* `User`
* `Movie`
* `Series`
* `Genre`
* `Actor`
* `Director`

### 🔗 Relacionamentos

| Relacionamento | Origem → Destino          | Propriedades |
| -------------- | ------------------------- | ------------ |
| `WATCHED`      | User → Movie / Series     | `rating`     |
| `ACTED_IN`     | Actor → Movie / Series    | —            |
| `DIRECTED`     | Director → Movie / Series | —            |
| `IN_GENRE`     | Movie / Series → Genre    | —            |

---

## 🗺️ Diagrama Visual do Grafo

```mermaid
graph TD
    User -->|WATCHED rating| Movie
    User -->|WATCHED rating| Series

    Actor -->|ACTED_IN| Movie
    Actor -->|ACTED_IN| Series

    Director -->|DIRECTED| Movie
    Director -->|DIRECTED| Series

    Movie -->|IN_GENRE| Genre
    Series -->|IN_GENRE| Genre

```

---

## 📂 Estrutura do Repositório

```text
📦 graph-streaming-model
 ┣ 📄 README.md
 ┣ 📄 streaming_graph.cypher
```

* `streaming_graph.cypher`: Script responsável por criar constraints e popular o banco de dados

---

## ⚙️ Funcionalidades Possíveis

Com esse modelo, é possível responder perguntas como:

* 🎯 Quais filmes recomendar para usuários que gostam de Sci‑Fi?
* 🎯 Usuários que assistiram *Matrix* também assistiram quais conteúdos?
* 🎯 Quais atores aparecem em conteúdos mais bem avaliados?
* 🎯 Quais diretores são mais populares entre usuários com nota média alta?

---

## 📈 Possíveis Expansões

* Algoritmos de recomendação (similaridade de usuários)
* Adição de relacionamento `FAVORITE`
* Integração com APIs
* Visualização avançada no Neo4j Bloom

---

## 👨‍💻 Autor

João Marcos Araújo Lima

Entusiasta de Dados | Bancos de Dados | Grafos | Cloud & IA

Profissional em formação na área de Tecnologia da Informação, com foco em engenharia de dados, modelagem de bancos de dados e soluções baseadas em grafos. Possui interesse especial em:

Bancos de dados orientados a grafos (Neo4j, Cosmos DB)

Modelagem de dados e sistemas de recomendação

Cloud Computing e Inteligência Artificial

Desenvolvimento de projetos práticos para portfólio

📌 Este projeto foi desenvolvido com o objetivo de demonstrar habilidades em modelagem de grafos, pensamento relacional e boas práticas de documentação técnica, sendo ideal para avaliação acadêmica e profissional.

🌐 **GitHub**  
 
👉 [![GitHub](https://img.shields.io/badge/GitHub-jmarcosaraujo-181717?logo=github&logoColor=white)](https://github.com/jmarcosaraujo)  

💼 **LinkedIn**  

👉 [![LinkedIn](https://img.shields.io/badge/LinkedIn%20João%20Marcos%20Araújo-0A66C2?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jo%C3%A3o-marcos-ara%C3%BAjo-lima-07b032214/)


⭐ Se este projeto foi útil ou inspirador, considere deixar uma estrela no repositório!
