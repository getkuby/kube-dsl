# typed: strict

module KubeDSL
  module DSL
    module V1
      class Sysctl < ::KubeDSL::DSLObject
        value_field :name
        value_field :value

        validates :name, field: { format: :string }, presence: false
        validates :value, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:name] = name
            result[:value] = value
          end
        end

        def kind_sym
          :sysctl
        end
      end
    end
  end
end