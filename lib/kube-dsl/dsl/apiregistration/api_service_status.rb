module KubeDSL::DSL::Apiregistration
  class APIServiceStatus
    extend ::KubeDSL::ValueFields

    array_field(:condition) { KubeDSL::DSL::Apiregistration::APIServiceCondition.new }

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
