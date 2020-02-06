module KubeDSL::DSL::Extensions
  class NetworkPolicy
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Extensions::NetworkPolicySpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
        result[:kind] = "NetworkPolicy"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :network_policy
    end
  end
end
