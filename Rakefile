require 'bundler'
require 'rspec/core/rake_task'
require 'rubygems/package_task'

require 'kube-dsl'

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
    FileUtils.mkdir_p(File.dirname(res.ref.ruby_class_path))
    File.write(res.ref.ruby_class_path, res.to_ruby)
  end
end
