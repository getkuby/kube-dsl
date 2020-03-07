module KubeDSL::DSL::Auditregistration::V1alpha1
  class AuditSinkSpec < ::KubeDSL::DSLObject
    object_field(:policy) { KubeDSL::DSL::Auditregistration::V1alpha1::Policy.new }
    object_field(:webhook) { KubeDSL::DSL::Auditregistration::V1alpha1::Webhook.new }

    def serialize
      {}.tap do |result|
        result[:policy] = policy.serialize
        result[:webhook] = webhook.serialize
      end
    end

    def kind_sym
      :audit_sink_spec
    end
  end
end
