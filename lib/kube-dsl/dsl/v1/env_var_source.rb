module KubeDSL::DSL::V1
  class EnvVarSource < ::KubeDSL::DSLObject
    object_field(:config_map_key_ref) { KubeDSL::DSL::V1::ConfigMapKeySelector.new }
    object_field(:field_ref) { KubeDSL::DSL::V1::ObjectFieldSelector.new }
    object_field(:resource_field_ref) { KubeDSL::DSL::V1::ResourceFieldSelector.new }
    object_field(:secret_key_ref) { KubeDSL::DSL::V1::SecretKeySelector.new }

    validates :config_map_key_ref, object: { kind_of: KubeDSL::DSL::V1::ConfigMapKeySelector }
    validates :field_ref, object: { kind_of: KubeDSL::DSL::V1::ObjectFieldSelector }
    validates :resource_field_ref, object: { kind_of: KubeDSL::DSL::V1::ResourceFieldSelector }
    validates :secret_key_ref, object: { kind_of: KubeDSL::DSL::V1::SecretKeySelector }

    def serialize
      {}.tap do |result|
        result[:configMapKeyRef] = config_map_key_ref.serialize
        result[:fieldRef] = field_ref.serialize
        result[:resourceFieldRef] = resource_field_ref.serialize
        result[:secretKeyRef] = secret_key_ref.serialize
      end
    end

    def kind_sym
      :env_var_source
    end
  end
end
