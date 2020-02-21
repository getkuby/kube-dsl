module KubeDSL::DSL::V1
  class ConfigMapProjection
    extend ::KubeDSL::ValueFields

    value_fields :name, :optional
    array_field(:item) { KubeDSL::DSL::V1::KeyToPath.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :config_map_projection
    end
  end
end
