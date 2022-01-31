# typed: true

module KubeDSL::DSL::Discovery::V1
  class EndpointConditions < ::KubeDSL::DSLObject
    value_field :ready
    value_field :serving
    value_field :terminating

    validates :ready, field: { format: :boolean }, presence: false
    validates :serving, field: { format: :boolean }, presence: false
    validates :terminating, field: { format: :boolean }, presence: false

    def serialize
      {}.tap do |result|
        result[:ready] = ready
        result[:serving] = serving
        result[:terminating] = terminating
      end
    end

    def kind_sym
      :endpoint_conditions
    end
  end
end
