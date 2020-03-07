module KubeDSL::DSL::Autoscaling::V2beta2
  class HorizontalPodAutoscalerList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscaler.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "autoscaling/v2beta2"
        result[:kind] = "HorizontalPodAutoscalerList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :horizontal_pod_autoscaler_list
    end
  end
end
