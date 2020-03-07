module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicyPort < ::KubeDSL::DSLObject
    value_fields :port, :protocol

    def serialize
      {}.tap do |result|
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def kind_sym
      :network_policy_port
    end
  end
end
