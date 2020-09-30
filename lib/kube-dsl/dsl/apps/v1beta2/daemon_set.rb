module KubeDSL::DSL::Apps::V1beta2
  class DaemonSet < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apps::V1beta2::DaemonSetSpec.new }
    object_field(:status) { KubeDSL::DSL::Apps::V1beta2::DaemonSetStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Apps::V1beta2::DaemonSetSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Apps::V1beta2::DaemonSetStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta2"
        result[:kind] = "DaemonSet"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :daemon_set
    end
  end
end
