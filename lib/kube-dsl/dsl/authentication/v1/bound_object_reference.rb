module KubeDSL::DSL::Authentication::V1
  class BoundObjectReference < ::KubeDSL::DSLObject
    value_fields :api_version, :kind, :name, :uid

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:kind] = kind
        result[:name] = name
        result[:uid] = uid
      end
    end

    def kind
      :bound_object_reference
    end
  end
end
