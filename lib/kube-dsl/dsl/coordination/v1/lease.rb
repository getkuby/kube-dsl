module KubeDSL::DSL::Coordination::V1
  class Lease < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Coordination::V1::LeaseSpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "coordination.k8s.io/v1"
        result[:kind] = "Lease"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind
      :lease
    end
  end
end
