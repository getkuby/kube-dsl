module KubeDSL::DSL::Networking
  class Ingress
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Networking::IngressSpec.new }
    object_field(:status) { KubeDSL::DSL::Networking::IngressStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "networking.k8s.io/v1beta1"
        result[:kind] = "Ingress"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :ingress
    end
  end
end
