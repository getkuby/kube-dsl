module KubeDSL::DSL::Authorization::V1beta1
  class SubjectAccessReviewSpec < ::KubeDSL::DSLObject
    value_fields :uid, :user
    array_field :group
    object_field(:non_resource_attributes) { KubeDSL::DSL::Authorization::V1beta1::NonResourceAttributes.new }
    object_field(:resource_attributes) { KubeDSL::DSL::Authorization::V1beta1::ResourceAttributes.new }
    object_field(:extra) { ::KubeDSL::KeyValueFields.new(format: :string) }

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

    def kind
      :subject_access_review_spec
    end
  end
end
