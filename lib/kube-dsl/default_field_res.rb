require 'json'

module KubeDSL
  class DefaultFieldRes
    include StringHelpers

    attr_reader :name, :res, :allowed_values

    def initialize(name, res, allowed_values)
      @name = name
      @res = res
      @allowed_values = allowed_values
    end

    def fields_to_ruby(_inflector)
      []
    end

    def validations(_inflector)
      []
    end

    def serialize_call(_inflector)
      # use JSON.generate to add quotes around strings, etc
      JSON.generate(allowed_values.first)
    end
  end
end
