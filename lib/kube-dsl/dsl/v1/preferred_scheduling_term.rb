module KubeDSL::DSL::V1
  class PreferredSchedulingTerm
    extend ::KubeDSL::ValueFields

    value_fields :weight
    object_field(:preference) { KubeDSL::DSL::V1::NodeSelectorTerm.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:weight] = weight
        result[:preference] = preference.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :preferred_scheduling_term
    end
  end
end
