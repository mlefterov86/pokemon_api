# Pokemon API


## Table of Contents

* [Introduction](#introduction)
* [Install project](#install_project)
* [Prepopulate database](#fill_in_db)
* [Endpoints](#endpoints)
* [Swagger](#Swagger)
* [Server host](#server_host)


<a name="introduction"></a>
## Introduction

Pokemon api is a simple api consuming data from https://pokeapi.co/docs/v2 for storing pokemons and their types.

<a name="install_project"></a>
## Install project
* clone depository -> https://github.com/mlefterov86/pokemon_api
* run -> `bundle exec intall`
* create DB -> `bundle exec rake db:create` 
* run migrations -> `bundle exec rake db:migrate`
* [Prepopulate database](#fill_in_db)
* start rails server locally -> `bundle exec rails s`
* [Use endpoints](#endpoints)
* Run unit test locally `bundle exec rspec` (OPTIONAL)

<a name="fill_in_db"></a>
## Prepopulate database
There are two options to consume pokemons data into the databse
* Run a rake job (manually or via scheduler(CI integrated app or server cron)) - this job will prepopulate DB with data for pokemons and their types
  - `$ bundle exec rake fill_pokemon_database`
* Visit the following endpoint - does the same as the rake job above and returns the count of pokemons and their types from DB
  - `{server_host}/api/v1/consume_pokemons_data`

<a name="endpoints"></a>
## Endpoints

There are two endpoints
* List pokemons - lists all the pokemons stored in DB
  - endpoint -> `{server_host}/api/v1/pokemon`
* List pokemon - lists a pokemon stored in DB by external_id (external_id is the id of the pokemon from https://pokeapi.co/docs/v2/pokemon reponse id)
  - endpoint -> `{server_host}/api/v1/pokemon/1`

<a name="Swagger"></a>
## Swagger
Please copy the content of `swagger.yaml` file and paste it in a online swagger editor (for example https://editor.swagger.io/)

<a name="server_host"></a>
## Test App is deployed to Heroku 
Since app is deployed into a testing env on Heroku `{server_host} == 'https://mlefterov-pokemon-api-test-123.herokuapp.com/'` and you can use it in [Endpoints](#endpoints) and [Prepopulate database](#fill_in_db)
