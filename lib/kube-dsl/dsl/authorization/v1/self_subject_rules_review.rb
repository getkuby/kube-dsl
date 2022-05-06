# typed: strict

module KubeDSL
  module DSL
    module Authorization
      module V1
        class SelfSubjectRulesReview < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:spec) { KubeDSL::DSL::Authorization::V1::SelfSubjectRulesReviewSpec.new }
          object_field(:status) { KubeDSL::DSL::Authorization::V1::SubjectRulesReviewStatus.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, object: { kind_of: KubeDSL::DSL::Authorization::V1::SelfSubjectRulesReviewSpec }
          validates :status, object: { kind_of: KubeDSL::DSL::Authorization::V1::SubjectRulesReviewStatus }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "authorization.k8s.io/v1"
              result[:kind] = "SelfSubjectRulesReview"
              result[:metadata] = metadata.serialize
              result[:spec] = spec.serialize
              result[:status] = status.serialize
            end
          end

          def kind_sym
            :self_subject_rules_review
          end
        end
      end
    end
  end
end