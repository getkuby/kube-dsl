module KubeDSL::DSL
  class TopologySelectorLabelRequirement
    extend ::KubeDSL::ValueFields
    value_fields :key
    array_field :value

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:values] = values
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
