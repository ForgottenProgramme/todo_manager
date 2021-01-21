[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex b53c6e1..863b391 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -6,7 +6,6 @@[m [mruby '2.6.3'[m
 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'[m
 gem 'rails', '~> 6.1.1'[m
 # Use sqlite3 as the database for Active Record[m
[31m-gem 'sqlite3', '~> 1.4'[m
 # Use Puma as the app server[m
 gem 'puma', '~> 5.0'[m
 # Use SCSS for stylesheets[m
[36m@@ -54,3 +53,5 @@[m [mend[m
 [m
 # Windows does not include zoneinfo files, so bundle the tzinfo-data gem[m
 gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby][m
[32m+[m
[32m+[m[32mgem "pg", "~> 1.2"[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex aae8622..97133e8 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -106,6 +106,7 @@[m [mGEM[m
     nokogiri (1.11.1)[m
       mini_portile2 (~> 2.5.0)[m
       racc (~> 1.4)[m
[32m+[m[32m    pg (1.2.3)[m
     public_suffix (4.0.6)[m
     puma (5.1.1)[m
       nio4r (~> 2.0)[m
[36m@@ -171,7 +172,6 @@[m [mGEM[m
       actionpack (>= 4.0)[m
       activesupport (>= 4.0)[m
       sprockets (>= 3.0.0)[m
[31m-    sqlite3 (1.4.2)[m
     thor (1.1.0)[m
     tilt (2.0.10)[m
     turbolinks (5.2.1)[m
[36m@@ -209,13 +209,13 @@[m [mDEPENDENCIES[m
   capybara (>= 3.26)[m
   jbuilder (~> 2.7)[m
   listen (~> 3.3)[m
[32m+[m[32m  pg (~> 1.2)[m
   puma (~> 5.0)[m
   rack-mini-profiler (~> 2.0)[m
   rails (~> 6.1.1)[m
   sass-rails (>= 6)[m
   selenium-webdriver[m
   spring[m
[31m-  sqlite3 (~> 1.4)[m
   turbolinks (~> 5)[m
   tzinfo-data[m
   web-console (>= 4.1.0)[m
[1mdiff --git a/app/controllers/todos_controller.rb b/app/controllers/todos_controller.rb[m
[1mindex 432ff95..3abb5dd 100644[m
[1m--- a/app/controllers/todos_controller.rb[m
[1m+++ b/app/controllers/todos_controller.rb[m
[36m@@ -1,6 +1,6 @@[m
 # todos_controller.rb[m
 class TodosController < ApplicationController[m
   def index[m
[31m-    render plain: "Hello, this is /todos!"[m
[32m+[m[32m    render plain: Todo.all.to_a[m
   end[m
 end[m
[1mdiff --git a/config/database.yml b/config/database.yml[m
[1mindex 4a8a1b2..20d4f51 100644[m
[1m--- a/config/database.yml[m
[1m+++ b/config/database.yml[m
[36m@@ -1,25 +1,22 @@[m
[31m-# SQLite. Versions 3.8.0 and up are supported.[m
[31m-#   gem install sqlite3[m
[31m-#[m
[31m-#   Ensure the SQLite 3 gem is defined in your Gemfile[m
[31m-#   gem 'sqlite3'[m
[31m-#[m
 default: &default[m
[31m-  adapter: sqlite3[m
[32m+[m[32m  adapter: postgresql[m
   pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>[m
   timeout: 5000[m
 [m
 development:[m
   <<: *default[m
[31m-  database: db/development.sqlite3[m
[32m+[m[32m  host: localhost[m
[32m+[m[32m  user: postgres[m
[32m+[m[32m  password: changeme[m
[32m+[m[32m  database: saas_db[m
 [m
 # Warning: The database defined as "test" will be erased and[m
 # re-generated from your development database when you run "rake".[m
 # Do not set this db to the same as development or production.[m
 test:[m
   <<: *default[m
[31m-  database: db/test.sqlite3[m
[32m+[m[32m  database: test_saas_db[m
 [m
 production:[m
   <<: *default[m
[31m-  database: db/production.sqlite3[m
[32m+[m[32m  database: prod_saas_db[m
