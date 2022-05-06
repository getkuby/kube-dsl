# typed: strict

module KubeDSL
  module DSL
    module V1
      class AWSElasticBlockStoreVolumeSource < ::KubeDSL::DSLObject
        value_field :fs_type
        value_field :partition
        value_field :read_only
        value_field :volume_id

        validates :fs_type, field: { format: :string }, presence: false
        validates :partition, field: { format: :integer }, presence: false
        validates :read_only, field: { format: :boolean }, presence: false
        validates :volume_id, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:fsType] = fs_type
            result[:partition] = partition
            result[:readOnly] = read_only
            result[:volumeID] = volume_id
          end
        end

        def kind_sym
          :aws_elastic_block_store_volume_source
        end
      end
    end
  end
end