# typed: true

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class PodSecurityPolicy < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:spec) { KubeDSL::DSL::Policy::V1beta1::PodSecurityPolicySpec.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, object: { kind_of: KubeDSL::DSL::Policy::V1beta1::PodSecurityPolicySpec }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "policy/v1beta1"
              result[:kind] = "PodSecurityPolicy"
              result[:metadata] = metadata.serialize
              result[:spec] = spec.serialize
            end
          end

          def kind_sym
            :pod_security_policy
          end
        end
      end
    end
  end
end