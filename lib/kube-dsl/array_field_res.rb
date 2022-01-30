# typed: true
module KubeDSL
  class ArrayFieldRes
    include StringHelpers
    include RbiHelpers

    attr_reader :name, :required, :elem_res

    alias_method :required?, :required

    def initialize(name, required, elem_res)
      @name = name
      @required = required
      @elem_res = elem_res
    end

    def fields_to_ruby(inflector)
      [
        "array_field(:#{underscore(inflector.singularize(name))})"\
          " { #{elem_res.ref.ruby_namespace.join('::')}::#{elem_res.ref.kind}.new }"
      ]
    end

    def fields_to_rbi(inflector)
      [
        'sig {',
        '  params(',
        '    elem_name: T.nilable(Symbol),',
        "    block: T.nilable(T.proc.returns(#{rbi_type_for(ruby_type)}))",
        "  ).returns(T::Array[#{rbi_type_for(ruby_type)}])",
        '}',
        "def #{plural_name(inflector)}(elem_name = nil, &block); end\n"
      ]
    end

    def validations(inflector)
      [].tap do |result|
        result << "validates :#{plural_name(inflector)}, array: { kind_of: #{ruby_type} }, presence: #{required? ? 'true' : 'false'}"
      end
    end

    def serialize_call(inflector)
      "#{plural_name(inflector)}.map(&:serialize)"
    end

    private

    def plural_name(inflector)
      inflector.pluralize(
        underscore(inflector.singularize(name))
      )
    end

    def ruby_type
      @ruby_type ||= [*elem_res.ref.ruby_namespace, elem_res.ref.kind].join('::')
    end
  end
end
