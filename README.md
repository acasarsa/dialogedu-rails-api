# Dialogedu Rails Assessment API

## System Requirements
- [Git](https://git-scm.com/) 2.19.2
- [Rails](https://github.com/rails/rails) 6.1.3
- [Ruby](https://github.com/ruby/ruby) 3.0.0

## Setup 
```
git clone https://github.com/acasarsa/dialogedu-rails-api.git
cd dialogedu-rails-api
```
Once in the directory you can 

``` 
bundle install
rails db:create
rails db:migrate
rails s
```

## Run Tests

``` 
bundle install
rake db:create
RAILS_ENV=test rake db:migrate
rspec
```
## Test Endpoints with Postman 

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/3274caddd0434f129418)

In order to test endpoints with Postman you can follow that link and after running a POST request you'll be able to use that id(s) for the other routes. I used CAPITAL LETTERS to designate where you need to put the id value. 

## Deliverables

- [x] GET /articles
- [x] GET /articles?search=foo
  should filter article to only those containing string 'foo'
- [x] GET /articles/:id
- [x] POST /articles
  - [x] it should validate presence of title and body
  - [x] it should validate that title is at least 10 characters long
- [x] PUT /articles
  same as POST
- [x] DELETE /articles/:id

- [x] GET /comments
- [x] GET /comments?article_id=1
  should filter comments by specific article
- [x] GET /comments/:id
- [x] POST /comments
  - [x] it should validate presence of necessary attributes
- [x] PUT /comments
- [x] DELETE /comments/:id

## Write TESTS FOR THESE  
- [x] GET /articles
- [x] GET /articles?search=foo
  should filter article to only those containing string 'foo'
- [x] GET /articles/:id
- [x] POST /articles
  - [x] it should validate presence of title and body
  - [x] it should validate that title is at least 10 characters long
- [x] PUT /articles
  same as POST
- [x] DELETE /articles/:id

- [x] GET /comments
- [x] GET /comments?article_id=1
  should filter comments by specific article
- [x] GET /comments/:id
- [x] POST /comments
  - [x] it should validate presence of necessary attributes
- [x] PUT /comments
- [x] DELETE /comments/:id
