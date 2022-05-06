# typed: strict

module KubeDSL
  module DSL
    module Authorization
      module V1
        class SubjectAccessReviewStatus < ::KubeDSL::DSLObject
          value_field :allowed
          value_field :denied
          value_field :evaluation_error
          value_field :reason

          validates :allowed, field: { format: :boolean }, presence: false
          validates :denied, field: { format: :boolean }, presence: false
          validates :evaluation_error, field: { format: :string }, presence: false
          validates :reason, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:allowed] = allowed
              result[:denied] = denied
              result[:evaluationError] = evaluation_error
              result[:reason] = reason
            end
          end

          def kind_sym
            :subject_access_review_status
          end
        end
      end
    end
  end
end