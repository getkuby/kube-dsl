module KubeDSL::DSL::Apiregistration::V1
  class ServiceReference
    extend ::KubeDSL::ValueFields

    value_fields :name, :namespace, :port

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
        result[:port] = port
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :service_reference
    end
  end
end
