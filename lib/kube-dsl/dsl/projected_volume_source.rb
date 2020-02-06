module KubeDSL::DSL
  class ProjectedVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :default_mode
    array_field(:source) { KubeDSL::DSL::VolumeProjection.new }

    def serialize
      {}.tap do |result|
        result[:defaultMode] = default_mode
        result[:sources] = sources.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :projected_volume_source
    end
  end
end
