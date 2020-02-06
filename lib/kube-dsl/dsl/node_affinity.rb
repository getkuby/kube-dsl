module KubeDSL::DSL
  class NodeAffinity
    extend ::KubeDSL::ValueFields
    array_field(:preferred_during_scheduling_ignored_during_execution) { KubeDSL::DSL::PreferredSchedulingTerm.new }
    object_field(:required_during_scheduling_ignored_during_execution) { KubeDSL::DSL::NodeSelector.new }

    def serialize
      {}.tap do |result|
        result[:preferredDuringSchedulingIgnoredDuringExecution] = preferred_during_scheduling_ignored_during_executions.map(&:serialize)
        result[:requiredDuringSchedulingIgnoredDuringExecution] = required_during_scheduling_ignored_during_execution.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
