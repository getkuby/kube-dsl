module KubeDSL::DSL::Networking::V1
  class NetworkPolicyList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Networking::V1::NetworkPolicy.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "networking.k8s.io/v1"
        result[:kind] = "NetworkPolicyList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :network_policy_list
    end
  end
end
