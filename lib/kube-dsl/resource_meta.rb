module KubeDSL
  class ResourceMeta
    include StringHelpers

    attr_reader :ref, :namespace ,:inflector
    attr_reader :fields, :key_value_fields, :array_fields, :object_fields
    attr_reader :default_fields

    def initialize(ref, namespace, inflector)
      @ref = ref
      @namespace = namespace
      @inflector = inflector

      @fields = []
      @key_value_fields = {}
      @array_fields = {}
      @object_fields = {}
      @default_fields = {}
    end

    def to_ruby
      ''.tap do |str|
        str << "module #{(namespace + ref.ruby_namespace).join('::')}\n"
        str << "  class #{ref.kind} < ::KubeDSL::DSLObject\n"
        str << fields_to_ruby
        str << "\n"
        str << serialize_method
        str << "\n"
        str << "    def kind\n"
        str << "      :#{underscore(ref.kind)}\n"
        str << "    end\n"
        str << "  end\n"
        str << "end\n"
      end
    end

    private

    def fields_to_ruby
      ''.tap do |str|
        unless fields.empty?
          str << '    value_fields '
          str << fields.map { |f| ":#{underscore(f)}" }.join(', ')
          str << "\n"
        end

        array_fields.each do |name, field|
          if field
            str << "    array_field(:#{underscore(inflector.singularize(name))})"
            str << " { #{(namespace + field.ref.ruby_namespace).join('::')}::#{field.ref.kind}.new }"
            str << "\n"
          else
            str << "    array_field :#{underscore(inflector.singularize(name))}\n"
          end
        end

        object_fields.each do |name, field|
          str << "    object_field(:#{underscore(name)}) { #{(namespace + field.ref.ruby_namespace).join('::')}::#{field.ref.kind}.new }\n"
        end

        key_value_fields.each do |name, fmt|
          str << "    object_field(:#{underscore(name)}) { ::KubeDSL::KeyValueFields.new(format: :#{fmt}) }\n"
        end
      end
    end

    def serialize_method
      ''.tap do |str|
        str << "    def serialize\n"
        str << "      {}.tap do |result|\n"

        default_fields.each do |name, value|
          str << "        result[:#{quote_sym(name)}] = #{value}\n"
        end

        fields.each do |f|
          str << "        result[:#{quote_sym(f)}] = #{underscore(f)}\n"
        end

        array_fields.each do |name, field|
          plural_name = inflector.pluralize(
            underscore(inflector.singularize(name))
          )

          if field
            str << "        result[:#{quote_sym(name)}] = #{plural_name}.map(&:serialize)\n"
          else
            str << "        result[:#{quote_sym(name)}] = #{plural_name}\n"
          end
        end

        object_fields.each do |name, field|
          str << "        result[:#{quote_sym(name)}] = #{underscore(name)}.serialize\n"
        end

        key_value_fields.each do |name, _|
          str << "        result[:#{quote_sym(name)}] = #{underscore(name)}.serialize\n"
        end

        str << "      end\n"
        str << "    end\n"
      end
    end

    def quote_sym(sym_str)
      sym_str.include?('-') ? "'#{sym_str}'" : sym_str
    end
  end
end
