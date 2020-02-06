module KubeDSL::DSL
  class EndpointSubset
    extend ::KubeDSL::ValueFields
    array_field(:address) { KubeDSL::DSL::EndpointAddress.new }
    array_field(:not_ready_address) { KubeDSL::DSL::EndpointAddress.new }
    array_field(:port) { KubeDSL::DSL::EndpointPort.new }

    def serialize
      {}.tap do |result|
        result[:addresses] = addresses.map(&:serialize)
        result[:notReadyAddresses] = not_ready_addresses.map(&:serialize)
        result[:ports] = ports.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
