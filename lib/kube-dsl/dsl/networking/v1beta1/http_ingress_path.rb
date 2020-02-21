module KubeDSL::DSL::Networking::V1beta1
  class HTTPIngressPath
    extend ::KubeDSL::ValueFields

    value_fields :path
    object_field(:backend) { KubeDSL::DSL::Networking::V1beta1::IngressBackend.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:backend] = backend.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :http_ingress_path
    end
  end
end
