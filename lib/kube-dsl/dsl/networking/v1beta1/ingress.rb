module KubeDSL::DSL::Networking::V1beta1
  class Ingress < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Networking::V1beta1::IngressSpec.new }
    object_field(:status) { KubeDSL::DSL::Networking::V1beta1::IngressStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "networking.k8s.io/v1beta1"
        result[:kind] = "Ingress"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :ingress
    end
  end
end
