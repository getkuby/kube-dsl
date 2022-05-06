# typed: strict

module KubeDSL
  module DSL
    module V1
      class FlexPersistentVolumeSource < ::KubeDSL::DSLObject
        value_field :driver
        value_field :fs_type
        key_value_field(:options, format: :string)
        value_field :read_only
        object_field(:secret_ref) { KubeDSL::DSL::V1::SecretReference.new }

        validates :driver, field: { format: :string }, presence: false
        validates :fs_type, field: { format: :string }, presence: false
        validates :options, kv: { value_format: :string }, presence: false
        validates :read_only, field: { format: :boolean }, presence: false
        validates :secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretReference }

        def serialize
          {}.tap do |result|
            result[:driver] = driver
            result[:fsType] = fs_type
            result[:options] = options.serialize
            result[:readOnly] = read_only
            result[:secretRef] = secret_ref.serialize
          end
        end

        def kind_sym
          :flex_persistent_volume_source
        end
      end
    end
  end
end