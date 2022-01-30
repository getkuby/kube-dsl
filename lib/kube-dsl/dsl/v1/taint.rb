# typed: true

module KubeDSL::DSL::V1
  class Taint < ::KubeDSL::DSLObject
    value_field :effect
    value_field :key
    value_field :time_added
    value_field :value

    validates :effect, field: { format: :string }, presence: false
    validates :key, field: { format: :string }, presence: false
    validates :time_added, field: { format: :string }, presence: false
    validates :value, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:effect] = effect
        result[:key] = key
        result[:timeAdded] = time_added
        result[:value] = value
      end
    end

    def kind_sym
      :taint
    end
  end
end
