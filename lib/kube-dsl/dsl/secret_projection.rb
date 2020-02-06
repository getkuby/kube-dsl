module KubeDSL::DSL
  class SecretProjection
    extend ::KubeDSL::ValueFields
    value_fields :name, :optional
    array_field(:item) { KubeDSL::DSL::KeyToPath.new }

    def serialize
      {}.tap do |result|
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
