module KubeDSL::DSL::V1
  class NodeConfigSource < ::KubeDSL::DSLObject
    object_field(:config_map) { KubeDSL::DSL::V1::ConfigMapNodeConfigSource.new }

    def serialize
      {}.tap do |result|
        result[:configMap] = config_map.serialize
      end
    end

    def kind_sym
      :node_config_source
    end
  end
end
