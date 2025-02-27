require 'bundler'
require 'rspec/core/rake_task'
require 'curdle'

Curdle::Tasks.install

require 'kube-dsl'
require 'pry-byebug'

task default: :spec

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*_spec.rb'
end

task :generate do
  require 'dry/inflector'
  require 'fileutils'

  FileUtils.mkdir_p('./vendor')

  export_url = "https://github.com/yannh/kubernetes-json-schema"
  local_checkout_path = "vendor/kubernetes-json-schema/"

  unless File.exist?(local_checkout_path)
    system("git clone -n --depth 1 --filter tree:0 #{export_url} #{local_checkout_path}")

    Dir.chdir(local_checkout_path) do
      system("git sparse-checkout set --no-cone /v#{KubeDSL::KUBERNETES_VERSION}-local")
      system("git checkout")
    end
  end

  local_schema_path = "#{local_checkout_path}v#{KubeDSL::KUBERNETES_VERSION}-local"

  FileUtils.rm_rf('./lib/kube-dsl/entrypoint.rb')
  FileUtils.rm_rf('./lib/kube-dsl/dsl.rb')
  FileUtils.rm_rf('./lib/kube-dsl/dsl')
  FileUtils.rm_rf('./sorbet/rbi/kube-dsl')

  FileUtils.mkdir_p('./lib/kube-dsl/dsl')

  generator = KubeDSL::Generator.new(
    schema_dir: local_schema_path,
    output_dir: File.join('lib'),
    autoload_prefix: File.join('kube-dsl', 'dsl'),
    dsl_namespace: ['KubeDSL', 'DSL'],
    entrypoint_namespace: ['KubeDSL'],
    inflector: Dry::Inflector.new do |inflections|
      inflections.acronym('DSL')

      inflections.singular('tls', 'tls')
      inflections.singular('causes', 'cause')

      inflections.plural('tls', 'tlses')
      inflections.plural('enum', 'enums')
      inflections.plural('one_of', 'one_ofs')
      inflections.plural('any_of', 'any_ofs')
      inflections.plural('all_of', 'all_ofs')
    end
  )

  generator.generate_resource_files
  generator.generate_autoload_files
  generator.generate_entrypoint_file do |resource, ns|
    version = resource.ref.version || ''
    !version.include?('beta') && !version.include?('alpha')
  end

  json_code_files = {
    'lib/kube-dsl/dsl/apiextensions/v1/json.rb' => 'KubeDSL::DSL::Apiextensions::V1'
  }

  json_code_files.each do |path, namespace|
    puts "Writing #{path}"

    File.open(path, 'w+') do |f|
      f.write(<<~RUBY)
        # typed: strict

        module #{namespace}
          class JSON < ::KubeDSL::DSLObject
            def serialize
              @value
            end

            def value(val = nil)
              if val
                @value = val
              end

              @value
            end

            def kind_sym
              :JSON
            end
          end
        end
      RUBY
    end

    autoload_file = "#{File.dirname(path)}.rb"
    autoload_contents = File.read(autoload_file)
    autoload_lines = autoload_contents.strip.split("\n")
    autoloads = autoload_lines[1..-2]
    autoload_path = path.sub(/\Alib\//, '').chomp('.rb')
    autoloads << "  autoload :JSON, '#{autoload_path}'"
    autoloads.sort!
    autoload_lines[1..-2] = autoloads

    puts "Writing #{autoload_file}"
    File.write(autoload_file, autoload_lines.join("\n"))
  end

  json_rbi_files = {
    'sorbet/rbi/kube-dsl/dsl/apiextensions/v1/json.rbi' => 'KubeDSL::DSL::Apiextensions::V1'
  }

  json_rbi_files.each do |path, namespace|
    puts "Writing #{path}"

    File.open(path, 'w+') do |f|
      f.write(<<~RUBY)
        # typed: strict

        module #{namespace}
          class JSON < ::KubeDSL::DSLObject
            JSONType = T.type_alias do
              T.any(
                T::Array[T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped])],
                T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
              )
            end

            sig { params(block: T.nilable(T.proc.void)).void }
            def initialize(&block)
              @value = T.let(@value, JSONType)
            end

            sig { returns(JSONType) }
            def serialize; end

            sig { returns(Symbol) }
            def kind_sym; end

            sig { params(val: T.nilable(JSONType)).returns(JSONType) }
            def value(val = nil); end
          end
        end
      RUBY
    end
  end
end
