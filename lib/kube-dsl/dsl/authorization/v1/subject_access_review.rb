# typed: true

module KubeDSL
  module DSL
    module Authorization
      module V1
        class SubjectAccessReview < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:spec) { KubeDSL::DSL::Authorization::V1::SubjectAccessReviewSpec.new }
          object_field(:status) { KubeDSL::DSL::Authorization::V1::SubjectAccessReviewStatus.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, object: { kind_of: KubeDSL::DSL::Authorization::V1::SubjectAccessReviewSpec }
          validates :status, object: { kind_of: KubeDSL::DSL::Authorization::V1::SubjectAccessReviewStatus }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "authorization.k8s.io/v1"
              result[:kind] = "SubjectAccessReview"
              result[:metadata] = metadata.serialize
              result[:spec] = spec.serialize
              result[:status] = status.serialize
            end
          end

          def kind_sym
            :subject_access_review
          end
        end
      end
    end
  end
end