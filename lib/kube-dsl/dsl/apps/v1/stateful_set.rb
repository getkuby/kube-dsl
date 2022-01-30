# typed: true

module KubeDSL::DSL::Apps::V1
  class StatefulSet < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apps::V1::StatefulSetSpec.new }
    object_field(:status) { KubeDSL::DSL::Apps::V1::StatefulSetStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Apps::V1::StatefulSetSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Apps::V1::StatefulSetStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1"
        result[:kind] = "StatefulSet"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :stateful_set
    end
  end
end
