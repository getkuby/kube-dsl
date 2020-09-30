module KubeDSL::DSL::Auditregistration::V1alpha1
  class AuditSinkList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Auditregistration::V1alpha1::AuditSink.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Auditregistration::V1alpha1::AuditSink }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "auditregistration.k8s.io/v1alpha1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "AuditSinkList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :audit_sink_list
    end
  end
end
