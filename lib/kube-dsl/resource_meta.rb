# typed: true
module KubeDSL
  class ResourceMeta
    include StringHelpers

    attr_reader :ref ,:inflector, :fields

    def initialize(ref, inflector)
      @ref = ref
      @inflector = inflector
      @fields = {}
    end

    def external?
      false
    end

    def empty?
      fields.size.zero?
    end

    def to_ruby
      ''.tap do |str|
        str << "# typed: true\n\n"
        str << "module #{ref.ruby_namespace.join('::')}\n"
        str << "  class #{ref.kind} < ::KubeDSL::DSLObject\n"
        str << fields_to_ruby
        str << "\n"
        str << validations
        str << "\n"
        str << serialize_method
        str << "\n"
        str << "    def kind_sym\n"
        str << "      :#{underscore(ref.kind)}\n"
        str << "    end\n"
        str << "  end\n"
        str << "end\n"
      end
    end

    def to_rbi
      ''.tap do |str|
        str << "# typed: strict\n\n"
        str << "module #{ref.ruby_namespace.join('::')}\n"
        str << "  class #{ref.kind} < ::KubeDSL::DSLObject\n"
        str << "    sig {\n"
        str << "      returns(\n"
        str << "        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]\n"
        str << "      )\n"
        str << "    }\n"
        str << "    def serialize; end\n\n"
        str << "    sig { returns(Symbol) }\n"
        str << "    def kind_sym; end\n\n"
        str << fields_to_rbi
        str << "  end\n"
        str << "end\n"
      end
    end

    private

    def indent(lines, level)
      lines.map do |line|
        "#{'  ' * level}#{line}"
      end
    end

    def fields_to_ruby
      lines = fields.flat_map do |name, field|
        indent(field.fields_to_ruby(inflector), 2)
      end

      result = lines.join("\n")
      result << "\n" unless result.empty?
      result
    end

    def fields_to_rbi
      lines = fields.flat_map do |name, field|
        indent(field.fields_to_rbi(inflector), 2)
      end

      result = lines.join("\n")
      result << "\n" unless result.empty?
      result
    end

    def validations
      lines = fields.flat_map do |name, field|
        indent(field.validations(inflector), 2)
      end

      result = lines.join("\n")
      result << "\n" unless result.empty?
      result
    end

    def serialize_method
      ''.tap do |str|
        str << "    def serialize\n"
        str << "      {}.tap do |result|\n"

        fields.each do |name, field|
          str << "        result[:#{quote_sym(name)}] = #{field.serialize_call(inflector)}\n"
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
