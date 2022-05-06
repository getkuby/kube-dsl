# typed: true

module KubeDSL
  module DSL
    module V1
      class EventSource < ::KubeDSL::DSLObject
        value_field :component
        value_field :host

        validates :component, field: { format: :string }, presence: false
        validates :host, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:component] = component
            result[:host] = host
          end
        end

        def kind_sym
          :event_source
        end
      end
    end
  end
end