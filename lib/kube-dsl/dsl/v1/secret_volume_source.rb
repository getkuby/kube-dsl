# typed: true

module KubeDSL
  module DSL
    module V1
      class SecretVolumeSource < ::KubeDSL::DSLObject
        value_field :default_mode
        array_field(:item) { KubeDSL::DSL::V1::KeyToPath.new }
        value_field :optional
        value_field :secret_name

        validates :default_mode, field: { format: :integer }, presence: false
        validates :items, array: { kind_of: KubeDSL::DSL::V1::KeyToPath }, presence: false
        validates :optional, field: { format: :boolean }, presence: false
        validates :secret_name, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:defaultMode] = default_mode
            result[:items] = items.map(&:serialize)
            result[:optional] = optional
            result[:secretName] = secret_name
          end
        end

        def kind_sym
          :secret_volume_source
        end
      end
    end
  end
end