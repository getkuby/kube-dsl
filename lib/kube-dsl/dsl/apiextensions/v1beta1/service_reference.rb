module KubeDSL::DSL::Apiextensions::V1beta1
  class ServiceReference
    extend ::KubeDSL::ValueFields

    value_fields :name, :namespace, :path, :port

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
        result[:path] = path
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
