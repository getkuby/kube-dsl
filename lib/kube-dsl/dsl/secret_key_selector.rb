module KubeDSL::DSL
  class SecretKeySelector
    extend ::KubeDSL::ValueFields
    value_fields :key, :name, :optional

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:name] = name
        result[:optional] = optional
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
