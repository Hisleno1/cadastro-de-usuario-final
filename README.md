
# Sistema de Cadastro de Usuários

Aplicação Java para cadastro de usuários com persistência em banco de dados SQLite, implementando táticas de integridade.

## 📋 Funcionalidades

- ✅ Cadastro de usuários
- ✅ Listagem de usuários
- ✅ Busca por ID
- ✅ Atualização de dados
- ✅ Exclusão de usuários
- ✅ Persistência em SQLite
- ✅ Constraints de integridade (UNIQUE para email e CPF)

## 🛠️ Tecnologias Utilizadas

- Java 17
- Maven
- SQLite
- Docker
- Docker Compose

## 📁 Estrutura do Projeto

```
cadastro-usuarios/
├── src/
│   └── main/
│       └── java/
│               └── exemplo/
│                   └── usuario/
│                       ├── User.java
│                       ├── UserDAO.java
│                       └── Main.java
├── pom.xml
├── Dockerfile
├── docker-compose.yml
├── .gitignore
└── README.md
```

## 🚀 Como Executar

### Pré-requisitos

- Docker
- Docker Compose

### Opção 1: Usando Docker Compose (Recomendado)

1. Clone o repositório:
```bash
git clone https://github.com/LenilsonAlves/Sistema-de-Cadastro-de-Usuario.git
cd cadastro-usuarios
```

2. Execute com Docker Compose:
```bash
docker-compose up --build
```

3. Para interagir com a aplicação:
```bash
docker exec -it cadastro-usuarios-app java -jar /app/cadastro-usuarios.jar
```

### Opção 2: Usando Docker

1. Build da imagem:
```bash
docker build -t cadastro-usuarios .
```

2. Execute o container:
```bash
docker run -it --rm -v $(pwd)/data:/app/data cadastro-usuarios
```

### Opção 3: Execução Local (sem Docker)

1. Compile o projeto:
```bash
mvn clean package
```

2. Execute o JAR:
```bash
java -jar target/cadastro-usuarios.jar
```

## 🗃️ Banco de Dados

O banco de dados SQLite será criado automaticamente no diretório `/app/data` (dentro do container) ou `./data` (no host).

### Estrutura da Tabela

```sql
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    cpf TEXT NOT NULL UNIQUE,
    telefone TEXT
);
```

### Táticas de Integridade Implementadas

1. **Integridade de Entidade**: Chave primária (id) autoincremental
2. **Integridade de Domínio**: Campos NOT NULL para dados obrigatórios
3. **Integridade Referencial**: Constraints UNIQUE para email e CPF
4. **Validação**: PreparedStatements para prevenir SQL Injection

## 📝 Menu da Aplicação

```
--- MENU ---
1. Cadastrar usuário
2. Listar usuários
3. Buscar usuário por ID
4. Atualizar usuário
5. Deletar usuário
0. Sair
```

## 🔒 Segurança

- Uso de PreparedStatements para evitar SQL Injection
- Validação de constraints no banco de dados
- Tratamento de exceções

## 📦 Build e Deploy

### Gerar JAR

```bash
mvn clean package
```

O JAR executável será gerado em `target/cadastro-usuarios.jar`

### Build da Imagem Docker

```bash
docker build -t cadastro-usuarios:1.0 .
```

### Publicar no Docker Hub (opcional)

```bash
docker tag cadastro-usuarios:1.0 seuusuario/cadastro-usuarios:1.0
docker push seuusuario/cadastro-usuarios:1.0
```

## 🧪 Testes

Para testar a aplicação:

1. Execute a aplicação
2. Cadastre alguns usuários
3. Teste as operações CRUD
4. Verifique a persistência reiniciando a aplicação

## 👥 Autores

- Lenilson Alves

## 📄 Licença

Este projeto foi desenvolvido como atividade acadêmica.

## 🎯 Objetivo

Praticar a implementação de táticas de integridade em aplicações Java com persistência de dados, utilizando containers Docker para facilitar o deploy e execução.
>>>>>>> ce89b15 (Implementação do sistema de cadastro de usuários com táticas de integridade)
