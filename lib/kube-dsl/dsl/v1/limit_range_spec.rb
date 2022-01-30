# typed: true

module KubeDSL::DSL::V1
  class LimitRangeSpec < ::KubeDSL::DSLObject
    array_field(:limit) { KubeDSL::DSL::V1::LimitRangeItem.new }

    validates :limits, array: { kind_of: KubeDSL::DSL::V1::LimitRangeItem }, presence: false

    def serialize
      {}.tap do |result|
        result[:limits] = limits.map(&:serialize)
      end
    end

    def kind_sym
      :limit_range_spec
    end
  end
end
