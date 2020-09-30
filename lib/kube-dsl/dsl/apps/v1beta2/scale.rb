module KubeDSL::DSL::Apps::V1beta2
  class Scale < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apps::V1beta2::ScaleSpec.new }
    object_field(:status) { KubeDSL::DSL::Apps::V1beta2::ScaleStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Apps::V1beta2::ScaleSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Apps::V1beta2::ScaleStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta2"
        result[:kind] = "Scale"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :scale
    end
  end
end
