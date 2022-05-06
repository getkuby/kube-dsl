# typed: true

module KubeDSL
  module DSL
    module V1
      class NodeAddress < ::KubeDSL::DSLObject
        value_field :address
        value_field :type

        validates :address, field: { format: :string }, presence: false
        validates :type, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:address] = address
            result[:type] = type
          end
        end

        def kind_sym
          :node_address
        end
      end
    end
  end
end