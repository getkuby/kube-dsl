module KubeDSL::DSL
  class EndpointPort
    extend ::KubeDSL::ValueFields
    value_fields :name, :port, :protocol

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
