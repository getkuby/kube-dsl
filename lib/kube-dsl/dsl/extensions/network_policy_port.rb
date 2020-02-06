module KubeDSL::DSL::Extensions
  class NetworkPolicyPort
    extend ::KubeDSL::ValueFields
    value_fields :port, :protocol

    def serialize
      {}.tap do |result|
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
