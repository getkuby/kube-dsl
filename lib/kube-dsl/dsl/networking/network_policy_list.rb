module KubeDSL::DSL::Networking
  class NetworkPolicyList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Networking::NetworkPolicy.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "networking.k8s.io/v1"
        result[:kind] = "NetworkPolicyList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :network_policy_list
    end
  end
end
