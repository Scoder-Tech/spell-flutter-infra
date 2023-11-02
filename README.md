
# Flutter Infrastructure Scoder

O Flutter Infrastructure Scoder é um pacote com objetivo de flexibilizar a estruturação de novos projetos, manter os padroes entre projetos e melhor manutenção de projetos já existentes na Scoder.



## Instalação

Instale em pubspec.yaml

```bash
  flutter_infra_scoder:
    git:
      url: git@github.com:Scoder-Tech/flutter_infra_scoder.git
      ref: main
```

O campo `ref` tem o objetivo de "apontar" para qual branch será utilizada versão do pacote

OBRIGATÓRIO: O patote flutter_infra_scoder não é público e não será disponibilizado no pub.dev, ou seja, é OBRIGATÓRIO o uso da chave SSH em seu computador, para saber como instalar [clique aqui](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
## Documentação

#### Módulo HTTP

```BaseHttp
BaseHttp
```

| Objetivo   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `Requests HTTP` | `abstract class` | **Obrigatório**: Implementação |

O Móduto HTTP é uma abstração do pacote DIO que facilita a Requests HTTP.

Para implementar você deve estender o BaseHttp e adicionar um contrutor super(baseUrl: '')

Exmeplo: 

```BasHttpImpeHttp
 HttpImp() : super(baseUrl: 'https://jsonplaceholder.typicode.com/');

```
É obrigatório também adicionar `@override` de `onRequest(RequestOptions, RequestInterceptorHandler)` e `onError(DioException, ErrorInterceptorHandler)`  
## Como contribuir

Contribuições são sempre bem-vindas! 

- Por favor, siga o `código de conduta` desse projeto.
- Adicione na documentação a estrutura desse projeto
- Utilize o https://readme.so/pt/editor para editar o README

### Contribuições

- [@samuelbrandani](https://www.github.com/samuelbrandani)

