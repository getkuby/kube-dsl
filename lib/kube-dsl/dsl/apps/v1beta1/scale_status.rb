module KubeDSL::DSL::Apps::V1beta1
  class ScaleStatus < ::KubeDSL::DSLObject
    value_field :replicas
    key_value_field(:selector, format: :string)
    value_field :target_selector

    validates :replicas, field: { format: :integer }, presence: false
    validates :selector, kv: { value_format: :string }, presence: false
    validates :target_selector, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
        result[:selector] = selector.serialize
        result[:targetSelector] = target_selector
      end
    end

    def kind_sym
      :scale_status
    end
  end
end
