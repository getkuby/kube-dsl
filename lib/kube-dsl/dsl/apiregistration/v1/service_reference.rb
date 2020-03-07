module KubeDSL::DSL::Apiregistration::V1
  class ServiceReference < ::KubeDSL::DSLObject
    value_fields :name, :namespace, :port

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
        result[:port] = port
      end
    end

    def kind_sym
      :service_reference
    end
  end
end
