module KubeDSL::DSL::Networking
  class HTTPIngressPath
    extend ::KubeDSL::ValueFields
    value_fields :path
    object_field(:backend) { KubeDSL::DSL::Networking::IngressBackend.new }

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:backend] = backend.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
