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
  generator = KubeDSL::Generator.new(
    '/Users/cameron/workspace/kubernetes-json-schema/v1.17.0-local'
  )

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
end
