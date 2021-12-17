module KubeDSL::DSL::Discovery::V1
  class EndpointSliceList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Discovery::V1::EndpointSlice.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Discovery::V1::EndpointSlice }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "discovery.k8s.io/v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "EndpointSliceList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :endpoint_slice_list
    end
  end
end
