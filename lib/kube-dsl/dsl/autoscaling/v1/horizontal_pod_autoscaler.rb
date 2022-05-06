# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V1
        class HorizontalPodAutoscaler < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:spec) { KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerSpec.new }
          object_field(:status) { KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerStatus.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, object: { kind_of: KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerSpec }
          validates :status, object: { kind_of: KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerStatus }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "autoscaling/v1"
              result[:kind] = "HorizontalPodAutoscaler"
              result[:metadata] = metadata.serialize
              result[:spec] = spec.serialize
              result[:status] = status.serialize
            end
          end

          def kind_sym
            :horizontal_pod_autoscaler
          end
        end
      end
    end
  end
end