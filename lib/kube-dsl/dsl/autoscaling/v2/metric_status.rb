# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class MetricStatus < ::KubeDSL::DSLObject
          object_field(:container_resource) { KubeDSL::DSL::Autoscaling::V2::ContainerResourceMetricStatus.new }
          object_field(:external) { KubeDSL::DSL::Autoscaling::V2::ExternalMetricStatus.new }
          object_field(:object) { KubeDSL::DSL::Autoscaling::V2::ObjectMetricStatus.new }
          object_field(:pods) { KubeDSL::DSL::Autoscaling::V2::PodsMetricStatus.new }
          object_field(:resource) { KubeDSL::DSL::Autoscaling::V2::ResourceMetricStatus.new }
          value_field :type

          validates :container_resource, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::ContainerResourceMetricStatus }
          validates :external, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::ExternalMetricStatus }
          validates :object, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::ObjectMetricStatus }
          validates :pods, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::PodsMetricStatus }
          validates :resource, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::ResourceMetricStatus }
          validates :type, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:containerResource] = container_resource.serialize
              result[:external] = external.serialize
              result[:object] = object.serialize
              result[:pods] = pods.serialize
              result[:resource] = resource.serialize
              result[:type] = type
            end
          end

          def kind_sym
            :metric_status
          end
        end
      end
    end
  end
end