module KubeDSL::DSL::V1
  class ConfigMapVolumeSource < ::KubeDSL::DSLObject
    value_fields :default_mode, :name, :optional
    array_field(:item) { KubeDSL::DSL::V1::KeyToPath.new }

    def serialize
      {}.tap do |result|
        result[:defaultMode] = default_mode
        result[:name] = name
        result[:optional] = optional
        result[:items] = items.map(&:serialize)
      end
    end

    def kind_sym
      :config_map_volume_source
    end
  end
end
