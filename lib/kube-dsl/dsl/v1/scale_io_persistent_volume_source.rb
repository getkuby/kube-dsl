module KubeDSL::DSL::V1
  class ScaleIOPersistentVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :gateway, :protection_domain, :read_only, :ssl_enabled, :storage_mode, :storage_pool, :system, :volume_name
    object_field(:secret_ref) { KubeDSL::DSL::V1::SecretReference.new }

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:gateway] = gateway
        result[:protectionDomain] = protection_domain
        result[:readOnly] = read_only
        result[:sslEnabled] = ssl_enabled
        result[:storageMode] = storage_mode
        result[:storagePool] = storage_pool
        result[:system] = system
        result[:volumeName] = volume_name
        result[:secretRef] = secret_ref.serialize
      end
    end

    def kind_sym
      :scale_io_persistent_volume_source
    end
  end
end
