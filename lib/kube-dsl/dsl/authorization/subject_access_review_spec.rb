module KubeDSL::DSL::Authorization
  class SubjectAccessReviewSpec
    extend ::KubeDSL::ValueFields
    value_fields :uid, :user
    array_field :group
    object_field(:non_resource_attributes) { KubeDSL::DSL::Authorization::NonResourceAttributes.new }
    object_field(:resource_attributes) { KubeDSL::DSL::Authorization::ResourceAttributes.new }
    object_field(:extra) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:uid] = uid
        result[:user] = user
        result[:group] = groups
        result[:nonResourceAttributes] = non_resource_attributes.serialize
        result[:resourceAttributes] = resource_attributes.serialize
        result[:extra] = extra.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
