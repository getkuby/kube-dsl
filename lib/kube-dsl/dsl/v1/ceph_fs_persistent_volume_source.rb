# typed: true

module KubeDSL
  module DSL
    module V1
      class CephFSPersistentVolumeSource < ::KubeDSL::DSLObject
        value_field :monitors
        value_field :path
        value_field :read_only
        value_field :secret_file
        object_field(:secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
        value_field :user

        validates :monitors, field: { format: :string }, presence: false
        validates :path, field: { format: :string }, presence: false
        validates :read_only, field: { format: :boolean }, presence: false
        validates :secret_file, field: { format: :string }, presence: false
        validates :secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretReference }
        validates :user, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:monitors] = monitors
            result[:path] = path
            result[:readOnly] = read_only
            result[:secretFile] = secret_file
            result[:secretRef] = secret_ref.serialize
            result[:user] = user
          end
        end

        def kind_sym
          :ceph_fs_persistent_volume_source
        end
      end
    end
  end
end