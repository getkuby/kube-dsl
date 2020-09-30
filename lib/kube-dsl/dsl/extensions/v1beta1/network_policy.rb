module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicy < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Extensions::V1beta1::NetworkPolicySpec.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Extensions::V1beta1::NetworkPolicySpec }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
        result[:kind] = "NetworkPolicy"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :network_policy
    end
  end
end
