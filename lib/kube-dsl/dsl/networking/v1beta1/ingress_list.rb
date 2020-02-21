module KubeDSL::DSL::Networking::V1beta1
  class IngressList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Networking::V1beta1::Ingress.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "networking.k8s.io/v1beta1"
        result[:kind] = "IngressList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :ingress_list
    end
  end
end
