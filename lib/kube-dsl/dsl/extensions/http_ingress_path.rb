module KubeDSL::DSL::Extensions
  class HTTPIngressPath
    extend ::KubeDSL::ValueFields
    value_fields :path
    object_field(:backend) { KubeDSL::DSL::Extensions::IngressBackend.new }

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
