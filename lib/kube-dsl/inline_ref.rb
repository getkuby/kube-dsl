# typed: false
module KubeDSL
  class InlineRef
    attr_reader :name, :document, :parent_ref

    def initialize(name, document, parent_ref)
      @name = name
      @document = document
      @parent_ref = parent_ref
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
      @meta ||= ResourceMeta.new(self, inflector)
    end

    def kind
      ''.tap do |result|
        current_ref = self

        while current_ref.inline?
          # this is String#prepend
          result.prepend(capitalize(current_ref.name))
          current_ref = current_ref.parent_ref
        end
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
          path << "#{underscore(kind)}.rb"
        end
      )
    end
  end
end