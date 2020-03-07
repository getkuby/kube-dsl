module KubeDSL::DSL::Apiregistration::V1beta1
  class APIServiceList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Apiregistration::V1beta1::APIService.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiregistration.k8s.io/v1beta1"
        result[:kind] = "APIServiceList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :api_service_list
    end
  end
end
