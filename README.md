# Relatório do Projeto: Sistema de Gerenciamento de Campeonatos

## Introdução

Este relatório apresenta uma análise detalhada do sistema de gerenciamento de campeonatos, abordando suas funcionalidades principais e a estrutura do banco de dados. O objetivo é fornecer uma visão clara sobre a arquitetura e as capacidades do sistema, que foi desenvolvido para facilitar a organização e o acompanhamento de diversos tipos de torneios esportivos.

## Tecnologias Utilizadas

O sistema de gerenciamento de campeonatos foi desenvolvido utilizando as seguintes tecnologias:

- **Java 17:** Linguagem de programação principal.
- **Spring Boot:** Framework para desenvolvimento de aplicações Java, facilitando a criação de aplicações web robustas e escaláveis.
- **Maven:** Ferramenta de automação de build e gerenciamento de dependências.
- **PostgreSQL:** Sistema de gerenciamento de banco de dados relacional, utilizado para persistência dos dados.
- **JSP (JavaServer Pages):** Tecnologia para criação de interfaces de usuário dinâmicas.
- **Apache Tomcat:** Servidor web e contêiner de servlets, utilizado para implantar a aplicação web.
- **Jakarta Servlet API e JSTL:** APIs e bibliotecas de tags para desenvolvimento de aplicações web Java.





## Funcionalidades Implementadas








# Funcionalidades Implementadas

Este documento detalha as funcionalidades implementadas no projeto de gerenciamento de campeonatos, com base na análise do código-fonte e da estrutura do banco de dados.



## Gerenciamento de Esportes

O sistema permite o cadastro, listagem, edição e exclusão de esportes. Cada esporte possui um nome e a quantidade de jogadores por time. As operações são realizadas através dos seguintes endpoints:

- **Listar Esportes:** Exibe todos os esportes cadastrados.
- **Cadastrar/Editar Esporte:** Permite adicionar um novo esporte ou modificar um existente.
- **Excluir Esporte:** Remove um esporte do sistema.




## Gerenciamento de Torneios

O sistema oferece funcionalidades para gerenciar torneios, incluindo a definição de nome, datas de início e fim, e o esporte associado. As operações disponíveis são:

- **Listar Torneios:** Apresenta uma lista de todos os torneios cadastrados.
- **Cadastrar/Editar Torneio:** Permite a criação de novos torneios ou a atualização de informações de torneios existentes.
- **Excluir Torneio:** Remove um torneio do sistema.




## Gerenciamento de Times

É possível gerenciar os times que participarão dos campeonatos. Cada time possui um nome, cidade e está associado a um esporte. As funcionalidades incluem:

- **Listar Times:** Exibe todos os times cadastrados.
- **Cadastrar/Editar Time:** Permite adicionar um novo time ou modificar um existente.
- **Excluir Time:** Remove um time do sistema.




## Gerenciamento de Partidas

O sistema permite o registro e acompanhamento de partidas, associando-as a times participantes, placares e torneios. As funcionalidades são:

- **Listar Partidas:** Exibe todas as partidas registradas.
- **Cadastrar/Editar Partida:** Permite adicionar uma nova partida ou atualizar os detalhes de uma partida existente, incluindo os times, placares e o torneio ao qual pertence.
- **Excluir Partida:** Remove uma partida do sistema.




## Gerenciamento de Usuários

O sistema inclui um módulo básico de gerenciamento de usuários, permitindo o cadastro de novos usuários com nome, email e senha. Esta funcionalidade é essencial para controlar o acesso ao sistema.

- **Cadastro de Usuário:** Permite registrar novos usuários no sistema.






## Diagrama de Entidade-Relacionamento (ER)

O diagrama ER a seguir representa a estrutura do banco de dados do sistema de gerenciamento de campeonatos, ilustrando as entidades e seus relacionamentos:

![Diagrama ER do Banco de Dados](https://private-us-east-1.manuscdn.com/sessionFile/bBllf50QSx9ummBabDAuK9/sandbox/ZXU65RROFBh3RhLyueWwPb-images_1752621153690_na1fn_L2hvbWUvdWJ1bnR1L2VyX2RpYWdyYW0.png?Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9wcml2YXRlLXVzLWVhc3QtMS5tYW51c2Nkbi5jb20vc2Vzc2lvbkZpbGUvYkJsbGY1MFFTeDl1bW1CYWJEQXVLOS9zYW5kYm94L1pYVTY1UlJPRkJoM1JoTHl1ZVd3UGItaW1hZ2VzXzE3NTI2MjExNTM2OTBfbmExZm5fTDJodmJXVXZkV0oxYm5SMUwyVnlYMlJwWVdkeVlXMC5wbmciLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE3OTg3NjE2MDB9fX1dfQ__&Key-Pair-Id=K2HSFNDJXOU9YS&Signature=dCBZ4dHwvDGlwlhJNkQEQj24935ieL2jL1Kfk8Pap5Ots1ff4R39PGpIHyk55z6YJd8pVXHoiMUC5xQOK2LO0zh3JZDNR7B-6iO5NitM8U6Q0gx3HOaEwQUOIx~trv2ZzOEVTnCooBYGWgk1fn3-F89kPjffyzPnxUCTMWUkCsjTRypaFjgaXYCuy9UJuQyANP~m8CGgJ88rDK3kAH~-5xFbjMeNVTBDgEpVYhlK54gZCbKe9oFcePOG5FsaT9tC4x4oOVWQtG7KyFllvGzZCLPBBvOBUKIOo1gCCQUcjCcs9d7HxusuUR5rxYCaWznbOTQpdkc5sNkAQsf~dT6jGA__)





## Conclusão

O sistema de gerenciamento de campeonatos oferece uma solução robusta para a administração de torneios esportivos, cobrindo desde o cadastro de esportes e times até o acompanhamento de partidas. A estrutura do banco de dados, conforme ilustrado no diagrama ER, é projetada para suportar as relações complexas entre as entidades, garantindo a integridade e a consistência dos dados. As funcionalidades implementadas fornecem uma base sólida para a gestão eficiente de campeonatos, podendo ser expandidas para incluir recursos adicionais conforme a necessidade.
