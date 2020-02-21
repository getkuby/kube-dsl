module KubeDSL::DSL::V1
  class SecretKeySelector
    extend ::KubeDSL::ValueFields

    value_fields :key, :name, :optional

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :secret_key_selector
    end
  end
end
