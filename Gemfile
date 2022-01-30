source 'https://rubygems.org'

gemspec

group :development, :test do
  gem 'pry-byebug'
  gem 'rake'
end

group :development do
  # lock to a specific version to prevent breaking CI when new versions come out
  gem 'sorbet', '= 0.5.6433'
  gem 'parlour', '~> 6.0'
end

group :test do
  gem 'rspec', '~> 3.0'
end
