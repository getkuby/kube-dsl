module KubeDSL
  class Ref
    include StringHelpers

    attr_reader :str, :kind, :namespace, :version, :inflector, :schema_dir
    attr_reader :ruby_namespace_prefix

    def initialize(str, ruby_namespace_prefix, inflector, schema_dir)
      @str = str
      @ruby_namespace_prefix = ruby_namespace_prefix
      @inflector = inflector
      @schema_dir = schema_dir

      ns, v, k = str.split('.').last(3)

      if ns == 'api' && v == 'resource'
        @kind = k
      elsif ns == 'core'
        @kind = k
        @version = v
      else
        @kind = k
        @namespace = ns
        @version = v
      end
    end

    def meta
      @meta ||= ResourceMeta.new(self, inflector)
    end

    def document
      JSON.parse(File.read(filename))
    end

    def object?
      document.include?('properties')
    end

    def ruby_namespace
      @ruby_namespace ||= begin
        [*ruby_namespace_prefix].tap do |mods|
          mods << namespace if namespace
          mods << version if version
          mods.map! do |m|
            inflector.camelize(underscore(m))
          end
        end
      end
    end

    def ruby_autoload_path
      @ruby_autoload_path ||= File.join(
        [].tap do |path|
          path << underscore(namespace) if namespace
          path << underscore(version) if version
          path << "#{underscore(kind)}.rb"
        end
      )
    end

    private

    def filename
      @filename ||= begin
        parts = [kind, namespace, version]

        filenames = (parts.size - 1).downto(0).map do |i|
          File.join(
            schema_dir,
            "#{parts[i..-1].compact.map(&:downcase).join('-')}.json"
          )
        end

        filenames += 0.upto(parts.size - 1).map do |i|
          File.join(
            schema_dir,
            "#{parts[0..i].compact.map(&:downcase).join('-')}.json"
          )
        end

        filenames.find { |f| File.exist?(f) }
      end
    end
  end
end
