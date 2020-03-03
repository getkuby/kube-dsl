module KubeDSL::DSL::Node::V1beta1
  class Scheduling < ::KubeDSL::DSLObject
    array_field(:toleration) { KubeDSL::DSL::V1::Toleration.new }
    object_field(:node_selector) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:tolerations] = tolerations.map(&:serialize)
        result[:nodeSelector] = node_selector.serialize
      end
    end

    def kind
      :scheduling
    end
  end
end
