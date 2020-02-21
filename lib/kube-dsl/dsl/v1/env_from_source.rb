module KubeDSL::DSL::V1
  class EnvFromSource
    extend ::KubeDSL::ValueFields

    value_fields :prefix
    object_field(:config_map_ref) { KubeDSL::DSL::V1::ConfigMapEnvSource.new }
    object_field(:secret_ref) { KubeDSL::DSL::V1::SecretEnvSource.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:prefix] = prefix
        result[:configMapRef] = config_map_ref.serialize
        result[:secretRef] = secret_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :env_from_source
    end
  end
end
