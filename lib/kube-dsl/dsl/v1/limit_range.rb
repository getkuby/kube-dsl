module KubeDSL::DSL::V1
  class LimitRange < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::V1::LimitRangeSpec.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::V1::LimitRangeSpec }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "LimitRange"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :limit_range
    end
  end
end
