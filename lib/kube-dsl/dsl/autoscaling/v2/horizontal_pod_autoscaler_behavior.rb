# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class HorizontalPodAutoscalerBehavior < ::KubeDSL::DSLObject
          object_field(:scale_down) { KubeDSL::DSL::Autoscaling::V2::HPAScalingRules.new }
          object_field(:scale_up) { KubeDSL::DSL::Autoscaling::V2::HPAScalingRules.new }

          validates :scale_down, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::HPAScalingRules }
          validates :scale_up, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::HPAScalingRules }

          def serialize
            {}.tap do |result|
              result[:scaleDown] = scale_down.serialize
              result[:scaleUp] = scale_up.serialize
            end
          end

          def kind_sym
            :horizontal_pod_autoscaler_behavior
          end
        end
      end
    end
  end
end