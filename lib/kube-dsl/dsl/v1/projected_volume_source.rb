module KubeDSL::DSL::V1
  class ProjectedVolumeSource < ::KubeDSL::DSLObject
    value_fields :default_mode
    array_field(:source) { KubeDSL::DSL::V1::VolumeProjection.new }

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
