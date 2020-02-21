module KubeDSL::DSL::V1
  class SecretEnvSource
    extend ::KubeDSL::ValueFields

    value_fields :name, :optional

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:optional] = optional
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :secret_env_source
    end
  end
end
