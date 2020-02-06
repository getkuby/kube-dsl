module KubeDSL::DSL::Apiregistration
  class ServiceReference
    extend ::KubeDSL::ValueFields
    value_fields :name, :namespace, :port

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
  end
end
