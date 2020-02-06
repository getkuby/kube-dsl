module KubeDSL::DSL
  class ComponentStatusList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::ComponentStatus.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ComponentStatusList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :component_status_list
    end
  end
end
