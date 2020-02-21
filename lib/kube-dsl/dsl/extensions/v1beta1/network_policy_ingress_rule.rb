module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicyIngressRule
    extend ::KubeDSL::ValueFields

    array_field(:from) { KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyPeer.new }
    array_field(:port) { KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyPort.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:from] = froms.map(&:serialize)
        result[:ports] = ports.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :network_policy_ingress_rule
    end
  end
end
