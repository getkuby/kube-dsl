# typed: true

module KubeDSL
  module DSL
    module V1
      class RBDPersistentVolumeSource < ::KubeDSL::DSLObject
        value_field :fs_type
        value_field :image
        value_field :keyring
        value_field :monitors
        value_field :pool
        value_field :read_only
        object_field(:secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
        value_field :user

        validates :fs_type, field: { format: :string }, presence: false
        validates :image, field: { format: :string }, presence: false
        validates :keyring, field: { format: :string }, presence: false
        validates :monitors, field: { format: :string }, presence: false
        validates :pool, field: { format: :string }, presence: false
        validates :read_only, field: { format: :boolean }, presence: false
        validates :secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretReference }
        validates :user, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:fsType] = fs_type
            result[:image] = image
            result[:keyring] = keyring
            result[:monitors] = monitors
            result[:pool] = pool
            result[:readOnly] = read_only
            result[:secretRef] = secret_ref.serialize
            result[:user] = user
          end
        end

        def kind_sym
          :rbd_persistent_volume_source
        end
      end
    end
  end
end