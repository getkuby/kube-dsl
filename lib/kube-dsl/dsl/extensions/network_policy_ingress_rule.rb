module KubeDSL::DSL::Extensions
  class NetworkPolicyIngressRule
    extend ::KubeDSL::ValueFields
    array_field(:from) { KubeDSL::DSL::Extensions::NetworkPolicyPeer.new }
    array_field(:port) { KubeDSL::DSL::Extensions::NetworkPolicyPort.new }

    def serialize
      {}.tap do |result|
        result[:from] = froms.map(&:serialize)
        result[:ports] = ports.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
