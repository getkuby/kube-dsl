module KubeDSL::DSL::V1
  class StorageOSPersistentVolumeSource < ::KubeDSL::DSLObject
    value_field :fs_type
    value_field :read_only
    object_field(:secret_ref) { KubeDSL::DSL::V1::ObjectReference.new }
    value_field :volume_name
    value_field :volume_namespace

    validates :fs_type, field: { format: :string }, presence: false
    validates :read_only, field: { format: :boolean }, presence: false
    validates :secret_ref, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }
    validates :volume_name, field: { format: :string }, presence: false
    validates :volume_namespace, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:secretRef] = secret_ref.serialize
        result[:volumeName] = volume_name
        result[:volumeNamespace] = volume_namespace
      end
    end

    def kind_sym
      :storage_os_persistent_volume_source
    end
  end
end
