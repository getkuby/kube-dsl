module KubeDSL::DSL::Admissionregistration
  autoload :MutatingWebhook, 'kube-dsl/dsl/admissionregistration/mutating_webhook'
  autoload :MutatingWebhookConfiguration, 'kube-dsl/dsl/admissionregistration/mutating_webhook_configuration'
  autoload :MutatingWebhookConfigurationList, 'kube-dsl/dsl/admissionregistration/mutating_webhook_configuration_list'
  autoload :RuleWithOperations, 'kube-dsl/dsl/admissionregistration/rule_with_operations'
  autoload :ServiceReference, 'kube-dsl/dsl/admissionregistration/service_reference'
  autoload :ValidatingWebhook, 'kube-dsl/dsl/admissionregistration/validating_webhook'
  autoload :ValidatingWebhookConfiguration, 'kube-dsl/dsl/admissionregistration/validating_webhook_configuration'
  autoload :ValidatingWebhookConfigurationList, 'kube-dsl/dsl/admissionregistration/validating_webhook_configuration_list'
  autoload :WebhookClientConfig, 'kube-dsl/dsl/admissionregistration/webhook_client_config'
end
