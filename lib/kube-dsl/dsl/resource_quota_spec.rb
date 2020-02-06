module KubeDSL::DSL
  class ResourceQuotaSpec
    extend ::KubeDSL::ValueFields

    array_field :scope
    object_field(:scope_selector) { KubeDSL::DSL::ScopeSelector.new }
    object_field(:hard) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:scopes] = scopes
        result[:scopeSelector] = scope_selector.serialize
        result[:hard] = hard.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :resource_quota_spec
    end
  end
end
