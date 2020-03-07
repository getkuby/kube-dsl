module KubeDSL::DSL::Meta::V1
  class ListMeta < ::KubeDSL::DSLObject
    value_fields :continue, :remaining_item_count, :resource_version, :self_link

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
