module KubeDSL::DSL::V1
  class ServiceList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::Service.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ServiceList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :service_list
    end
  end
end
