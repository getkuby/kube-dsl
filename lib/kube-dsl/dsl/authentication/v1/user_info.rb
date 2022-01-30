# typed: true

module KubeDSL::DSL::Authentication::V1
  class UserInfo < ::KubeDSL::DSLObject
    key_value_field(:extra, format: :string)
    value_field :groups
    value_field :uid
    value_field :username

    validates :extra, kv: { value_format: :string }, presence: false
    validates :groups, field: { format: :string }, presence: false
    validates :uid, field: { format: :string }, presence: false
    validates :username, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:extra] = extra.serialize
        result[:groups] = groups
        result[:uid] = uid
        result[:username] = username
      end
    end

    def kind_sym
      :user_info
    end
  end
end
