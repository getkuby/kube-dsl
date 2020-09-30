module KubeDSL::DSL::V1
  class PersistentVolumeClaimSpec < ::KubeDSL::DSLObject
    value_field :access_modes
    object_field(:data_source) { KubeDSL::DSL::V1::TypedLocalObjectReference.new }
    object_field(:resources) { KubeDSL::DSL::V1::ResourceRequirements.new }
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    value_field :storage_class_name
    value_field :volume_mode
    value_field :volume_name

    validates :access_modes, field: { format: :string }, presence: false
    validates :data_source, object: { kind_of: KubeDSL::DSL::V1::TypedLocalObjectReference }
    validates :resources, object: { kind_of: KubeDSL::DSL::V1::ResourceRequirements }
    validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
    validates :storage_class_name, field: { format: :string }, presence: false
    validates :volume_mode, field: { format: :string }, presence: false
    validates :volume_name, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:accessModes] = access_modes
        result[:dataSource] = data_source.serialize
        result[:resources] = resources.serialize
        result[:selector] = selector.serialize
        result[:storageClassName] = storage_class_name
        result[:volumeMode] = volume_mode
        result[:volumeName] = volume_name
      end
    end

    def kind_sym
      :persistent_volume_claim_spec
    end
  end
end
