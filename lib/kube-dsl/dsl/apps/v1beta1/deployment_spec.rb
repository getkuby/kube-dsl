module KubeDSL::DSL::Apps::V1beta1
  class DeploymentSpec < ::KubeDSL::DSLObject
    value_fields :min_ready_seconds, :paused, :progress_deadline_seconds, :replicas, :revision_history_limit
    object_field(:rollback_to) { KubeDSL::DSL::Apps::V1beta1::RollbackConfig.new }
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:strategy) { KubeDSL::DSL::Apps::V1beta1::DeploymentStrategy.new }
    object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }

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

    def kind_sym
      :deployment_spec
    end
  end
end
