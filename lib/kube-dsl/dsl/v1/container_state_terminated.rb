# typed: true

module KubeDSL
  module DSL
    module V1
      class ContainerStateTerminated < ::KubeDSL::DSLObject
        value_field :container_id
        value_field :exit_code
        value_field :finished_at
        value_field :message
        value_field :reason
        value_field :signal
        value_field :started_at

        validates :container_id, field: { format: :string }, presence: false
        validates :exit_code, field: { format: :integer }, presence: false
        validates :finished_at, field: { format: :string }, presence: false
        validates :message, field: { format: :string }, presence: false
        validates :reason, field: { format: :string }, presence: false
        validates :signal, field: { format: :integer }, presence: false
        validates :started_at, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:containerID] = container_id
            result[:exitCode] = exit_code
            result[:finishedAt] = finished_at
            result[:message] = message
            result[:reason] = reason
            result[:signal] = signal
            result[:startedAt] = started_at
          end
        end

        def kind_sym
          :container_state_terminated
        end
      end
    end
  end
end