# typed: true

module KubeDSL::DSL::V1
  class PreferredSchedulingTerm < ::KubeDSL::DSLObject
    object_field(:preference) { KubeDSL::DSL::V1::NodeSelectorTerm.new }
    value_field :weight

    validates :preference, object: { kind_of: KubeDSL::DSL::V1::NodeSelectorTerm }
    validates :weight, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:preference] = preference.serialize
        result[:weight] = weight
      end
    end

    def kind_sym
      :preferred_scheduling_term
    end
  end
end
