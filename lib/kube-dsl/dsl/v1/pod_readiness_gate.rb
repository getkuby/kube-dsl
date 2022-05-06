# typed: true

module KubeDSL
  module DSL
    module V1
      class PodReadinessGate < ::KubeDSL::DSLObject
        value_field :condition_type

        validates :condition_type, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:conditionType] = condition_type
          end
        end

        def kind_sym
          :pod_readiness_gate
        end
      end
    end
  end
end