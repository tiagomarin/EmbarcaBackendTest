<a name="readme-top"></a>

# 📖 Embarca Ai Backend Teste <a name="about-project"></a>

Fiz esse projeto para por meus conhecimentos a prova. Recebi o teste ao me candidatar a vaga de Ruby On Rails backend developer na Embarca Ai.
<br>
A equipe da Embarca Ai vai analisar e definir se eu alcançei os requisitos ou não.

## 🛠 Observações
Utilizei a metodologia **TDD** (sempre realizando testes antes) e fiz um Kanban board no Github para organizar as tarefas. Tambem fiz uma automação **CI/CD** com o **Github Actions** para que todas as Pull Requests passassem por checagem de qualidade de codigo, exigindo passar no **Rubocop** e nos testes **Rspec**.

## 🛠 Especificações Técnicas

### Tech Stack

<img alt="Ruby Badge" src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"><br>
<img alt="Ruby on Rails Badge" src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white"><br>


<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<br>

### Funcionalidades <a name="key-features"></a>

#### FRONTEND:
- **Seleção de estados**
- **Busca por cidades com ou sem estado presente na busca**
- **Testes simples para o frontend**

#### BACKEND:
- **Forte validação de dados nos Models**
- **Testes extensivos para os Models e Requests**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


## 💻 Como rodar o projeto <a name="getting-started"></a>

### Pré-requisitos

- Docker instalado em seu computador. ([guia de instalação](https://docs.docker.com/engine/install/))

### Setup

Clone esse projeto com git:
```
git clone https://github.com/tiagomarin/EmbarcaBackendTest.git

```

Em um terminal, navegue até o diretório onde o projeto se encontra e rode o comando:
```
docker-compose up

```
Certifique-se de que o servidor esteja rodando, se estiver, abra outro terminal e navegue novamente para o diretorio do projeto e rode o comando:
```
docker-compose run embarca_ai_backend rake db:create db:migrate db:seed

```



### Como usar

Abra o navegador e digite(ou copie) na barra de endereços:

http://127.0.0.1:3000/cities


### Rodar testes

Para rodar os testes, abra um terminal, navegue até o diretório do projeto e rode o comando:

```
  bundle exec rspec
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## Author <a name="author"></a>

👤 **Tiago Lelinski**

- GitHub: [@tiagomarin](https://github.com/tiagomarin)
- Twitter: [@LelinskiMarin](https://twitter.com/LelinskiMarin)
- LinkedIn: [Tiago](https://www.linkedin.com/in/tiago-lelinski-marin/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Agradecimentos <a name="acknowledgements"></a>

Obrigado equipe de RH da Embarca Ai por me dar essa oportunidade de mostrar meus conhecimentos.


<p align="right">(<a href="#readme-top">back to top</a>)</p>



## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
