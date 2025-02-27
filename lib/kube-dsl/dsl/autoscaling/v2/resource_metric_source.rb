# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class ResourceMetricSource < ::KubeDSL::DSLObject
          value_field :name
          object_field(:target) { KubeDSL::DSL::Autoscaling::V2::MetricTarget.new }

          validates :name, field: { format: :string }, presence: false
          validates :target, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::MetricTarget }

          def serialize
            {}.tap do |result|
              result[:name] = name
              result[:target] = target.serialize
            end
          end

          def kind_sym
            :resource_metric_source
          end
        end
      end
    end
  end
end