module KubeDSL::DSL::Apiregistration
  class APIService
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apiregistration::APIServiceSpec.new }
    object_field(:status) { KubeDSL::DSL::Apiregistration::APIServiceStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiregistration.k8s.io/v1beta1"
        result[:kind] = "APIService"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :api_service
    end
  end
end
