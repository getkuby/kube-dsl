# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class MetricSpec < ::KubeDSL::DSLObject
          object_field(:container_resource) { KubeDSL::DSL::Autoscaling::V2::ContainerResourceMetricSource.new }
          object_field(:external) { KubeDSL::DSL::Autoscaling::V2::ExternalMetricSource.new }
          object_field(:object) { KubeDSL::DSL::Autoscaling::V2::ObjectMetricSource.new }
          object_field(:pods) { KubeDSL::DSL::Autoscaling::V2::PodsMetricSource.new }
          object_field(:resource) { KubeDSL::DSL::Autoscaling::V2::ResourceMetricSource.new }
          value_field :type

          validates :container_resource, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::ContainerResourceMetricSource }
          validates :external, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::ExternalMetricSource }
          validates :object, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::ObjectMetricSource }
          validates :pods, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::PodsMetricSource }
          validates :resource, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::ResourceMetricSource }
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
            :metric_spec
          end
        end
      end
    end
  end
end