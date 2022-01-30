# typed: true

module KubeDSL::DSL::V1
  class TypedLocalObjectReference < ::KubeDSL::DSLObject
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
      :typed_local_object_reference
    end
  end
end
