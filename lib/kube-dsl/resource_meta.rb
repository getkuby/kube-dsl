module KubeDSL
  class ResourceMeta
    include StringHelpers

    attr_reader :ref, :fields, :key_value_fields, :array_fields, :object_fields
    attr_reader :default_fields

    def initialize(ref)
      @ref = ref
      @fields = []
      @key_value_fields = []
      @array_fields = {}
      @object_fields = {}
      @default_fields = {}
    end

    def to_ruby
      ''.tap do |str|
        str << "module #{ref.ruby_namespace.join('::')}\n"
        str << "  class #{ref.kind}\n"
        str << "    extend ::KubeDSL::ValueFields\n"
        str << fields_to_ruby
        str << "\n"
        str << serialize_method
        str << "\n"
        str << "    def to_resource\n"
        str << "      ::KubeDSL::Resource.new(serialize)\n"
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
            str << "    array_field(:#{underscore(Inflector.singularize(name))})"
            str << " { #{field.ref.ruby_namespace.join('::')}::#{field.ref.kind}.new }"
            str << "\n"
          else
            str << "    array_field :#{underscore(Inflector.singularize(name))}\n"
          end
        end

        object_fields.each do |name, field|
          str << "    object_field(:#{underscore(name)}) { #{field.ref.ruby_namespace.join('::')}::#{field.ref.kind}.new }\n"
        end

        key_value_fields.each do |name|
          str << "    object_field(:#{underscore(name)}) { ::KubeDSL::KeyValueFields.new }\n"
        end
      end
    end

    def serialize_method
      ''.tap do |str|
        str << "    def serialize\n"
        str << "      {}.tap do |result|\n"

        default_fields.each do |name, value|
          str << "        result[:#{name}] = #{value}\n"
        end

        fields.each do |f|
          str << "        result[:#{f}] = #{underscore(f)}\n"
        end

        array_fields.each do |name, field|
          plural_name = Inflector.pluralize(
            underscore(Inflector.singularize(name))
          )

          if field
            str << "        result[:#{name}] = #{plural_name}.map(&:serialize)\n"
          else
            str << "        result[:#{name}] = #{plural_name}\n"
          end
        end

        object_fields.each do |name, field|
          str << "        result[:#{name}] = #{underscore(name)}.serialize\n"
        end

        key_value_fields.each do |name|
          str << "        result[:#{name}] = #{underscore(name)}.serialize\n"
        end

        str << "      end\n"
        str << "    end\n"
      end
    end
  end
end
