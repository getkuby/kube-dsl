module KubeDSL::DSL::Meta::V1
  class APIGroupList < ::KubeDSL::DSLObject
    array_field(:group) { KubeDSL::DSL::Meta::V1::APIGroup.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "APIGroupList"
        result[:groups] = groups.map(&:serialize)
      end
    end

    def kind
      :api_group_list
    end
  end
end
