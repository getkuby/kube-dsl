module KubeDSL::DSL::Extensions::V1beta1
  class IngressBackend < ::KubeDSL::DSLObject
    value_fields :service_name, :service_port

    def serialize
      {}.tap do |result|
        result[:serviceName] = service_name
        result[:servicePort] = service_port
      end
    end

    def kind_sym
      :ingress_backend
    end
  end
end
