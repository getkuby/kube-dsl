module KubeDSL::DSL::V1
  class EndpointSubset < ::KubeDSL::DSLObject
    array_field(:address) { KubeDSL::DSL::V1::EndpointAddress.new }
    array_field(:not_ready_address) { KubeDSL::DSL::V1::EndpointAddress.new }
    array_field(:port) { KubeDSL::DSL::V1::EndpointPort.new }

    def serialize
      {}.tap do |result|
        result[:addresses] = addresses.map(&:serialize)
        result[:notReadyAddresses] = not_ready_addresses.map(&:serialize)
        result[:ports] = ports.map(&:serialize)
      end
    end

    def kind_sym
      :endpoint_subset
    end
  end
end
