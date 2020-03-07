module KubeDSL::DSL::Scheduling::V1alpha1
  class PriorityClassList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Scheduling::V1alpha1::PriorityClass.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "scheduling.k8s.io/v1alpha1"
        result[:kind] = "PriorityClassList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :priority_class_list
    end
  end
end
