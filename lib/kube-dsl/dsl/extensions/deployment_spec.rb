module KubeDSL::DSL::Extensions
  class DeploymentSpec
    extend ::KubeDSL::ValueFields

    value_fields :min_ready_seconds, :paused, :progress_deadline_seconds, :replicas, :revision_history_limit
    object_field(:rollback_to) { KubeDSL::DSL::Extensions::RollbackConfig.new }
    object_field(:selector) { KubeDSL::DSL::Meta::LabelSelector.new }
    object_field(:strategy) { KubeDSL::DSL::Extensions::DeploymentStrategy.new }
    object_field(:template) { KubeDSL::DSL::PodTemplateSpec.new }

    def serialize
      {}.tap do |result|
        result[:minReadySeconds] = min_ready_seconds
        result[:paused] = paused
        result[:progressDeadlineSeconds] = progress_deadline_seconds
        result[:replicas] = replicas
        result[:revisionHistoryLimit] = revision_history_limit
        result[:rollbackTo] = rollback_to.serialize
        result[:selector] = selector.serialize
        result[:strategy] = strategy.serialize
        result[:template] = template.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :deployment_spec
    end
  end
end
