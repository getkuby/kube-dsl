# typed: true

module KubeDSL
  module DSL
    module V1
      class ComponentCondition < ::KubeDSL::DSLObject
        value_field :error
        value_field :message
        value_field :status
        value_field :type

        validates :error, field: { format: :string }, presence: false
        validates :message, field: { format: :string }, presence: false
        validates :status, field: { format: :string }, presence: false
        validates :type, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:error] = error
            result[:message] = message
            result[:status] = status
            result[:type] = type
          end
        end

        def kind_sym
          :component_condition
        end
      end
    end
  end
end