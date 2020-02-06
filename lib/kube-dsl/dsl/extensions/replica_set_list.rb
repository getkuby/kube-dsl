module KubeDSL::DSL::Extensions
  class ReplicaSetList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Extensions::ReplicaSet.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
        result[:kind] = "ReplicaSetList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :replica_set_list
    end
  end
end
