module KubeDSL::DSL::Auditregistration
  class AuditSinkList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Auditregistration::AuditSink.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "auditregistration.k8s.io/v1alpha1"
        result[:kind] = "AuditSinkList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :audit_sink_list
    end
  end
end
