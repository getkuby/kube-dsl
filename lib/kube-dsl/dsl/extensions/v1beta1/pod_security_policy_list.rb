module KubeDSL::DSL::Extensions::V1beta1
  class PodSecurityPolicyList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Extensions::V1beta1::PodSecurityPolicy.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Extensions::V1beta1::PodSecurityPolicy }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "PodSecurityPolicyList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :pod_security_policy_list
    end
  end
end
