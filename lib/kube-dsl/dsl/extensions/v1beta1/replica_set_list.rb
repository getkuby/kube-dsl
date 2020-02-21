module KubeDSL::DSL::Extensions::V1beta1
  class ReplicaSetList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Extensions::V1beta1::ReplicaSet.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
