module KubeDSL::DSL::Autoscaling
  class CrossVersionObjectReference
    extend ::KubeDSL::ValueFields

    value_fields :api_version, :kind, :name

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:kind] = kind
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :cross_version_object_reference
    end
  end
end
