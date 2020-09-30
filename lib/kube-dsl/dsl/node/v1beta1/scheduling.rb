module KubeDSL::DSL::Node::V1beta1
  class Scheduling < ::KubeDSL::DSLObject
    key_value_field(:node_selector, format: :string)
    array_field(:toleration) { KubeDSL::DSL::V1::Toleration.new }

    validates :node_selector, kv: { value_format: :string }, presence: false
    validates :tolerations, array: { kind_of: KubeDSL::DSL::V1::Toleration }, presence: false

    def serialize
      {}.tap do |result|
        result[:nodeSelector] = node_selector.serialize
        result[:tolerations] = tolerations.map(&:serialize)
      end
    end

    def kind_sym
      :scheduling
    end
  end
end
