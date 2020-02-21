module KubeDSL::DSL::Apps::V1
  class StatefulSetSpec
    extend ::KubeDSL::ValueFields

    value_fields :pod_management_policy, :replicas, :revision_history_limit, :service_name
    array_field(:volume_claim_template) { KubeDSL::DSL::V1::PersistentVolumeClaim.new }
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }
    object_field(:update_strategy) { KubeDSL::DSL::Apps::V1::StatefulSetUpdateStrategy.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:podManagementPolicy] = pod_management_policy
        result[:replicas] = replicas
        result[:revisionHistoryLimit] = revision_history_limit
        result[:serviceName] = service_name
        result[:volumeClaimTemplates] = volume_claim_templates.map(&:serialize)
        result[:selector] = selector.serialize
        result[:template] = template.serialize
        result[:updateStrategy] = update_strategy.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :stateful_set_spec
    end
  end
end
