module KubeDSL::DSL::Extensions::V1beta1
  class ScaleSpec < ::KubeDSL::DSLObject
    value_field :replicas

    validates :replicas, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
      end
    end

    def kind_sym
      :scale_spec
    end
  end
end
