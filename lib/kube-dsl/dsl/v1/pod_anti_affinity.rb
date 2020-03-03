module KubeDSL::DSL::V1
  class PodAntiAffinity < ::KubeDSL::DSLObject
    array_field(:preferred_during_scheduling_ignored_during_execution) { KubeDSL::DSL::V1::WeightedPodAffinityTerm.new }
    array_field(:required_during_scheduling_ignored_during_execution) { KubeDSL::DSL::V1::PodAffinityTerm.new }

    def serialize
      {}.tap do |result|
        result[:preferredDuringSchedulingIgnoredDuringExecution] = preferred_during_scheduling_ignored_during_executions.map(&:serialize)
        result[:requiredDuringSchedulingIgnoredDuringExecution] = required_during_scheduling_ignored_during_executions.map(&:serialize)
      end
    end

    def kind
      :pod_anti_affinity
    end
  end
end
