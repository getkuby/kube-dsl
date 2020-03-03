module KubeDSL::DSL::V1
  class ServiceAccountList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::ServiceAccount.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ServiceAccountList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :service_account_list
    end
  end
end
