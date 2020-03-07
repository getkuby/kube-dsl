module KubeDSL::DSL::V1
  class SecretProjection < ::KubeDSL::DSLObject
    value_fields :name, :optional
    array_field(:item) { KubeDSL::DSL::V1::KeyToPath.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:optional] = optional
        result[:items] = items.map(&:serialize)
      end
    end

    def kind_sym
      :secret_projection
    end
  end
end
