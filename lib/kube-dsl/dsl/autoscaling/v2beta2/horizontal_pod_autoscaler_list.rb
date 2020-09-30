module KubeDSL::DSL::Autoscaling::V2beta2
  class HorizontalPodAutoscalerList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscaler.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscaler }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "autoscaling/v2beta2"
        result[:items] = items.map(&:serialize)
        result[:kind] = "HorizontalPodAutoscalerList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :horizontal_pod_autoscaler_list
    end
  end
end
