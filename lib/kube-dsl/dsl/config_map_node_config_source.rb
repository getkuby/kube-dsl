module KubeDSL::DSL
  class ConfigMapNodeConfigSource
    extend ::KubeDSL::ValueFields
    value_fields :kubelet_config_key, :name, :namespace, :resource_version, :uid

    def serialize
      {}.tap do |result|
        result[:kubeletConfigKey] = kubelet_config_key
        result[:name] = name
        result[:namespace] = namespace
        result[:resourceVersion] = resource_version
        result[:uid] = uid
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
