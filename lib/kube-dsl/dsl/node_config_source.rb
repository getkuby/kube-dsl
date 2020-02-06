module KubeDSL::DSL
  class NodeConfigSource
    extend ::KubeDSL::ValueFields

    object_field(:config_map) { KubeDSL::DSL::ConfigMapNodeConfigSource.new }

    def serialize
      {}.tap do |result|
        result[:configMap] = config_map.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :node_config_source
    end
  end
end
