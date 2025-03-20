# typed: true
module KubeDSL
  class FieldRes
    include StringHelpers
    include RbiHelpers

    attr_reader :name, :type, :required

    alias_method :required?, :required

    def initialize(name, type, required)
      @name = name
      @type = type
      @required = required
    end

    def fields_to_ruby(_inflector)
      ["value_field :#{ruby_safe_name}"]
    end

    def fields_to_rbi(inflector)
      [
        "T::Sig::WithoutRuntime.sig { params(val: T.nilable(#{rbi_type_for(@type)})).returns(T.nilable(#{rbi_type_for(@type)})) }",
        "def #{ruby_safe_name}(val = nil); end"
      ]
    end

    def validations(_inflector)
      [].tap do |result|
        result << "validates :#{ruby_safe_name}, field: { format: :#{type} }, presence: #{required? ? 'true' : 'false'}"
      end
    end

    def serialize_call(_inflector)
      ruby_safe_name
    end

    private

    def ruby_safe_name
      @ruby_safe_name ||= unkeywordify(underscore(name))
    end
  end
end
