module KubeDSL::DSL::Node::V1alpha1
  class Scheduling < ::KubeDSL::DSLObject
    array_field(:toleration) { KubeDSL::DSL::V1::Toleration.new }
    key_value_field(:node_selector, format: :string)

    def serialize
      {}.tap do |result|
        result[:tolerations] = tolerations.map(&:serialize)
        result[:nodeSelector] = node_selector.serialize
      end
    end

    def kind_sym
      :scheduling
    end
  end
end
