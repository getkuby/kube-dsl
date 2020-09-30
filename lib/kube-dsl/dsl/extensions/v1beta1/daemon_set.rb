module KubeDSL::DSL::Extensions::V1beta1
  class DaemonSet < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Extensions::V1beta1::DaemonSetSpec.new }
    object_field(:status) { KubeDSL::DSL::Extensions::V1beta1::DaemonSetStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Extensions::V1beta1::DaemonSetSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Extensions::V1beta1::DaemonSetStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
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
