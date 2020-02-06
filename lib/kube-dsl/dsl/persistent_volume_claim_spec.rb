module KubeDSL::DSL
  class PersistentVolumeClaimSpec
    extend ::KubeDSL::ValueFields
    value_fields :storage_class_name, :volume_mode, :volume_name
    array_field :access_mode
    object_field(:data_source) { KubeDSL::DSL::TypedLocalObjectReference.new }
    object_field(:resources) { KubeDSL::DSL::ResourceRequirements.new }
    object_field(:selector) { KubeDSL::DSL::Meta::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:storageClassName] = storage_class_name
        result[:volumeMode] = volume_mode
        result[:volumeName] = volume_name
        result[:accessModes] = access_modes
        result[:dataSource] = data_source.serialize
        result[:resources] = resources.serialize
        result[:selector] = selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
