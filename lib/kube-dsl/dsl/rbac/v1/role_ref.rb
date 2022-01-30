# typed: true

module KubeDSL::DSL::Rbac::V1
  class RoleRef < ::KubeDSL::DSLObject
    value_field :api_group
    value_field :kind
    value_field :name

    validates :api_group, field: { format: :string }, presence: false
    validates :kind, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiGroup] = api_group
        result[:kind] = kind
        result[:name] = name
      end
    end

    def kind_sym
      :role_ref
    end
  end
end
