module KubeDSL::DSL::Discovery::V1beta1
  class EndpointSlice
    extend ::KubeDSL::ValueFields

    value_fields :address_type
    array_field(:endpoint) { KubeDSL::DSL::Discovery::V1beta1::Endpoint.new }
    array_field(:port) { KubeDSL::DSL::Discovery::V1beta1::EndpointPort.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "discovery.k8s.io/v1beta1"
        result[:kind] = "EndpointSlice"
        result[:addressType] = address_type
        result[:endpoints] = endpoints.map(&:serialize)
        result[:ports] = ports.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :endpoint_slice
    end
  end
end
