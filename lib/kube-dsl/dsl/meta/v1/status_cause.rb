# typed: true

module KubeDSL::DSL::Meta::V1
  class StatusCause < ::KubeDSL::DSLObject
    value_field :field
    value_field :message
    value_field :reason

    validates :field, field: { format: :string }, presence: false
    validates :message, field: { format: :string }, presence: false
    validates :reason, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:field] = field
        result[:message] = message
        result[:reason] = reason
      end
    end

    def kind_sym
      :status_cause
    end
  end
end
