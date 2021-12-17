module KubeDSL::DSL::Flowcontrol::V1beta1
  class NonResourcePolicyRule < ::KubeDSL::DSLObject
    value_field :non_resource_ur_ls
    value_field :verbs

    validates :non_resource_ur_ls, field: { format: :string }, presence: false
    validates :verbs, field: { format: :string }, presence: false

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
