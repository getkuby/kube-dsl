module KubeDSL::DSL::Extensions::V1beta1
  class ScaleStatus < ::KubeDSL::DSLObject
    value_fields :replicas, :target_selector
    object_field(:selector) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
        result[:targetSelector] = target_selector
        result[:selector] = selector.serialize
      end
    end

    def kind
      :scale_status
    end
  end
end
