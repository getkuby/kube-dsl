# typed: true

module KubeDSL::DSL::Apiregistration::V1
  class APIServiceStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::Apiregistration::V1::APIServiceCondition.new }

    validates :conditions, array: { kind_of: KubeDSL::DSL::Apiregistration::V1::APIServiceCondition }, presence: false

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def kind_sym
      :api_service_status
    end
  end
end
