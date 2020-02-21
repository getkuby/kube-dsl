module KubeDSL::DSL::V1
  class CephFSVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :path, :read_only, :secret_file, :user
    array_field :monitor
    object_field(:secret_ref) { KubeDSL::DSL::V1::LocalObjectReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:readOnly] = read_only
        result[:secretFile] = secret_file
        result[:user] = user
        result[:monitors] = monitors
        result[:secretRef] = secret_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :ceph_fs_volume_source
    end
  end
end
