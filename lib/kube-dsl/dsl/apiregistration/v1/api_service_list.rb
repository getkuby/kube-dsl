module KubeDSL::DSL::Apiregistration::V1
  class APIServiceList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Apiregistration::V1::APIService.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiregistration.k8s.io/v1"
        result[:kind] = "APIServiceList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :api_service_list
    end
  end
end
