module KubeDSL::DSL::Flowcontrol::V1alpha1
  class NonResourcePolicyRule < ::KubeDSL::DSLObject
    array_field :non_resource_url
    array_field :verb

    def serialize
      {}.tap do |result|
        result[:nonResourceURLs] = non_resource_urls
        result[:verbs] = verbs
      end
    end

    def kind_sym
      :non_resource_policy_rule
    end
  end
end
