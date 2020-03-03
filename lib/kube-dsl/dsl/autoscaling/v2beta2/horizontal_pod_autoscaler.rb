module KubeDSL::DSL::Autoscaling::V2beta2
  class HorizontalPodAutoscaler < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerSpec.new }
    object_field(:status) { KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "autoscaling/v2beta2"
        result[:kind] = "HorizontalPodAutoscaler"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :horizontal_pod_autoscaler
    end
  end
end
