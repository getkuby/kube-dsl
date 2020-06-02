module KubeDSL::DSL::V1
  class PersistentVolumeClaimSpec < ::KubeDSL::DSLObject
    value_fields :access_modes, :storage_class_name, :volume_mode, :volume_name
    object_field(:data_source) { KubeDSL::DSL::V1::TypedLocalObjectReference.new }
    object_field(:resources) { KubeDSL::DSL::V1::ResourceRequirements.new }
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:accessModes] = access_modes
        result[:storageClassName] = storage_class_name
        result[:volumeMode] = volume_mode
        result[:volumeName] = volume_name
        result[:dataSource] = data_source.serialize
        result[:resources] = resources.serialize
        result[:selector] = selector.serialize
      end
    end

    def kind_sym
      :persistent_volume_claim_spec
    end
  end
end
