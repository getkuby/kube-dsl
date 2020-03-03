module KubeDSL::DSL::Networking::V1
  class NetworkPolicy < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Networking::V1::NetworkPolicySpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "networking.k8s.io/v1"
        result[:kind] = "NetworkPolicy"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind
      :network_policy
    end
  end
end
