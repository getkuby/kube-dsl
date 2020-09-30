module KubeDSL::DSL::V1
  class NamespaceStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::V1::NamespaceCondition.new }
    value_field :phase

    validates :conditions, array: { kind_of: KubeDSL::DSL::V1::NamespaceCondition }, presence: false
    validates :phase, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
        result[:phase] = phase
      end
    end

    def kind_sym
      :namespace_status
    end
  end
end
