require 'bundler'
require 'rspec/core/rake_task'
require 'rubygems/package_task'

require 'kube-dsl'
require 'pry-byebug'

Bundler::GemHelper.install_tasks

task default: :spec

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*_spec.rb'
end

task :generate do
  require 'dry/inflector'

  FileUtils.rm('./lib/kube-dsl/entrypoint.rb')
  FileUtils.rm('./lib/kube-dsl/dsl.rb')
  FileUtils.rm_rf('./lib/kube-dsl/dsl')
  FileUtils.mkdir_p('./lib/kube-dsl/dsl')
  FileUtils.mkdir_p('./vendor')

  export_url = "https://github.com/instrumenta/kubernetes-json-schema/trunk/v#{KubeDSL::KUBERNETES_VERSION}-local"
  local_path = "vendor/kubernetes-json-schema/v#{KubeDSL::KUBERNETES_VERSION}-local"

  unless File.exist?(local_path)
    system("svn export #{export_url} #{local_path}")
  end

  Dir.chdir('lib') do
    generator = KubeDSL::Generator.new(
      schema_dir: File.join('..', local_path),
      output_dir: File.join('kube-dsl', 'dsl'),
      inflector: Dry::Inflector.new do |inflections|
        inflections.acronym('DSL')

        inflections.plural('tls', 'tlses')
        inflections.singular('tls', 'tls')
      end
    )

    generator.generate
  end
end
