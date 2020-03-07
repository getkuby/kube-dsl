module KubeDSL::DSL::Node::V1beta1
  class Overhead < ::KubeDSL::DSLObject
    object_field(:pod_fixed) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:podFixed] = pod_fixed.serialize
      end
    end

    def kind_sym
      :overhead
    end
  end
end
