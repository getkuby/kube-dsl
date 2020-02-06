module KubeDSL::DSL::Policy
  class PodSecurityPolicyList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Policy::PodSecurityPolicy.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "policy/v1beta1"
        result[:kind] = "PodSecurityPolicyList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_security_policy_list
    end
  end
end
