$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'kube-dsl/version'

Gem::Specification.new do |s|
  s.name     = 'kube-dsl'
  s.version  = ::KubeDSL::VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'http://github.com/getkuby/kube-dsl'

  s.description = s.summary = 'A Ruby DSL for defining Kubernetes resources.'

  s.add_dependency 'dry-inflector', '~> 0.2'

  s.require_path = 'lib'
  s.files = Dir['{lib,spec}/**/*', 'Gemfile', 'LICENSE', 'CHANGELOG.md', 'README.md', 'Rakefile', 'kube-dsl.gemspec']
end
