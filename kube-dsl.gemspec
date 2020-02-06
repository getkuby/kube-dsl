$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'kube-dsl/version'

Gem::Specification.new do |s|
  s.name     = 'kube-dsl'
  s.version  = ::KubeDSL::VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'http://github.com/camertron/kube-dsl'

  s.description = s.summary = 'A Ruby DSL for defining Kubernetes resources.'

  s.platform = Gem::Platform::RUBY

  s.require_path = 'lib'
  s.files = Dir['{lib,spec}/**/*', 'Gemfile', 'CHANGELOG.md', 'README.md', 'Rakefile', 'kube-dsl.gemspec']
end
