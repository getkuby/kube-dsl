module KubeDSL::DSL::Meta
  class APIResourceList
    extend ::KubeDSL::ValueFields
    value_fields :group_version
    array_field(:resource) { KubeDSL::DSL::Meta::APIResource.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "APIResourceList"
        result[:groupVersion] = group_version
        result[:resources] = resources.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
