module KubeDSL::DSL::V1
  class FlockerVolumeSource < ::KubeDSL::DSLObject
    value_fields :dataset_name, :dataset_uuid

    def serialize
      {}.tap do |result|
        result[:datasetName] = dataset_name
        result[:datasetUUID] = dataset_uuid
      end
    end

    def kind_sym
      :flocker_volume_source
    end
  end
end
