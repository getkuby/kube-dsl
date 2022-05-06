# typed: strict

module KubeDSL
  module DSL
    module Apps
      module V1
        class DaemonSetSpec < ::KubeDSL::DSLObject
          value_field :min_ready_seconds
          value_field :revision_history_limit
          object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
          object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }
          object_field(:update_strategy) { KubeDSL::DSL::Apps::V1::DaemonSetUpdateStrategy.new }

          validates :min_ready_seconds, field: { format: :integer }, presence: false
          validates :revision_history_limit, field: { format: :integer }, presence: false
          validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
          validates :template, object: { kind_of: KubeDSL::DSL::V1::PodTemplateSpec }
          validates :update_strategy, object: { kind_of: KubeDSL::DSL::Apps::V1::DaemonSetUpdateStrategy }

          def serialize
            {}.tap do |result|
              result[:minReadySeconds] = min_ready_seconds
              result[:revisionHistoryLimit] = revision_history_limit
              result[:selector] = selector.serialize
              result[:template] = template.serialize
              result[:updateStrategy] = update_strategy.serialize
            end
          end

          def kind_sym
            :daemon_set_spec
          end
        end
      end
    end
  end
end