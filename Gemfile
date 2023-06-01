source 'https://rubygems.org'

gemspec

group :development, :test do
  gem 'pry-byebug'
  gem 'rake'
end

group :development do
  # lock to a specific version to prevent breaking CI when new versions come out
  gem 'sorbet', '= 0.5.10851'
  gem 'tapioca', '~> 0.11'
  gem 'parlour', '~> 8.0'
  gem 'curdle', '~> 1.2'
end

group :test do
  gem 'rspec', '~> 3.0'
end
