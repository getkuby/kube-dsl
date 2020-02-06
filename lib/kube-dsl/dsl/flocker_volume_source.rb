module KubeDSL::DSL
  class FlockerVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :dataset_name, :dataset_uuid

    def serialize
      {}.tap do |result|
        result[:datasetName] = dataset_name
        result[:datasetUUID] = dataset_uuid
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
