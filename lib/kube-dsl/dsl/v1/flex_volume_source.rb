module KubeDSL::DSL::V1
  class FlexVolumeSource < ::KubeDSL::DSLObject
    value_fields :driver, :fs_type, :read_only
    object_field(:secret_ref) { KubeDSL::DSL::V1::LocalObjectReference.new }
    object_field(:options) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:driver] = driver
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:secretRef] = secret_ref.serialize
        result[:options] = options.serialize
      end
    end

    def kind_sym
      :flex_volume_source
    end
  end
end
