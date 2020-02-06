module KubeDSL::DSL::Scheduling
  class PriorityClassList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Scheduling::PriorityClass.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "scheduling.k8s.io/v1beta1"
        result[:kind] = "PriorityClassList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :priority_class_list
    end
  end
end
