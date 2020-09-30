module KubeDSL
  class KeyValueFieldRes
    include StringHelpers

    attr_reader :name, :res, :type, :required

    alias_method :required?, :required

    def initialize(name, res, type, required)
      @name = name
      @res = res
      @type = type
      @required = required
    end

    def fields_to_ruby(_inflector)
      [
        "key_value_field(:#{underscore(name)}, format: :#{type})"
      ]
    end

    def validations(_inflector)
      [].tap do |result|
        result << "validates :#{underscore(name)}, kv: { value_format: :#{type} }, presence: #{required? ? 'true' : 'false'}"
      end
    end

    def serialize_call(_inflector)
      "#{underscore(name)}.serialize"
    end
  end
end
