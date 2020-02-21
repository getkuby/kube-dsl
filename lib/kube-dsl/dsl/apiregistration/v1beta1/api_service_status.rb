module KubeDSL::DSL::Apiregistration::V1beta1
  class APIServiceStatus
    extend ::KubeDSL::ValueFields

    array_field(:condition) { KubeDSL::DSL::Apiregistration::V1beta1::APIServiceCondition.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :api_service_status
    end
  end
end
