module KubeDSL::DSL
  class ServiceList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Service.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ServiceList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :service_list
    end
  end
end
