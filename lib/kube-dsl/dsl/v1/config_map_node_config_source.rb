module KubeDSL::DSL::V1
  class ConfigMapNodeConfigSource
    extend ::KubeDSL::ValueFields

    value_fields :kubelet_config_key, :name, :namespace, :resource_version, :uid

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :config_map_node_config_source
    end
  end
end
