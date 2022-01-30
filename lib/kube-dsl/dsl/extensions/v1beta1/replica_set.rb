# typed: true

module KubeDSL::DSL::Extensions::V1beta1
  class ReplicaSet < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Extensions::V1beta1::ReplicaSetSpec.new }
    object_field(:status) { KubeDSL::DSL::Extensions::V1beta1::ReplicaSetStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Extensions::V1beta1::ReplicaSetSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Extensions::V1beta1::ReplicaSetStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
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
