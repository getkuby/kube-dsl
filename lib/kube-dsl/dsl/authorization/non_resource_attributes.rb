module KubeDSL::DSL::Authorization
  class NonResourceAttributes
    extend ::KubeDSL::ValueFields
    value_fields :path, :verb

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:verb] = verb
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
