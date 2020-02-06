module KubeDSL::DSL
  class PreferredSchedulingTerm
    extend ::KubeDSL::ValueFields
    value_fields :weight
    object_field(:preference) { KubeDSL::DSL::NodeSelectorTerm.new }

    def serialize
      {}.tap do |result|
        result[:weight] = weight
        result[:preference] = preference.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
