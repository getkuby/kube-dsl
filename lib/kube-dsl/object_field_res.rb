# typed: true
module KubeDSL
  class ObjectFieldRes
    include StringHelpers

    attr_reader :name, :res

    def initialize(name, res)
      @name = name
      @res = res
    end

    def fields_to_ruby(_inflector)
      [
        "object_field(:#{ruby_safe_name}) { #{ruby_type}.new }"
      ]
    end

    def fields_to_rbi(_inflector)
      [
        "T::Sig::WithoutRuntime.sig { returns(#{ruby_type}) }",
        "def #{ruby_safe_name}; end"
      ]
    end

    def validations(_inflector)
      [].tap do |result|
        ruby_type = [*res.ref.ruby_namespace, res.ref.kind].join('::')
        result << "validates :#{ruby_safe_name}, object: { kind_of: #{ruby_type} }"
      end
    end

    def serialize_call(_inflector)
      "#{ruby_safe_name}.serialize"
    end

    private

    def ruby_type
      @ruby_type ||= "#{res.ref.ruby_namespace.join('::')}::#{res.ref.kind}"
    end

    def ruby_safe_name
      @ruby_safe_name ||= unkeywordify(underscore(name))
    end
  end
end
