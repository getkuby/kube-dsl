module KubeDSL::DSL::V1
  class ResourceQuotaSpec < ::KubeDSL::DSLObject
    key_value_field(:hard, format: :string)
    object_field(:scope_selector) { KubeDSL::DSL::V1::ScopeSelector.new }
    value_field :scopes

    validates :hard, kv: { value_format: :string }, presence: false
    validates :scope_selector, object: { kind_of: KubeDSL::DSL::V1::ScopeSelector }
    validates :scopes, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:hard] = hard.serialize
        result[:scopeSelector] = scope_selector.serialize
        result[:scopes] = scopes
      end
    end

    def kind_sym
      :resource_quota_spec
    end
  end
end
