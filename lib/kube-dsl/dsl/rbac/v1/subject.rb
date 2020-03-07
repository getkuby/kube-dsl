module KubeDSL::DSL::Rbac::V1
  class Subject < ::KubeDSL::DSLObject
    value_fields :api_group, :kind, :name, :namespace

    def serialize
      {}.tap do |result|
        result[:apiGroup] = api_group
        result[:kind] = kind
        result[:name] = name
        result[:namespace] = namespace
      end
    end

    def kind_sym
      :subject
    end
  end
end
