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
      builder.resources.each do |res|
        ruby_class_path = File.join(builder.output_dir, res.ref.ruby_autoload_path)
        puts "Writing #{ruby_class_path}"
        FileUtils.mkdir_p(File.dirname(ruby_class_path))
        File.write(ruby_class_path, res.to_ruby)
      end
    end

    def generate_autoload_files
      builder.each_autoload_file do |path, ruby_code|
        puts "Writing #{path}"
        File.write(path, ruby_code)
      end
    end

    def generate_entrypoint_file
      puts "Writing #{builder.entrypoint_path}"
      File.write(builder.entrypoint_path, builder.entrypoint)
    end
  end
end
