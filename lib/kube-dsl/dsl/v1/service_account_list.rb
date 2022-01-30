# typed: true

module KubeDSL::DSL::V1
  class ServiceAccountList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::ServiceAccount.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::V1::ServiceAccount }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "ServiceAccountList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :service_account_list
    end
  end
end
