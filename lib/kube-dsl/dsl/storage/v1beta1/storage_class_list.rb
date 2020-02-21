module KubeDSL::DSL::Storage::V1beta1
  class StorageClassList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Storage::V1beta1::StorageClass.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1beta1"
        result[:kind] = "StorageClassList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :storage_class_list
    end
  end
end
