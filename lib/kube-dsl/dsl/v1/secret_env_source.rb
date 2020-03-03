module KubeDSL::DSL::V1
  class SecretEnvSource < ::KubeDSL::DSLObject
    value_fields :name, :optional

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:optional] = optional
      end
    end

    def kind
      :secret_env_source
    end
  end
end
