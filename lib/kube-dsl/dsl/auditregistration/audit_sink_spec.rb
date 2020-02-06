module KubeDSL::DSL::Auditregistration
  class AuditSinkSpec
    extend ::KubeDSL::ValueFields
    object_field(:policy) { KubeDSL::DSL::Auditregistration::Policy.new }
    object_field(:webhook) { KubeDSL::DSL::Auditregistration::Webhook.new }

    def serialize
      {}.tap do |result|
        result[:policy] = policy.serialize
        result[:webhook] = webhook.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
