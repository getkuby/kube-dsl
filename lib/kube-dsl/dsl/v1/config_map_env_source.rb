# typed: true

module KubeDSL
  module DSL
    module V1
      class ConfigMapEnvSource < ::KubeDSL::DSLObject
        value_field :name
        value_field :optional

        validates :name, field: { format: :string }, presence: false
        validates :optional, field: { format: :boolean }, presence: false

        def serialize
          {}.tap do |result|
            result[:name] = name
            result[:optional] = optional
          end
        end

        def kind_sym
          :config_map_env_source
        end
      end
    end
  end
end