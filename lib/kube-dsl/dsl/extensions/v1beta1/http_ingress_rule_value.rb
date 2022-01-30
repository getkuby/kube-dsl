# typed: true

module KubeDSL::DSL::Extensions::V1beta1
  class HTTPIngressRuleValue < ::KubeDSL::DSLObject
    array_field(:path) { KubeDSL::DSL::Extensions::V1beta1::HTTPIngressPath.new }

    validates :paths, array: { kind_of: KubeDSL::DSL::Extensions::V1beta1::HTTPIngressPath }, presence: false

    def serialize
      {}.tap do |result|
        result[:paths] = paths.map(&:serialize)
      end
    end

    def kind_sym
      :http_ingress_rule_value
    end
  end
end
