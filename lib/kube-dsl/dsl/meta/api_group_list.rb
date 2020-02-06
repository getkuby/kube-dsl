module KubeDSL::DSL::Meta
  class APIGroupList
    extend ::KubeDSL::ValueFields

    array_field(:group) { KubeDSL::DSL::Meta::APIGroup.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "APIGroupList"
        result[:groups] = groups.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :api_group_list
    end
  end
end
