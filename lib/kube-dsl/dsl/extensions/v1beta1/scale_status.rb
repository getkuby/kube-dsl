module KubeDSL::DSL::Extensions::V1beta1
  class ScaleStatus < ::KubeDSL::DSLObject
    value_fields :replicas, :target_selector
    key_value_field(:selector, format: :string)

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
        result[:targetSelector] = target_selector
        result[:selector] = selector.serialize
      end
    end

    def kind_sym
      :scale_status
    end
  end
end
