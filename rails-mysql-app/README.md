# rails-mysql-app

## Docker build & run

```
$ docker build -t rails-nginx-puma:0.1 .
$ docker run -d -p 8080:8080 -p 2222:2222 yoichikawasaki/rails-nginx-mysql-app:0.0.1
```
Bowse and check http://localhost:8080


## How to ceate a sample app
### Create a template rails project using rails command
```
$ vi Gemfile
  ----------------------------
  source "http://rubygems.org"
  gem "rails", "5.1.1"
  ----------------------------

$ bundle install --path vendor/bundle
$ bundle exec rails new <projectname> --database=mysql --skip-bundle
```

### Modify the project in order to use MySQL instead of SQLite for its database by using rails scaffolding

```
cd <projectname>
bundle install --path vendor/bundle

vi config/database.yml
-----
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: testuser
  password: testpass
  host: 127.0.0.1

development:
  <<: *default
  database: testdb
-----

$ bundle exec rails db:create
$ bundle exec rails generate scaffold article title:string text:string
$ bundle exec rails db:migrate
```

### Finally start rails server and check
```
$ bundle exec rails server
```
Browse http://localhost:3000

## To integrate the rails app with Puma and Nginx
### puma (config/puma.rb)
```
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
plugin :tmp_restart

app_root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/puma.sock"
```

### nginx
* /myapp/public を静的コンテンツとして配信
* その他を /myapp/tmp/puma.sock にプロキシ

### How to start puma and nginx manually
```
$ bundle exec puma -d
$ service nginx start
```
However you need to run nginx foreground like this when you run it in container
```
$ /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf:
```