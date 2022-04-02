# typed: true

module KubeDSL
  module DSL
    module V1
      class HTTPHeader < ::KubeDSL::DSLObject
        value_field :name
        value_field :value

        validates :name, field: { format: :string }, presence: false
        validates :value, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:name] = name
            result[:value] = value
          end
        end

        def kind_sym
          :http_header
        end
      end
    end
  end
end