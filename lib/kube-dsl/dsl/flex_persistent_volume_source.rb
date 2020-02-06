module KubeDSL::DSL
  class FlexPersistentVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :driver, :fs_type, :read_only
    object_field(:secret_ref) { KubeDSL::DSL::SecretReference.new }
    object_field(:options) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:driver] = driver
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:secretRef] = secret_ref.serialize
        result[:options] = options.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :flex_persistent_volume_source
    end
  end
end
