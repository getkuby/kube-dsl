# typed: true

module KubeDSL::DSL::Auditregistration::V1alpha1
  class AuditSink < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Auditregistration::V1alpha1::AuditSinkSpec.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Auditregistration::V1alpha1::AuditSinkSpec }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "auditregistration.k8s.io/v1alpha1"
        result[:kind] = "AuditSink"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :audit_sink
    end
  end
end
