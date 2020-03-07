module KubeDSL::DSL::Discovery::V1beta1
  class EndpointSliceList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Discovery::V1beta1::EndpointSlice.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "discovery.k8s.io/v1beta1"
        result[:kind] = "EndpointSliceList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :endpoint_slice_list
    end
  end
end
