# typed: true

module KubeDSL::DSL::Apps::V1beta2
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
