module KubeDSL::DSL::Extensions
  class NetworkPolicyList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Extensions::NetworkPolicy.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
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
