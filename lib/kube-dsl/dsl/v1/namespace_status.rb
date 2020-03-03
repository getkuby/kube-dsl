module KubeDSL::DSL::V1
  class NamespaceStatus < ::KubeDSL::DSLObject
    value_fields :phase
    array_field(:condition) { KubeDSL::DSL::V1::NamespaceCondition.new }

    def serialize
      {}.tap do |result|
        result[:phase] = phase
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def kind
      :namespace_status
    end
  end
end
