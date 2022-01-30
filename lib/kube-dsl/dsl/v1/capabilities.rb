# typed: true

module KubeDSL::DSL::V1
  class Capabilities < ::KubeDSL::DSLObject
    value_field :add
    value_field :drop

    validates :add, field: { format: :string }, presence: false
    validates :drop, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:add] = add
        result[:drop] = drop
      end
    end

    def kind_sym
      :capabilities
    end
  end
end
