module KubeDSL::DSL::V1
  class FlockerVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :dataset_name, :dataset_uuid

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:datasetName] = dataset_name
        result[:datasetUUID] = dataset_uuid
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :flocker_volume_source
    end
  end
end
