module KubeDSL::DSL::Apiregistration::V1beta1
  class APIServiceList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Apiregistration::V1beta1::APIService.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Apiregistration::V1beta1::APIService }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiregistration.k8s.io/v1beta1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "APIServiceList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :api_service_list
    end
  end
end
