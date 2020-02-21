module KubeDSL::DSL::V1
  class SecretReference
    extend ::KubeDSL::ValueFields

    value_fields :name, :namespace

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :secret_reference
    end
  end
end
