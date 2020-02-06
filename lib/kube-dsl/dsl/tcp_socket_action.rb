module KubeDSL::DSL
  class TCPSocketAction
    extend ::KubeDSL::ValueFields
    value_fields :host, :port

    def serialize
      {}.tap do |result|
        result[:host] = host
        result[:port] = port
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
