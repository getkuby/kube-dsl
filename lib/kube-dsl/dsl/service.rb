module KubeDSL::DSL
  class Service
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::ServiceSpec.new }
    object_field(:status) { KubeDSL::DSL::ServiceStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Service"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :service
    end
  end
end
