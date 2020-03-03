module KubeDSL::DSL::V1
  class TypedLocalObjectReference < ::KubeDSL::DSLObject
    value_fields :api_group, :kind, :name

    def serialize
      {}.tap do |result|
        result[:apiGroup] = api_group
        result[:kind] = kind
        result[:name] = name
      end
    end

    def kind
      :typed_local_object_reference
    end
  end
end
