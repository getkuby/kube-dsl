module KubeDSL::DSL::V1
  class SecretReference < ::KubeDSL::DSLObject
    value_fields :name, :namespace

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
      end
    end

    def kind_sym
      :secret_reference
    end
  end
end
