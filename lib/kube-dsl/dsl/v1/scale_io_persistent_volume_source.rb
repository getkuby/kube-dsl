# typed: strict

module KubeDSL
  module DSL
    module V1
      class ScaleIOPersistentVolumeSource < ::KubeDSL::DSLObject
        value_field :fs_type
        value_field :gateway
        value_field :protection_domain
        value_field :read_only
        object_field(:secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
        value_field :ssl_enabled
        value_field :storage_mode
        value_field :storage_pool
        value_field :system
        value_field :volume_name

        validates :fs_type, field: { format: :string }, presence: false
        validates :gateway, field: { format: :string }, presence: false
        validates :protection_domain, field: { format: :string }, presence: false
        validates :read_only, field: { format: :boolean }, presence: false
        validates :secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretReference }
        validates :ssl_enabled, field: { format: :boolean }, presence: false
        validates :storage_mode, field: { format: :string }, presence: false
        validates :storage_pool, field: { format: :string }, presence: false
        validates :system, field: { format: :string }, presence: false
        validates :volume_name, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:fsType] = fs_type
            result[:gateway] = gateway
            result[:protectionDomain] = protection_domain
            result[:readOnly] = read_only
            result[:secretRef] = secret_ref.serialize
            result[:sslEnabled] = ssl_enabled
            result[:storageMode] = storage_mode
            result[:storagePool] = storage_pool
            result[:system] = system
            result[:volumeName] = volume_name
          end
        end

        def kind_sym
          :scale_io_persistent_volume_source
        end
      end
    end
  end
end