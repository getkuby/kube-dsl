module KubeDSL::DSL
  class LimitRange
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::LimitRangeSpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "LimitRange"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :limit_range
    end
  end
end
