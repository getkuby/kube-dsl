module KubeDSL::DSL::Meta::V1
  class APIResourceList < ::KubeDSL::DSLObject
    value_fields :group_version
    array_field(:resource) { KubeDSL::DSL::Meta::V1::APIResource.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "APIResourceList"
        result[:groupVersion] = group_version
        result[:resources] = resources.map(&:serialize)
      end
    end

    def kind
      :api_resource_list
    end
  end
end
