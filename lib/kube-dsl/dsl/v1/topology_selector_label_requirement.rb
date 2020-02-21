module KubeDSL::DSL::V1
  class TopologySelectorLabelRequirement
    extend ::KubeDSL::ValueFields

    value_fields :key
    array_field :value

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:values] = values
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :topology_selector_label_requirement
    end
  end
end
