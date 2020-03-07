module KubeDSL::DSL::Autoscaling::V2beta2
  class CrossVersionObjectReference < ::KubeDSL::DSLObject
    value_fields :api_version, :kind, :name

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:kind] = kind
        result[:name] = name
      end
    end

    def kind_sym
      :cross_version_object_reference
    end
  end
end
