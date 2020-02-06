module KubeDSL::DSL::Meta
  class LabelSelectorRequirement
    extend ::KubeDSL::ValueFields
    value_fields :key, :operator
    array_field :value

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:operator] = operator
        result[:values] = values
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
