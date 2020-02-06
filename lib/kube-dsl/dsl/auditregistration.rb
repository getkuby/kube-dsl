module KubeDSL::DSL::Auditregistration
  autoload :AuditSink, 'kube-dsl/dsl/auditregistration/audit_sink'
  autoload :AuditSinkList, 'kube-dsl/dsl/auditregistration/audit_sink_list'
  autoload :AuditSinkSpec, 'kube-dsl/dsl/auditregistration/audit_sink_spec'
  autoload :Policy, 'kube-dsl/dsl/auditregistration/policy'
  autoload :ServiceReference, 'kube-dsl/dsl/auditregistration/service_reference'
  autoload :Webhook, 'kube-dsl/dsl/auditregistration/webhook'
  autoload :WebhookClientConfig, 'kube-dsl/dsl/auditregistration/webhook_client_config'
  autoload :WebhookThrottleConfig, 'kube-dsl/dsl/auditregistration/webhook_throttle_config'
end
