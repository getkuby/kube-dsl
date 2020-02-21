module KubeDSL::DSL::V1
  class EndpointSubset
    extend ::KubeDSL::ValueFields

    array_field(:address) { KubeDSL::DSL::V1::EndpointAddress.new }
    array_field(:not_ready_address) { KubeDSL::DSL::V1::EndpointAddress.new }
    array_field(:port) { KubeDSL::DSL::V1::EndpointPort.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :endpoint_subset
    end
  end
end
