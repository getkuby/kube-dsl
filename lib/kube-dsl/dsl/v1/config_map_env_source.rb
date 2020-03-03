module KubeDSL::DSL::V1
  class ConfigMapEnvSource < ::KubeDSL::DSLObject
    value_fields :name, :optional

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:optional] = optional
      end
    end

    def kind
      :config_map_env_source
    end
  end
end
