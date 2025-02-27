# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class ContainerResourceMetricSource < ::KubeDSL::DSLObject
          value_field :container
          value_field :name
          object_field(:target) { KubeDSL::DSL::Autoscaling::V2::MetricTarget.new }

          validates :container, field: { format: :string }, presence: false
          validates :name, field: { format: :string }, presence: false
          validates :target, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::MetricTarget }

          def serialize
            {}.tap do |result|
              result[:container] = container
              result[:name] = name
              result[:target] = target.serialize
            end
          end

          def kind_sym
            :container_resource_metric_source
          end
        end
      end
    end
  end
end