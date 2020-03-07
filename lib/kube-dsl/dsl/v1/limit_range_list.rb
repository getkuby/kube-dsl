module KubeDSL::DSL::V1
  class LimitRangeList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::LimitRange.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "LimitRangeList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :limit_range_list
    end
  end
end
