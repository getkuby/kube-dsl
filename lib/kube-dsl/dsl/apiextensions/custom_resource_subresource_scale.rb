module KubeDSL::DSL::Apiextensions
  class CustomResourceSubresourceScale
    extend ::KubeDSL::ValueFields
    value_fields :label_selector_path, :spec_replicas_path, :status_replicas_path

    def serialize
      {}.tap do |result|
        result[:labelSelectorPath] = label_selector_path
        result[:specReplicasPath] = spec_replicas_path
        result[:statusReplicasPath] = status_replicas_path
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
