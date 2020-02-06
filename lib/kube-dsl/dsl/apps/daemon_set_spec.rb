module KubeDSL::DSL::Apps
  class DaemonSetSpec
    extend ::KubeDSL::ValueFields

    value_fields :min_ready_seconds, :revision_history_limit
    object_field(:selector) { KubeDSL::DSL::Meta::LabelSelector.new }
    object_field(:template) { KubeDSL::DSL::PodTemplateSpec.new }
    object_field(:update_strategy) { KubeDSL::DSL::Apps::DaemonSetUpdateStrategy.new }

    def serialize
      {}.tap do |result|
        result[:minReadySeconds] = min_ready_seconds
        result[:revisionHistoryLimit] = revision_history_limit
        result[:selector] = selector.serialize
        result[:template] = template.serialize
        result[:updateStrategy] = update_strategy.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :daemon_set_spec
    end
  end
end
