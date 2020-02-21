module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicyPort
    extend ::KubeDSL::ValueFields

    value_fields :port, :protocol

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :network_policy_port
    end
  end
end
