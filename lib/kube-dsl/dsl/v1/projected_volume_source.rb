module KubeDSL::DSL::V1
  class ProjectedVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :default_mode
    array_field(:source) { KubeDSL::DSL::V1::VolumeProjection.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
