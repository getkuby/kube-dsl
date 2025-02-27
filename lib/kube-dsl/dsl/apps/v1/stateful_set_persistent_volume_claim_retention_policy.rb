# typed: true

module KubeDSL
  module DSL
    module Apps
      module V1
        class StatefulSetPersistentVolumeClaimRetentionPolicy < ::KubeDSL::DSLObject
          value_field :when_deleted
          value_field :when_scaled

          validates :when_deleted, field: { format: :string }, presence: false
          validates :when_scaled, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:whenDeleted] = when_deleted
              result[:whenScaled] = when_scaled
            end
          end

          def kind_sym
            :stateful_set_persistent_volume_claim_retention_policy
          end
        end
      end
    end
  end
end