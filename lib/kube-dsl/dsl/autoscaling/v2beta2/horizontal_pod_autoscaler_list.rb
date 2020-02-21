module KubeDSL::DSL::Autoscaling::V2beta2
  class HorizontalPodAutoscalerList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscaler.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "autoscaling/v2beta2"
        result[:kind] = "HorizontalPodAutoscalerList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :horizontal_pod_autoscaler_list
    end
  end
end
