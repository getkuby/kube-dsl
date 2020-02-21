module KubeDSL::DSL::Authorization::V1
  class SubjectAccessReviewSpec
    extend ::KubeDSL::ValueFields

    value_fields :uid, :user
    array_field :group
    object_field(:non_resource_attributes) { KubeDSL::DSL::Authorization::V1::NonResourceAttributes.new }
    object_field(:resource_attributes) { KubeDSL::DSL::Authorization::V1::ResourceAttributes.new }
    object_field(:extra) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:uid] = uid
        result[:user] = user
        result[:groups] = groups
        result[:nonResourceAttributes] = non_resource_attributes.serialize
        result[:resourceAttributes] = resource_attributes.serialize
        result[:extra] = extra.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :subject_access_review_spec
    end
  end
end
