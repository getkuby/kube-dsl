# typed: true

module KubeDSL::DSL::Networking::V1
  class IngressClassSpec < ::KubeDSL::DSLObject
    value_field :controller
    object_field(:parameters) { KubeDSL::DSL::Networking::V1::IngressClassParametersReference.new }

    validates :controller, field: { format: :string }, presence: false
    validates :parameters, object: { kind_of: KubeDSL::DSL::Networking::V1::IngressClassParametersReference }

    def serialize
      {}.tap do |result|
        result[:controller] = controller
        result[:parameters] = parameters.serialize
      end
    end

    def kind_sym
      :ingress_class_spec
    end
  end
end
