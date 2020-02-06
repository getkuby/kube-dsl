module KubeDSL::DSL::Extensions
  class IngressList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Extensions::Ingress.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
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
