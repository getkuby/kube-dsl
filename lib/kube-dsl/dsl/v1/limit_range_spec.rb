module KubeDSL::DSL::V1
  class LimitRangeSpec < ::KubeDSL::DSLObject
    array_field(:limit) { KubeDSL::DSL::V1::LimitRangeItem.new }

    def serialize
      {}.tap do |result|
        result[:limits] = limits.map(&:serialize)
      end
    end

    def kind
      :limit_range_spec
    end
  end
end
