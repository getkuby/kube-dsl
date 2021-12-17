module KubeDSL::DSL::Networking::V1
  class IngressClass < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Networking::V1::IngressClassSpec.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Networking::V1::IngressClassSpec }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "networking.k8s.io/v1"
        result[:kind] = "IngressClass"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :ingress_class
    end
  end
end
