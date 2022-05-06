# typed: false
module KubeDSL
  class InlineRef
    attr_reader :name, :document, :parent_ref, :serialize_handlers

    def initialize(name, document, parent_ref, serialize_handlers)
      @name = name
      @document = document
      @parent_ref = parent_ref
      @serialize_handlers = serialize_handlers
    end

    def method_missing(method_name, *args, **kwargs, &block)
      parent_ref.send(method_name, *args, **kwargs, &block)
    end

    def respond_to_missing?(method_name)
      parent_ref.respond_to?(method_name)
    end

    def inline?
      true
    end

    def meta
      @meta ||= ResourceMeta.new(self, inflector, serialize_handlers)
    end

    def kind
      ''.tap do |result|
        current_ref = self

        while current_ref.inline?
          # this is String#prepend
          result.prepend(capitalize(current_ref.name))
          current_ref = current_ref.parent_ref
        end

        result.prepend(current_ref.kind)
      end
    end

    def str
      @str ||= "#{parent_ref.str}.#{name}"
    end

    def ruby_autoload_path
      @ruby_autoload_path ||= File.join(
        [autoload_prefix].tap do |path|
          path << underscore(namespace) if namespace
          path << underscore(version) if version
          path << shorten("#{underscore(kind)}.rb")
        end
      )
    end

    def shorten(filename)
      return filename if filename.size <= 100

      digest = Digest::MD5.hexdigest(filename)[0...8]
      extname = File.extname(filename)

      "#{filename.chomp(extname)[0...(100 - extname.size - digest.size - 1)]}_#{digest}#{extname}"
    end
  end
end
