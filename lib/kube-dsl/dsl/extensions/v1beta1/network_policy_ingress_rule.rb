module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicyIngressRule < ::KubeDSL::DSLObject
    array_field(:from) { KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyPeer.new }
    array_field(:port) { KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyPort.new }

    def serialize
      {}.tap do |result|
        result[:from] = froms.map(&:serialize)
        result[:ports] = ports.map(&:serialize)
      end
    end

    def kind_sym
      :network_policy_ingress_rule
    end
  end
end
