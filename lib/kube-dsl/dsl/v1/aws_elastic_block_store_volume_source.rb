module KubeDSL::DSL::V1
  class AWSElasticBlockStoreVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :partition, :read_only, :volume_id

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:partition] = partition
        result[:readOnly] = read_only
        result[:volumeID] = volume_id
      end
    end

    def kind
      :aws_elastic_block_store_volume_source
    end
  end
end
