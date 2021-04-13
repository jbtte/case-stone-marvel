# My Marvel World
## Apresentação
O presente projeto implementa uma aplicação em que o usuário pode encontrar todas as informações sobre as comics e characters da marvel e favoritar tanto um como outro. Ele busca informações da [API disponibilizada pela Marvel](developer.marvel.com).

**Live link: https://my-marvel-world.herokuapp.com/**

## Recursos
Este aplicativo pode:
* Cadastrar usuário e efetuar login/logout;
* Possibilitar a edição das informações do usuário;
* Listar comics a personagens a partir de uma busca
* Mostrar paginas individuais de comics e personagens com informações adicionais
* Mostrar nas páginas de comics indicar os personagens que estão naquela edição
* Mostrar nas páginas de personagens as comics que ele participa
* Possibilitar favoritar e desfavoritar comics e personagens
* Pagina como os personagens e comics favoritos

## Dependências

<table>
  <tr>
    <td>rake 13.0.3</td>
    <td>i18n 1.8.10</td>
    <td>minitest 5.14.4</td>
  </tr>
  <tr>
    <td>zeitwerk 2.4.2</td>
    <td>activesupport 6.0.3.6</td>
    <td>builder 3.2.4</td>
  </tr>
  <tr>
    <td>erubi 1.10.0</td>
    <td>mini_portile2 2.5.0</td>
    <td>rails-dom-testing 2.0.3</td>
  </tr>
  <tr>
    <td>rails-html-sanitizer 1.3.0</td>
    <td>rack 2.2.3</td>
    <td>rack-test 1.1.0</td>
  </tr>
  <tr>
    <td>websocket-extensions 0.1.5</td>
    <td>websocket-driver 0.7.3</td>
    <td>activemodel 6.0.3.6</td>
  </tr>
  <tr>
    <td>activerecord 6.0.3.6</td>
    <td>addressable 2.7.0</td>
    <td>bundler 2.1.4</td>
  </tr>
  <tr>
    <td>capybara 3.35.3</td>
    <td>byebug 11.1.3</td>
    <td>excon 0.79.0</td>
  </tr>
  <tr>
    <td>devise 4.7.3</td>
    <td>dotenv 2.7.6</td>
    <td>dotenv-rails 2.7.6</td>
  </tr>
  <tr>
    <td>font-awesome-sass 5.15.1</td>
    <td>jquery-rails 4.4.0</td>
    <td>pry-byebug 3.9.0</td>
  </tr>
  <tr>
    <td>sprockets 4.0.2</td>
    <td>sprockets-rails 3.2.2</td>
    <td>rails 6.0.3.6</td>
  </tr>
  <tr>
    <td>sassc-rails 2.1.2</td>
    <td>sass-rails 6.0.0</td>
    <td>selenium-webdriver 3.142.7</td>
  </tr>
  <tr>
    <td>turbolinks 5.2.1</td>
    <td>turbolinks_render 0.9.21</td>
    <td>web-console 4.1.0</td>
  </tr>
  <tr>
    <td>webdrivers 4.6.0</td>
    <td>webpacker 4.3.0</td>
  </tr>
</table>


## Como Começar
Para rodar localmente:
* clonar o repositório - git@github.com:jbtte/case-stone-marvel.git
* `cd case-stone-marvel`
* `ruby -v` ( ~2.6.6 caso contrário instalar ruby (pode demorar)
* `bundle` (Instalar as dependências)
* `rails db:create db:migrate` (Criar o banco de dados)
* `rails s` (rodar o servidor)
* Abrir navegador e visitar localhost:3000

## Lançamentos principais
Este projeto foi desenvolvido como parte de processo seletivo para o cargo de desenvolvedor em empresa no ramo financeiro.

## ToDo List
* Possibilitar que usuário possa pedir para ver mais comics na página do personagem (atualmente limitado à primeira resposta da API)
* Aumentar a qualidade da imagem "Marvel" inicial
* Possibilitar que o usuário promova a pesquisa tanto de comics como de personagem por meio da mesma barra de pesquisa
* Trocar o front-end para react
* Melhorar a forma de favoritar e desfavoritar (react)

## Status do Código
### Licença
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>

### Créditos
Rails app generated with lewagon/rails-templates, created by the Le Wagon coding bootcamp team.

@pbragamiranda - revisão geral do código
