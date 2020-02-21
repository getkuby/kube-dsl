module KubeDSL::DSL::V1
  class NodeAffinity
    extend ::KubeDSL::ValueFields

    array_field(:preferred_during_scheduling_ignored_during_execution) { KubeDSL::DSL::V1::PreferredSchedulingTerm.new }
    object_field(:required_during_scheduling_ignored_during_execution) { KubeDSL::DSL::V1::NodeSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:preferredDuringSchedulingIgnoredDuringExecution] = preferred_during_scheduling_ignored_during_executions.map(&:serialize)
        result[:requiredDuringSchedulingIgnoredDuringExecution] = required_during_scheduling_ignored_during_execution.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :node_affinity
    end
  end
end
