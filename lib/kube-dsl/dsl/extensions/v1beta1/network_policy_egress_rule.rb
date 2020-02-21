module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicyEgressRule
    extend ::KubeDSL::ValueFields

    array_field(:port) { KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyPort.new }
    array_field(:to) { KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyPeer.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:ports] = ports.map(&:serialize)
        result[:to] = tos.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :network_policy_egress_rule
    end
  end
end
