module KubeDSL::DSL::Authentication::V1beta1
  class UserInfo < ::KubeDSL::DSLObject
    value_fields :groups, :uid, :username
    key_value_field(:extra, format: :string)

    def serialize
      {}.tap do |result|
        result[:groups] = groups
        result[:uid] = uid
        result[:username] = username
        result[:extra] = extra.serialize
      end
    end

    def kind_sym
      :user_info
    end
  end
end
