module KubeDSL::DSL::Flowcontrol::V1alpha1
  class LimitResponse < ::KubeDSL::DSLObject
    object_field(:queuing) { KubeDSL::DSL::Flowcontrol::V1alpha1::QueuingConfiguration.new }
    value_field :type

    validates :queuing, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1alpha1::QueuingConfiguration }
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:queuing] = queuing.serialize
        result[:type] = type
      end
    end

    def kind_sym
      :limit_response
    end
  end
end
