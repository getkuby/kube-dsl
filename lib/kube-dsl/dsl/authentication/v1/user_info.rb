module KubeDSL::DSL::Authentication::V1
  class UserInfo < ::KubeDSL::DSLObject
    value_fields :groups, :uid, :username
    object_field(:extra) { ::KubeDSL::KeyValueFields.new(format: :string) }

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
