# typed: true

module KubeDSL::DSL::Flowcontrol::V1beta1
  class FlowDistinguisherMethod < ::KubeDSL::DSLObject
    value_field :type

    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:type] = type
      end
    end

    def kind_sym
      :flow_distinguisher_method
    end
  end
end
