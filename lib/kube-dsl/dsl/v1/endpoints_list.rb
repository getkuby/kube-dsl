module KubeDSL::DSL::V1
  class EndpointsList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::Endpoints.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "EndpointsList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :endpoints_list
    end
  end
end
