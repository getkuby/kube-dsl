module KubeDSL::DSL::V1
  class ConfigMapList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::ConfigMap.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ConfigMapList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :config_map_list
    end
  end
end
