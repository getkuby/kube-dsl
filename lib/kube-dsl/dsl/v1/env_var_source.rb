module KubeDSL::DSL::V1
  class EnvVarSource
    extend ::KubeDSL::ValueFields

    object_field(:config_map_key_ref) { KubeDSL::DSL::V1::ConfigMapKeySelector.new }
    object_field(:field_ref) { KubeDSL::DSL::V1::ObjectFieldSelector.new }
    object_field(:resource_field_ref) { KubeDSL::DSL::V1::ResourceFieldSelector.new }
    object_field(:secret_key_ref) { KubeDSL::DSL::V1::SecretKeySelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:configMapKeyRef] = config_map_key_ref.serialize
        result[:fieldRef] = field_ref.serialize
        result[:resourceFieldRef] = resource_field_ref.serialize
        result[:secretKeyRef] = secret_key_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :env_var_source
    end
  end
end
