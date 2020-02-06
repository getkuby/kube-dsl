module KubeDSL::DSL::Extensions
  class PodSecurityPolicy
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Extensions::PodSecurityPolicySpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
        result[:kind] = "PodSecurityPolicy"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_security_policy
    end
  end
end
