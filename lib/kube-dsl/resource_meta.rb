# typed: false

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
      level = ref.ruby_namespace.size - 1

      lines = [
        "# typed: true",
        '',
        *ref.ruby_namespace.flat_map.with_index do |mod, idx|
          indent("module #{mod}", idx)
        end,
        *indent("class #{ref.kind} < ::KubeDSL::DSLObject", level + 1),
        *fields_to_ruby(level + 2),
        *validations(level + 2),
        *serialize_method(level + 2),
        *indent(
          'def kind_sym',
          "  :#{underscore(ref.kind)}",
          'end', level + 2
        ),
        *indent('end', level + 1),  # class
        *level.downto(0).flat_map do |idx|
          indent('end', idx)
        end
      ]

      lines.join("\n")
    end

    def to_rbi
      level = ref.ruby_namespace.size - 1

      lines = [
        "# typed: strict",
        '',
        *ref.ruby_namespace.flat_map.with_index do |mod, idx|
          indent("module #{mod}", idx)
        end,
        *indent("class #{ref.kind} < ::KubeDSL::DSLObject", level + 1),
        *indent(
          'sig {',
          '  returns(',
          '    T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]',
          '  )',
          '}',
          'def serialize; end', level + 2
        ),
        '',
        *indent(
          'sig { returns(Symbol) }',
          'def kind_sym; end', level + 2
        ),
        '',
        *fields_to_rbi(level + 2),
        *indent('end', level + 1),  # class
        *level.downto(0).flat_map do |idx|
          indent('end', idx)
        end
      ]

      lines.join("\n")
    end

    private

    def indent(*lines, level)
      lines.map do |line|
        "#{'  ' * level}#{line}"
      end
    end

    def fields_to_ruby(level)
      lines = fields.flat_map do |name, field|
        indent(*field.fields_to_ruby(inflector), level)
      end

      lines << '' unless lines.empty?
      lines
    end

    def fields_to_rbi(level)
      lines = fields.flat_map do |name, field|
        [
          *indent(*field.fields_to_rbi(inflector), level),
          ''
        ]
      end

      lines.pop if lines.last == ''
      lines
    end

    def validations(level)
      lines = fields.flat_map do |name, field|
        indent(*field.validations(inflector), level)
      end

      lines << '' unless lines.empty?
      lines
    end

    def serialize_method(level)
      lines = indent(
        "def serialize",
        "  {}.tap do |result|",
        *fields.map do |name, field|
          "    result[:#{quote_sym(name)}] = #{field.serialize_call(inflector)}"
        end,
        "  end",
        "end", level
      )

      lines << '' unless lines.empty?
      lines
    end

    def quote_sym(sym_str)
      sym_str.include?('-') ? "'#{sym_str}'" : sym_str
    end
  end
end
