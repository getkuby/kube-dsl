module KubeDSL::DSL::Authentication
  class UserInfo
    extend ::KubeDSL::ValueFields

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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :user_info
    end
  end
end
