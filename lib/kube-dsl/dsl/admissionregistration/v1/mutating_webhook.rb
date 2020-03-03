module KubeDSL::DSL::Admissionregistration::V1
  class MutatingWebhook < ::KubeDSL::DSLObject
    value_fields :failure_policy, :match_policy, :name, :reinvocation_policy, :side_effects, :timeout_seconds
    array_field :admission_review_version
    array_field(:rule) { KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations.new }
    object_field(:client_config) { KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig.new }
    object_field(:namespace_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:object_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:failurePolicy] = failure_policy
        result[:matchPolicy] = match_policy
        result[:name] = name
        result[:reinvocationPolicy] = reinvocation_policy
        result[:sideEffects] = side_effects
        result[:timeoutSeconds] = timeout_seconds
        result[:admissionReviewVersions] = admission_review_versions
        result[:rules] = rules.map(&:serialize)
        result[:clientConfig] = client_config.serialize
        result[:namespaceSelector] = namespace_selector.serialize
        result[:objectSelector] = object_selector.serialize
      end
    end

    def kind
      :mutating_webhook
    end
  end
end
