# typed: true

module KubeDSL::DSL::Autoscaling::V2beta2
  class CrossVersionObjectReference < ::KubeDSL::DSLObject
    value_field :api_version
    value_field :kind
    value_field :name

    validates :api_version, field: { format: :string }, presence: false
    validates :kind, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false

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
