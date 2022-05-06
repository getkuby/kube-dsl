# typed: strict

module KubeDSL
  module DSL
    module V1
      class NodeAffinity < ::KubeDSL::DSLObject
        array_field(:preferred_during_scheduling_ignored_during_execution) { KubeDSL::DSL::V1::PreferredSchedulingTerm.new }
        object_field(:required_during_scheduling_ignored_during_execution) { KubeDSL::DSL::V1::NodeSelector.new }

        validates :preferred_during_scheduling_ignored_during_executions, array: { kind_of: KubeDSL::DSL::V1::PreferredSchedulingTerm }, presence: false
        validates :required_during_scheduling_ignored_during_execution, object: { kind_of: KubeDSL::DSL::V1::NodeSelector }

        def serialize
          {}.tap do |result|
            result[:preferredDuringSchedulingIgnoredDuringExecution] = preferred_during_scheduling_ignored_during_executions.map(&:serialize)
            result[:requiredDuringSchedulingIgnoredDuringExecution] = required_during_scheduling_ignored_during_execution.serialize
          end
        end

        def kind_sym
          :node_affinity
        end
      end
    end
  end
end