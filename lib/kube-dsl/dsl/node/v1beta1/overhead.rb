module KubeDSL::DSL::Node::V1beta1
  class Overhead < ::KubeDSL::DSLObject
    key_value_field(:pod_fixed, format: :string)

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
