module KubeDSL::DSL::Extensions::V1beta1
  class HTTPIngressPath < ::KubeDSL::DSLObject
    object_field(:backend) { KubeDSL::DSL::Extensions::V1beta1::IngressBackend.new }
    value_field :path

    validates :backend, object: { kind_of: KubeDSL::DSL::Extensions::V1beta1::IngressBackend }
    validates :path, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:backend] = backend.serialize
        result[:path] = path
      end
    end

    def kind_sym
      :http_ingress_path
    end
  end
end
