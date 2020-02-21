module KubeDSL::DSL::Meta::V1
  class LabelSelectorRequirement
    extend ::KubeDSL::ValueFields

    value_fields :key, :operator
    array_field :value

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :label_selector_requirement
    end
  end
end
