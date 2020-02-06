module KubeDSL::DSL::Authentication
  class BoundObjectReference
    extend ::KubeDSL::ValueFields

    value_fields :api_version, :kind, :name, :uid

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:kind] = kind
        result[:name] = name
        result[:uid] = uid
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :bound_object_reference
    end
  end
end
