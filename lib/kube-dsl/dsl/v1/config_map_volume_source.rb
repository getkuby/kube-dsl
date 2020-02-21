module KubeDSL::DSL::V1
  class ConfigMapVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :default_mode, :name, :optional
    array_field(:item) { KubeDSL::DSL::V1::KeyToPath.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:defaultMode] = default_mode
        result[:name] = name
        result[:optional] = optional
        result[:items] = items.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :config_map_volume_source
    end
  end
end
