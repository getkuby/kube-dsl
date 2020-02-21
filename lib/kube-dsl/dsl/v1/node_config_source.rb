module KubeDSL::DSL::V1
  class NodeConfigSource
    extend ::KubeDSL::ValueFields

    object_field(:config_map) { KubeDSL::DSL::V1::ConfigMapNodeConfigSource.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
