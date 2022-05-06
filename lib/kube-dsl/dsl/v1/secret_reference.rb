# typed: true

module KubeDSL
  module DSL
    module V1
      class SecretReference < ::KubeDSL::DSLObject
        value_field :name
        value_field :namespace

        validates :name, field: { format: :string }, presence: false
        validates :namespace, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:name] = name
            result[:namespace] = namespace
          end
        end

        def kind_sym
          :secret_reference
        end
      end
    end
  end
end