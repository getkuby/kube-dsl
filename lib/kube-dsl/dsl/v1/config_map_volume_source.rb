# typed: strict

module KubeDSL
  module DSL
    module V1
      class ConfigMapVolumeSource < ::KubeDSL::DSLObject
        value_field :default_mode
        array_field(:item) { KubeDSL::DSL::V1::KeyToPath.new }
        value_field :name
        value_field :optional

        validates :default_mode, field: { format: :integer }, presence: false
        validates :items, array: { kind_of: KubeDSL::DSL::V1::KeyToPath }, presence: false
        validates :name, field: { format: :string }, presence: false
        validates :optional, field: { format: :boolean }, presence: false

        def serialize
          {}.tap do |result|
            result[:defaultMode] = default_mode
            result[:items] = items.map(&:serialize)
            result[:name] = name
            result[:optional] = optional
          end
        end

        def kind_sym
          :config_map_volume_source
        end
      end
    end
  end
end