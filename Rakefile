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
  FileUtils.rm_rf('./lib/kube-dsl/dsl')
  FileUtils.mkdir_p('./lib/kube-dsl/dsl')
  FileUtils.mkdir_p('./vendor')

  export_url = "https://github.com/instrumenta/kubernetes-json-schema/trunk/v#{KubeDSL::KUBERNETES_VERSION}-local"
  local_path = "./vendor/kubernetes-json-schema/v#{KubeDSL::KUBERNETES_VERSION}-local"

  unless File.exist?(local_path)
    system("svn export #{export_url} #{local_path}")
  end

  generator = KubeDSL::Generator.new(local_path)

  generator.resources.each do |res|
    ruby_class_path = res.ref.ruby_class_path
    puts "Writing #{ruby_class_path}"
    FileUtils.mkdir_p(File.dirname(ruby_class_path))
    File.write(ruby_class_path, res.to_ruby)
  end

  generator.each_autoload_file do |path, ruby_code|
    puts "Writing #{path}"
    File.write(path, ruby_code)
  end

  entrypoint_path = 'lib/kube-dsl/entrypoint.rb'
  puts "Writing #{entrypoint_path}"
  File.write(entrypoint_path, generator.entrypoint)
end
