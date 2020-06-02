module KubeDSL::DSL::Authorization::V1beta1
  class NonResourceRule < ::KubeDSL::DSLObject
    value_fields :non_resource_ur_ls, :verbs

    def serialize
      {}.tap do |result|
        result[:nonResourceURLs] = non_resource_ur_ls
        result[:verbs] = verbs
      end
    end

    def kind_sym
      :non_resource_rule
    end
  end
end
