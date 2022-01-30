# typed: true

module KubeDSL::DSL::V1
  class ContainerStateWaiting < ::KubeDSL::DSLObject
    value_field :message
    value_field :reason

    validates :message, field: { format: :string }, presence: false
    validates :reason, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:message] = message
        result[:reason] = reason
      end
    end

    def kind_sym
      :container_state_waiting
    end
  end
end
