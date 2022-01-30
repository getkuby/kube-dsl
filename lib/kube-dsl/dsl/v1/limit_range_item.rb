# typed: true

module KubeDSL::DSL::V1
  class LimitRangeItem < ::KubeDSL::DSLObject
    key_value_field(:default, format: :string)
    key_value_field(:default_request, format: :string)
    key_value_field(:max, format: :string)
    key_value_field(:max_limit_request_ratio, format: :string)
    key_value_field(:min, format: :string)
    value_field :type

    validates :default, kv: { value_format: :string }, presence: false
    validates :default_request, kv: { value_format: :string }, presence: false
    validates :max, kv: { value_format: :string }, presence: false
    validates :max_limit_request_ratio, kv: { value_format: :string }, presence: false
    validates :min, kv: { value_format: :string }, presence: false
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:default] = default.serialize
        result[:defaultRequest] = default_request.serialize
        result[:max] = max.serialize
        result[:maxLimitRequestRatio] = max_limit_request_ratio.serialize
        result[:min] = min.serialize
        result[:type] = type
      end
    end

    def kind_sym
      :limit_range_item
    end
  end
end
