module KubeDSL::DSL::Rbac::V1alpha1
  class Subject < ::KubeDSL::DSLObject
    value_fields :api_version, :kind, :name, :namespace

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:kind] = kind
        result[:name] = name
        result[:namespace] = namespace
      end
    end

    def kind
      :subject
    end
  end
end
