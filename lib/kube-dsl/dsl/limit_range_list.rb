module KubeDSL::DSL
  class LimitRangeList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::LimitRange.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "LimitRangeList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
