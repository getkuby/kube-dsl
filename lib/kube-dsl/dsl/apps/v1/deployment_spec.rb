module KubeDSL::DSL::Apps::V1
  class DeploymentSpec < ::KubeDSL::DSLObject
    value_field :min_ready_seconds
    value_field :paused
    value_field :progress_deadline_seconds
    value_field :replicas
    value_field :revision_history_limit
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:strategy) { KubeDSL::DSL::Apps::V1::DeploymentStrategy.new }
    object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }

    validates :min_ready_seconds, field: { format: :integer }, presence: false
    validates :paused, field: { format: :boolean }, presence: false
    validates :progress_deadline_seconds, field: { format: :integer }, presence: false
    validates :replicas, field: { format: :integer }, presence: false
    validates :revision_history_limit, field: { format: :integer }, presence: false
    validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
    validates :strategy, object: { kind_of: KubeDSL::DSL::Apps::V1::DeploymentStrategy }
    validates :template, object: { kind_of: KubeDSL::DSL::V1::PodTemplateSpec }

    def serialize
      {}.tap do |result|
        result[:minReadySeconds] = min_ready_seconds
        result[:paused] = paused
        result[:progressDeadlineSeconds] = progress_deadline_seconds
        result[:replicas] = replicas
        result[:revisionHistoryLimit] = revision_history_limit
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
