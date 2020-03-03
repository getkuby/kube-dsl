module KubeDSL::DSL::Apiregistration::V1beta1
  class APIServiceStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::Apiregistration::V1beta1::APIServiceCondition.new }

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def kind
      :api_service_status
    end
  end
end
