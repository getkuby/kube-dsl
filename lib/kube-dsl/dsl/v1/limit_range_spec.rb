module KubeDSL::DSL::V1
  class LimitRangeSpec
    extend ::KubeDSL::ValueFields

    array_field(:limit) { KubeDSL::DSL::V1::LimitRangeItem.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:limits] = limits.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :limit_range_spec
    end
  end
end
