module KubeDSL::DSL::V1
  class SecretKeySelector < ::KubeDSL::DSLObject
    value_fields :key, :name, :optional

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:name] = name
        result[:optional] = optional
      end
    end

    def kind_sym
      :secret_key_selector
    end
  end
end
