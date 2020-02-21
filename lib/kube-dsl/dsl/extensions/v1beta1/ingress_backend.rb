module KubeDSL::DSL::Extensions::V1beta1
  class IngressBackend
    extend ::KubeDSL::ValueFields

    value_fields :service_name, :service_port

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:serviceName] = service_name
        result[:servicePort] = service_port
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :ingress_backend
    end
  end
end
