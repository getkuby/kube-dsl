module KubeDSL::DSL::Discovery::V1beta1
  class EndpointSlice < ::KubeDSL::DSLObject
    value_fields :address_type
    array_field(:endpoint) { KubeDSL::DSL::Discovery::V1beta1::Endpoint.new }
    array_field(:port) { KubeDSL::DSL::Discovery::V1beta1::EndpointPort.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

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

    def kind_sym
      :endpoint_slice
    end
  end
end
