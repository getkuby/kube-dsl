module KubeDSL::DSL::Networking::V1beta1
  class HTTPIngressPath < ::KubeDSL::DSLObject
    value_fields :path
    object_field(:backend) { KubeDSL::DSL::Networking::V1beta1::IngressBackend.new }

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:backend] = backend.serialize
      end
    end

    def kind
      :http_ingress_path
    end
  end
end
