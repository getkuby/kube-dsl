module KubeDSL::DSL
  class LimitRangeSpec
    extend ::KubeDSL::ValueFields
    array_field(:limit) { KubeDSL::DSL::LimitRangeItem.new }

    def serialize
      {}.tap do |result|
        result[:limits] = limits.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
