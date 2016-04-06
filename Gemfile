source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '5.0.0.beta2'
gem 'puma'
gem 'pg'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'devise', github: 'plataformatec/devise'
gem 'redis'
gem 'pg_search'
gem 'sass-rails'
gem 'jquery-rails'
gem 'uglifier'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'autoprefixer-rails'
gem 'cloudinary'
gem 'carrierwave'
gem 'nokogiri'

# ActiveAdmin needs a newer version of Kaminari to fix this:
# http://stackoverflow.com/questions/34413971/rails-5-0-0-beta1-generating-an-url-from-non-sanitized-request-parameters-is-i
gem 'activeadmin', github: 'yanperron/activeadmin'
gem 'kaminari', github: 'amatsuda/kaminari'

gem 'sidekiq'
gem 'sinatra', github: 'sinatra'
gem 'sidekiq-failures'

group :development, :test do
  gem 'binding_of_caller'
  gem 'better_errors'

  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor'
end
