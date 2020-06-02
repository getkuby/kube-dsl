module KubeDSL::DSL::V1
  class CephFSVolumeSource < ::KubeDSL::DSLObject
    value_fields :monitors, :path, :read_only, :secret_file, :user
    object_field(:secret_ref) { KubeDSL::DSL::V1::LocalObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:monitors] = monitors
        result[:path] = path
        result[:readOnly] = read_only
        result[:secretFile] = secret_file
        result[:user] = user
        result[:secretRef] = secret_ref.serialize
      end
    end

    def kind_sym
      :ceph_fs_volume_source
    end
  end
end
