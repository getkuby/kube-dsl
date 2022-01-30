# typed: true

module KubeDSL::DSL::Meta::V1
  class ListMeta < ::KubeDSL::DSLObject
    value_field :continue
    value_field :remaining_item_count
    value_field :resource_version
    value_field :self_link

    validates :continue, field: { format: :string }, presence: false
    validates :remaining_item_count, field: { format: :integer }, presence: false
    validates :resource_version, field: { format: :string }, presence: false
    validates :self_link, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:continue] = continue
        result[:remainingItemCount] = remaining_item_count
        result[:resourceVersion] = resource_version
        result[:selfLink] = self_link
      end
    end

    def kind_sym
      :list_meta
    end
  end
end
