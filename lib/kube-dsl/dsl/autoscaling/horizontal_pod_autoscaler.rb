module KubeDSL::DSL::Autoscaling
  class HorizontalPodAutoscaler
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Autoscaling::HorizontalPodAutoscalerSpec.new }
    object_field(:status) { KubeDSL::DSL::Autoscaling::HorizontalPodAutoscalerStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "autoscaling/v2beta2"
        result[:kind] = "HorizontalPodAutoscaler"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :horizontal_pod_autoscaler
    end
  end
end
