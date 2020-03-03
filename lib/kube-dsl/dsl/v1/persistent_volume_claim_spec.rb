module KubeDSL::DSL::V1
  class PersistentVolumeClaimSpec < ::KubeDSL::DSLObject
    value_fields :storage_class_name, :volume_mode, :volume_name
    array_field :access_mode
    object_field(:data_source) { KubeDSL::DSL::V1::TypedLocalObjectReference.new }
    object_field(:resources) { KubeDSL::DSL::V1::ResourceRequirements.new }
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

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

    def kind
      :persistent_volume_claim_spec
    end
  end
end
