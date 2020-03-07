module KubeDSL::DSL::Apps::V1
  class ReplicaSet < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apps::V1::ReplicaSetSpec.new }
    object_field(:status) { KubeDSL::DSL::Apps::V1::ReplicaSetStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1"
        result[:kind] = "ReplicaSet"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :replica_set
    end
  end
end
