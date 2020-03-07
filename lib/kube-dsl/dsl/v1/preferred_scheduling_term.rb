module KubeDSL::DSL::V1
  class PreferredSchedulingTerm < ::KubeDSL::DSLObject
    value_fields :weight
    object_field(:preference) { KubeDSL::DSL::V1::NodeSelectorTerm.new }

    def serialize
      {}.tap do |result|
        result[:weight] = weight
        result[:preference] = preference.serialize
      end
    end

    def kind_sym
      :preferred_scheduling_term
    end
  end
end
