# typed: true

module KubeDSL::DSL::Admissionregistration::V1
  class ValidatingWebhook < ::KubeDSL::DSLObject
    value_field :admission_review_versions
    object_field(:client_config) { KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig.new }
    value_field :failure_policy
    value_field :match_policy
    value_field :name
    object_field(:namespace_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:object_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    array_field(:rule) { KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations.new }
    value_field :side_effects
    value_field :timeout_seconds

    validates :admission_review_versions, field: { format: :string }, presence: false
    validates :client_config, object: { kind_of: KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig }
    validates :failure_policy, field: { format: :string }, presence: false
    validates :match_policy, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :namespace_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
    validates :object_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
    validates :rules, array: { kind_of: KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations }, presence: false
    validates :side_effects, field: { format: :string }, presence: false
    validates :timeout_seconds, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:admissionReviewVersions] = admission_review_versions
        result[:clientConfig] = client_config.serialize
        result[:failurePolicy] = failure_policy
        result[:matchPolicy] = match_policy
        result[:name] = name
        result[:namespaceSelector] = namespace_selector.serialize
        result[:objectSelector] = object_selector.serialize
        result[:rules] = rules.map(&:serialize)
        result[:sideEffects] = side_effects
        result[:timeoutSeconds] = timeout_seconds
      end
    end

    def kind_sym
      :validating_webhook
    end
  end
end
