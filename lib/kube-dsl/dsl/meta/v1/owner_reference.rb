# typed: true

module KubeDSL::DSL::Meta::V1
  class OwnerReference < ::KubeDSL::DSLObject
    value_field :api_version
    value_field :block_owner_deletion
    value_field :controller
    value_field :kind
    value_field :name
    value_field :uid

    validates :api_version, field: { format: :string }, presence: false
    validates :block_owner_deletion, field: { format: :boolean }, presence: false
    validates :controller, field: { format: :boolean }, presence: false
    validates :kind, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :uid, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:blockOwnerDeletion] = block_owner_deletion
        result[:controller] = controller
        result[:kind] = kind
        result[:name] = name
        result[:uid] = uid
      end
    end

    def kind_sym
      :owner_reference
    end
  end
end
