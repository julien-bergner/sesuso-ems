source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.7'
group :assets do
#  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'less-rails'
  gem 'therubyracer', :platform=>:ruby
  gem 'twitter-bootstrap-rails'
end

gem 'jquery-rails'
gem 'cancan'
gem 'devise'
gem 'mysql2'
gem 'rolify'
gem 'simple_form'
gem 'uberspacify'
gem 'figaro'
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'quiet_assets'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :production do
  gem 'thin'
end
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
end
