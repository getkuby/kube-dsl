# typed: true

module KubeDSL
  module DSL
    module V1
      class EnvVar < ::KubeDSL::DSLObject
        value_field :name
        value_field :value
        object_field(:value_from) { KubeDSL::DSL::V1::EnvVarSource.new }

        validates :name, field: { format: :string }, presence: false
        validates :value, field: { format: :string }, presence: false
        validates :value_from, object: { kind_of: KubeDSL::DSL::V1::EnvVarSource }

        def serialize
          {}.tap do |result|
            result[:name] = name
            result[:value] = value
            result[:valueFrom] = value_from.serialize
          end
        end

        def kind_sym
          :env_var
        end
      end
    end
  end
end