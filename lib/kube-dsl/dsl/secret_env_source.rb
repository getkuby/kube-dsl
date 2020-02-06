module KubeDSL::DSL
  class SecretEnvSource
    extend ::KubeDSL::ValueFields
    value_fields :name, :optional

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:optional] = optional
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
