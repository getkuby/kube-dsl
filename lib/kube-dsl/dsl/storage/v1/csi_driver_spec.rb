# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1
        class CSIDriverSpec < ::KubeDSL::DSLObject
          value_field :attach_required
          value_field :fs_group_policy
          value_field :pod_info_on_mount
          value_field :requires_republish
          value_field :storage_capacity
          array_field(:token_request) { KubeDSL::DSL::Storage::V1::TokenRequest.new }
          value_field :volume_lifecycle_modes

          validates :attach_required, field: { format: :boolean }, presence: false
          validates :fs_group_policy, field: { format: :string }, presence: false
          validates :pod_info_on_mount, field: { format: :boolean }, presence: false
          validates :requires_republish, field: { format: :boolean }, presence: false
          validates :storage_capacity, field: { format: :boolean }, presence: false
          validates :token_requests, array: { kind_of: KubeDSL::DSL::Storage::V1::TokenRequest }, presence: false
          validates :volume_lifecycle_modes, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:attachRequired] = attach_required
              result[:fsGroupPolicy] = fs_group_policy
              result[:podInfoOnMount] = pod_info_on_mount
              result[:requiresRepublish] = requires_republish
              result[:storageCapacity] = storage_capacity
              result[:tokenRequests] = token_requests.map(&:serialize)
              result[:volumeLifecycleModes] = volume_lifecycle_modes
            end
          end

          def kind_sym
            :csi_driver_spec
          end
        end
      end
    end
  end
end