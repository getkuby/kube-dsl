# typed: true

module KubeDSL::DSL::Networking::V1
  class IngressClassList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Networking::V1::IngressClass.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Networking::V1::IngressClass }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "networking.k8s.io/v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "IngressClassList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :ingress_class_list
    end
  end
end