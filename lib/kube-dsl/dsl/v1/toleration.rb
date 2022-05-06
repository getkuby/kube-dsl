# typed: strict

module KubeDSL
  module DSL
    module V1
      class Toleration < ::KubeDSL::DSLObject
        value_field :effect
        value_field :key
        value_field :operator
        value_field :toleration_seconds
        value_field :value

        validates :effect, field: { format: :string }, presence: false
        validates :key, field: { format: :string }, presence: false
        validates :operator, field: { format: :string }, presence: false
        validates :toleration_seconds, field: { format: :integer }, presence: false
        validates :value, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:effect] = effect
            result[:key] = key
            result[:operator] = operator
            result[:tolerationSeconds] = toleration_seconds
            result[:value] = value
          end
        end

        def kind_sym
          :toleration
        end
      end
    end
  end
end