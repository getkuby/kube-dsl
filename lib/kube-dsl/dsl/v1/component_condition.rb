module KubeDSL::DSL::V1
  class ComponentCondition
    extend ::KubeDSL::ValueFields

    value_fields :error, :message, :status, :type

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:error] = error
        result[:message] = message
        result[:status] = status
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :component_condition
    end
  end
end
