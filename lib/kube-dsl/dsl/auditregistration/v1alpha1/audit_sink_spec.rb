module KubeDSL::DSL::Auditregistration::V1alpha1
  class AuditSinkSpec
    extend ::KubeDSL::ValueFields

    object_field(:policy) { KubeDSL::DSL::Auditregistration::V1alpha1::Policy.new }
    object_field(:webhook) { KubeDSL::DSL::Auditregistration::V1alpha1::Webhook.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:policy] = policy.serialize
        result[:webhook] = webhook.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :audit_sink_spec
    end
  end
end
