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

    private

    def generate_resource_files
      builder.each_resource do |res|
        FileUtils.mkdir_p(File.dirname(res.ref.ruby_autoload_path))

        if File.exist?(res.ref.ruby_autoload_path)
          puts "Skipping #{res.ref.ruby_autoload_path} because it already exists"
        else
          puts "Writing #{res.ref.ruby_autoload_path}"
          File.write(res.ref.ruby_autoload_path, res.to_ruby)
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

    def generate_entrypoint_file
      if File.exist?(builder.entrypoint_path)
        puts "Skipping #{builder.entrypoint_path} because it already exists"
      else
        puts "Writing #{builder.entrypoint_path}"
        File.write(builder.entrypoint_path, builder.entrypoint)
      end
    end
  end
end
