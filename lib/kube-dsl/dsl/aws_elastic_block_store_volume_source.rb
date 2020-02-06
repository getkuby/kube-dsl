module KubeDSL::DSL
  class AWSElasticBlockStoreVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :fs_type, :partition, :read_only, :volume_id

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:partition] = partition
        result[:readOnly] = read_only
        result[:volumeID] = volume_id
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
