module KubeDSL::DSL::V1
  class NamespaceStatus
    extend ::KubeDSL::ValueFields

    value_fields :phase
    array_field(:condition) { KubeDSL::DSL::V1::NamespaceCondition.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:phase] = phase
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :namespace_status
    end
  end
end
