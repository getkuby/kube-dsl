module KubeDSL::DSL::Apiregistration::V1beta1
  class APIServiceList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Apiregistration::V1beta1::APIService.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiregistration.k8s.io/v1beta1"
        result[:kind] = "APIServiceList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :api_service_list
    end
  end
end
