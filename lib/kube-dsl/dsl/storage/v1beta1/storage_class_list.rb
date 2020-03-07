module KubeDSL::DSL::Storage::V1beta1
  class StorageClassList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Storage::V1beta1::StorageClass.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1beta1"
        result[:kind] = "StorageClassList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :storage_class_list
    end
  end
end
