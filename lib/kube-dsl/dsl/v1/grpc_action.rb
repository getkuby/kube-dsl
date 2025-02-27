# typed: true

module KubeDSL
  module DSL
    module V1
      class GRPCAction < ::KubeDSL::DSLObject
        value_field :port
        value_field :service

        validates :port, field: { format: :integer }, presence: false
        validates :service, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:port] = port
            result[:service] = service
          end
        end

        def kind_sym
          :grpc_action
        end
      end
    end
  end
end