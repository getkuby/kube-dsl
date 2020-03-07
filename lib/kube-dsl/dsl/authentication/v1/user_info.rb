module KubeDSL::DSL::Authentication::V1
  class UserInfo < ::KubeDSL::DSLObject
    value_fields :uid, :username
    array_field :group
    object_field(:extra) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:uid] = uid
        result[:username] = username
        result[:groups] = groups
        result[:extra] = extra.serialize
      end
    end

    def kind_sym
      :user_info
    end
  end
end
