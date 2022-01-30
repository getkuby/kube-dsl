# typed: true

module KubeDSL::DSL::Rbac::V1alpha1
  class Subject < ::KubeDSL::DSLObject
    value_field :api_version
    value_field :kind
    value_field :name
    value_field :namespace

    validates :api_version, field: { format: :string }, presence: false
    validates :kind, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :namespace, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
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
