module KubeDSL::DSL::V1
  class DownwardAPIVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :default_mode
    array_field(:item) { KubeDSL::DSL::V1::DownwardAPIVolumeFile.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:defaultMode] = default_mode
        result[:items] = items.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :downward_api_volume_source
    end
  end
end
