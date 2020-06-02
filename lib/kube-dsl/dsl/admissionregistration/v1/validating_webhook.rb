module KubeDSL::DSL::Admissionregistration::V1
  class ValidatingWebhook < ::KubeDSL::DSLObject
    value_fields :admission_review_versions, :failure_policy, :match_policy, :name, :side_effects, :timeout_seconds
    array_field(:rule) { KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations.new }
    object_field(:client_config) { KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig.new }
    object_field(:namespace_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:object_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:admissionReviewVersions] = admission_review_versions
        result[:failurePolicy] = failure_policy
        result[:matchPolicy] = match_policy
        result[:name] = name
        result[:sideEffects] = side_effects
        result[:timeoutSeconds] = timeout_seconds
        result[:rules] = rules.map(&:serialize)
        result[:clientConfig] = client_config.serialize
        result[:namespaceSelector] = namespace_selector.serialize
        result[:objectSelector] = object_selector.serialize
      end
    end

    def kind_sym
      :validating_webhook
    end
  end
end
