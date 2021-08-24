module KubeDSL
  class Generator
    attr_reader :builder

    def initialize(*args, **kwargs)
      @builder = Builder.new(*args, **kwargs)
    end

    def generate
      generate_resource_files
      generate_autoload_files
      generate_entrypoint_file
    end

    def generate_resource_files
      builder.each_resource_file do |path, res|
        FileUtils.mkdir_p(File.dirname(path))

        if File.exist?(path)
          puts "Skipping #{path} because it already exists"
        else
          puts "Writing #{path}"
          File.write(path, res.to_ruby)
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

    def generate_entrypoint_file(&block)
      if File.exist?(builder.entrypoint_path)
        puts "Skipping #{builder.entrypoint_path} because it already exists"
      else
        puts "Writing #{builder.entrypoint_path}"
        File.write(builder.entrypoint_path, builder.entrypoint(&block))
      end
    end
  end
end
