# typed: false

module KubeDSL
  class Generator
    attr_reader :builder

    def initialize(*args, **kwargs)
      @builder = Builder.new(*args, **kwargs)
    end

    def generate(include_rbi: true)
      generate_resource_files(include_rbi: include_rbi)
      generate_autoload_files
      generate_entrypoint_file(include_rbi: include_rbi)
    end

    def generate_resource_files(include_rbi: true)
      builder.each_resource_file do |path, res|
        FileUtils.mkdir_p(File.dirname(path))

        if File.exist?(path)
          puts "Skipping #{path} because it already exists"
        else
          puts "Writing #{path}"
          File.write(path, res.to_ruby)
        end

        next unless include_rbi

        rbi_path = File.join('sorbet', 'rbi', *path.split(File::SEPARATOR)[1..-1])
        rbi_path = "#{rbi_path.chomp('.rb')}.rbi"
        FileUtils.mkdir_p(File.dirname(rbi_path))

        if File.exist?(rbi_path)
          puts "Skipping #{rbi_path} because it already exists"
        else
          puts "Writing #{rbi_path}"
          File.write(rbi_path, res.to_rbi)
        end
      end
    end

    def generate_autoload_files
      builder.each_autoload_file do |path, ruby_code|
        if File.exist?(path)
          puts "Skipping #{path} because it already exists"
        else
          puts "Writing #{path}"
          File.write(path, ruby_code)
        end
      end
    end

    def generate_entrypoint_file(include_rbi: true, &block)
      entrypoint_builder = builder.entrypoint(&block)

      if File.exist?(entrypoint_builder.path)
        puts "Skipping #{entrypoint_builder.path} because it already exists"
      else
        entrypoint_ruby = entrypoint_builder.entrypoint

        puts "Writing #{entrypoint_builder.path}"
        File.write(entrypoint_builder.path, entrypoint_ruby)

        if include_rbi
          entrypoint_rbi = entrypoint_builder.entrypoint_rbi

          puts "Writing #{entrypoint_builder.rbi_path}"
          File.write(entrypoint_builder.rbi_path, entrypoint_rbi)
        end
      end
    end
  end
end
