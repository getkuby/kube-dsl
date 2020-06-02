module KubeDSL::DSL::Flowcontrol::V1alpha1
  class NonResourcePolicyRule < ::KubeDSL::DSLObject
    value_fields :non_resource_ur_ls, :verbs

    def serialize
      {}.tap do |result|
        result[:nonResourceURLs] = non_resource_ur_ls
        result[:verbs] = verbs
      end
    end

    def kind_sym
      :non_resource_policy_rule
    end
  end
end
