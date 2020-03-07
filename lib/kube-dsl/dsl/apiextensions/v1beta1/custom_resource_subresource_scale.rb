module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceSubresourceScale < ::KubeDSL::DSLObject
    value_fields :label_selector_path, :spec_replicas_path, :status_replicas_path

    def serialize
      {}.tap do |result|
        result[:labelSelectorPath] = label_selector_path
        result[:specReplicasPath] = spec_replicas_path
        result[:statusReplicasPath] = status_replicas_path
      end
    end

    def kind_sym
      :custom_resource_subresource_scale
    end
  end
end
