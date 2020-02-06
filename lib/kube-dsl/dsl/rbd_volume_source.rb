module KubeDSL::DSL
  class RBDVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :fs_type, :image, :keyring, :pool, :read_only, :user
    array_field :monitor
    object_field(:secret_ref) { KubeDSL::DSL::LocalObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:image] = image
        result[:keyring] = keyring
        result[:pool] = pool
        result[:readOnly] = read_only
        result[:user] = user
        result[:monitors] = monitors
        result[:secretRef] = secret_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :rbd_volume_source
    end
  end
end
