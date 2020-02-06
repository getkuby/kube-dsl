module KubeDSL::DSL
  class ReplicationControllerList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::ReplicationController.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ReplicationControllerList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
