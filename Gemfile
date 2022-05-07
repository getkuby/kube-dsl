source 'https://rubygems.org'

gemspec

group :development, :test do
  gem 'pry-byebug'
  gem 'rake'
end

group :development do
  # lock to a specific version to prevent breaking CI when new versions come out
  gem 'sorbet'
  gem 'tapioca', '~> 0.7'
  gem 'parlour', github: 'camertron/parlour', branch: 'initialize_void' # '~> 7.0'
  gem 'curdle', '~> 1.2'
end

group :test do
  gem 'rspec', '~> 3.0'
end
