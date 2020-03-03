module KubeDSL::DSL::Apiregistration::V1beta1
  class ServiceReference < ::KubeDSL::DSLObject
    value_fields :name, :namespace, :port

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
        result[:port] = port
      end
    end

    def kind
      :service_reference
    end
  end
end
