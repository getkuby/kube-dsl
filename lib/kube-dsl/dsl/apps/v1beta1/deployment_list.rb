module KubeDSL::DSL::Apps::V1beta1
  class DeploymentList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Apps::V1beta1::Deployment.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta1"
        result[:kind] = "DeploymentList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :deployment_list
    end
  end
end
