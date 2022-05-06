# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class ResourceMetricStatus < ::KubeDSL::DSLObject
          object_field(:current) { KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus.new }
          value_field :name

          validates :current, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus }
          validates :name, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:current] = current.serialize
              result[:name] = name
            end
          end

          def kind_sym
            :resource_metric_status
          end
        end
      end
    end
  end
end