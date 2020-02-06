module KubeDSL::DSL
  class GCEPersistentDiskVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :fs_type, :partition, :pd_name, :read_only

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:partition] = partition
        result[:pdName] = pd_name
        result[:readOnly] = read_only
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
