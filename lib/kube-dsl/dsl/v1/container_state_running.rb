# typed: strict

module KubeDSL
  module DSL
    module V1
      class ContainerStateRunning < ::KubeDSL::DSLObject
        value_field :started_at

        validates :started_at, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:startedAt] = started_at
          end
        end

        def kind_sym
          :container_state_running
        end
      end
    end
  end
end