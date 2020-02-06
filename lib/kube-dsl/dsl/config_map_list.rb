module KubeDSL::DSL
  class ConfigMapList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::ConfigMap.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ConfigMapList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :config_map_list
    end
  end
end
