module KubeDSL::DSL::V1
  class EnvFromSource < ::KubeDSL::DSLObject
    object_field(:config_map_ref) { KubeDSL::DSL::V1::ConfigMapEnvSource.new }
    value_field :prefix
    object_field(:secret_ref) { KubeDSL::DSL::V1::SecretEnvSource.new }

    validates :config_map_ref, object: { kind_of: KubeDSL::DSL::V1::ConfigMapEnvSource }
    validates :prefix, field: { format: :string }, presence: false
    validates :secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretEnvSource }

    def serialize
      {}.tap do |result|
        result[:configMapRef] = config_map_ref.serialize
        result[:prefix] = prefix
        result[:secretRef] = secret_ref.serialize
      end
    end

    def kind_sym
      :env_from_source
    end
  end
end
