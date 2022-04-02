# typed: true

module KubeDSL
  module DSL
    module V1
      class CinderVolumeSource < ::KubeDSL::DSLObject
        value_field :fs_type
        value_field :read_only
        object_field(:secret_ref) { KubeDSL::DSL::V1::LocalObjectReference.new }
        value_field :volume_id

        validates :fs_type, field: { format: :string }, presence: false
        validates :read_only, field: { format: :boolean }, presence: false
        validates :secret_ref, object: { kind_of: KubeDSL::DSL::V1::LocalObjectReference }
        validates :volume_id, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:fsType] = fs_type
            result[:readOnly] = read_only
            result[:secretRef] = secret_ref.serialize
            result[:volumeID] = volume_id
          end
        end

        def kind_sym
          :cinder_volume_source
        end
      end
    end
  end
end