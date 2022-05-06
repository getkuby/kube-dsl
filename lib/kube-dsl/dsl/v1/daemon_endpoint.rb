# typed: true

module KubeDSL
  module DSL
    module V1
      class DaemonEndpoint < ::KubeDSL::DSLObject
        value_field :port

        validates :port, field: { format: :integer }, presence: false

        def serialize
          {}.tap do |result|
            result[:Port] = port
          end
        end

        def kind_sym
          :daemon_endpoint
        end
      end
    end
  end
end