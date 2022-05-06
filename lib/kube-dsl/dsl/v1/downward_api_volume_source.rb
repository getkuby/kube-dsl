# typed: strict

module KubeDSL
  module DSL
    module V1
      class DownwardAPIVolumeSource < ::KubeDSL::DSLObject
        value_field :default_mode
        array_field(:item) { KubeDSL::DSL::V1::DownwardAPIVolumeFile.new }

        validates :default_mode, field: { format: :integer }, presence: false
        validates :items, array: { kind_of: KubeDSL::DSL::V1::DownwardAPIVolumeFile }, presence: false

        def serialize
          {}.tap do |result|
            result[:defaultMode] = default_mode
            result[:items] = items.map(&:serialize)
          end
        end

        def kind_sym
          :downward_api_volume_source
        end
      end
    end
  end
end