module KubeDSL::DSL::V1
  class ResourceQuotaSpec < ::KubeDSL::DSLObject
    value_fields :scopes
    object_field(:scope_selector) { KubeDSL::DSL::V1::ScopeSelector.new }
    object_field(:hard) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:scopes] = scopes
        result[:scopeSelector] = scope_selector.serialize
        result[:hard] = hard.serialize
      end
    end

    def kind_sym
      :resource_quota_spec
    end
  end
end
