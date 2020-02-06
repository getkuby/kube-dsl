module KubeDSL::DSL::Meta
  class ListMeta
    extend ::KubeDSL::ValueFields
    value_fields :continue, :remaining_item_count, :resource_version, :self_link

    def serialize
      {}.tap do |result|
        result[:continue] = continue
        result[:remainingItemCount] = remaining_item_count
        result[:resourceVersion] = resource_version
        result[:selfLink] = self_link
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
