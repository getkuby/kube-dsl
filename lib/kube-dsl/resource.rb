require 'erb'

module KubeDSL
  class Resource
    include StringHelpers

    attr_reader :ref, :fields, :key_value_fields, :array_fields, :object_fields

    def initialize(ref)
      @ref = ref
      @fields = []
      @key_value_fields = []
      @array_fields = {}
      @object_fields = {}
    end

    def to_ruby
      ''.tap do |str|
        str << "module #{ref.ruby_namespace.join('::')}\n"
        str << "  class #{ref.kind}\n"
        str << "    extend ValueFields\n"

        unless fields.empty?
          str << '    value_fields '
          str << fields.map { |f| ":#{underscore(f)}" }.join(', ')
          str << "\n"
        end

        array_fields.each do |name, field|
          if field
            str << "    array_field(:#{underscore(name)})"
            str << " { #{field.ref.ruby_namespace.join('::')}::#{field.ref.kind}.new }"
            str << "\n"
          else
            str << "    array_field :#{underscore(name)}\n"
          end
        end

        object_fields.each do |name, field|
          str << "    object_field(:#{underscore(name)}) { #{field.ref.ruby_namespace.join('::')}::#{field.ref.kind}.new }\n"
        end

        str << "  end\n"
        str << "end\n"
      end
    end
  end
end
