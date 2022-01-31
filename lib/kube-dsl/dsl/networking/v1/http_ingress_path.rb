# typed: true

module KubeDSL::DSL::Networking::V1
  class HTTPIngressPath < ::KubeDSL::DSLObject
    object_field(:backend) { KubeDSL::DSL::Networking::V1::IngressBackend.new }
    value_field :path
    value_field :path_type

    validates :backend, object: { kind_of: KubeDSL::DSL::Networking::V1::IngressBackend }
    validates :path, field: { format: :string }, presence: false
    validates :path_type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:backend] = backend.serialize
        result[:path] = path
        result[:pathType] = path_type
      end
    end

    def kind_sym
      :http_ingress_path
    end
  end
end
