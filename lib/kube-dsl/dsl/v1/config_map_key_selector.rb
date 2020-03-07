module KubeDSL::DSL::V1
  class ConfigMapKeySelector < ::KubeDSL::DSLObject
    value_fields :key, :name, :optional

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:name] = name
        result[:optional] = optional
      end
    end

    def kind_sym
      :config_map_key_selector
    end
  end
end
