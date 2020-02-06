module KubeDSL::DSL::Coordination
  class Lease
    extend ::KubeDSL::ValueFields
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Coordination::LeaseSpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "coordination.k8s.io/v1beta1"
        result[:kind] = "Lease"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
