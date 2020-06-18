module KubeDSL::DSL::V1
  class LimitRangeItem < ::KubeDSL::DSLObject
    value_fields :type
    key_value_field(:default, format: :string)
    key_value_field(:default_request, format: :string)
    key_value_field(:max, format: :string)
    key_value_field(:max_limit_request_ratio, format: :string)
    key_value_field(:min, format: :string)

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:default] = default.serialize
        result[:defaultRequest] = default_request.serialize
        result[:max] = max.serialize
        result[:maxLimitRequestRatio] = max_limit_request_ratio.serialize
        result[:min] = min.serialize
      end
    end

    def kind_sym
      :limit_range_item
    end
  end
end
