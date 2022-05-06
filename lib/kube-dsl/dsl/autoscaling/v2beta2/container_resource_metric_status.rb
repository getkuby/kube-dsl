# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class ContainerResourceMetricStatus < ::KubeDSL::DSLObject
          value_field :container
          object_field(:current) { KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus.new }
          value_field :name

          validates :container, field: { format: :string }, presence: false
          validates :current, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus }
          validates :name, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:container] = container
              result[:current] = current.serialize
              result[:name] = name
            end
          end

          def kind_sym
            :container_resource_metric_status
          end
        end
      end
    end
  end
end