module KubeDSL::DSL::V1
  class TopologySelectorLabelRequirement < ::KubeDSL::DSLObject
    value_fields :key
    array_field :value

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:values] = values
      end
    end

    def kind
      :topology_selector_label_requirement
    end
  end
end
