# typed: strict

module KubeDSL
  module DSL
    module V1
      class ProjectedVolumeSource < ::KubeDSL::DSLObject
        value_field :default_mode
        array_field(:source) { KubeDSL::DSL::V1::VolumeProjection.new }

        validates :default_mode, field: { format: :integer }, presence: false
        validates :sources, array: { kind_of: KubeDSL::DSL::V1::VolumeProjection }, presence: false

        def serialize
          {}.tap do |result|
            result[:defaultMode] = default_mode
            result[:sources] = sources.map(&:serialize)
          end
        end

        def kind_sym
          :projected_volume_source
        end
      end
    end
  end
end