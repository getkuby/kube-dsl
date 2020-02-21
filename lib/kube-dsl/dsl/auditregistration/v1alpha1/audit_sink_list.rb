module KubeDSL::DSL::Auditregistration::V1alpha1
  class AuditSinkList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Auditregistration::V1alpha1::AuditSink.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
