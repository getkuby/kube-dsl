# typed: true

module KubeDSL::DSL::Autoscaling::V1
  class ScaleStatus < ::KubeDSL::DSLObject
    value_field :replicas
    value_field :selector

    validates :replicas, field: { format: :integer }, presence: false
    validates :selector, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
        result[:selector] = selector
      end
    end

    def kind_sym
      :scale_status
    end
  end
end
