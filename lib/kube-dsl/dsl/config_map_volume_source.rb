module KubeDSL::DSL
  class ConfigMapVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :default_mode, :name, :optional
    array_field(:item) { KubeDSL::DSL::KeyToPath.new }

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
  end
end
