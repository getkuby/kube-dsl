# typed: strict

module KubeDSL
  module DSL
    module V1
      class HTTPGetAction < ::KubeDSL::DSLObject
        value_field :host
        array_field(:http_header) { KubeDSL::DSL::V1::HTTPHeader.new }
        value_field :path
        value_field :port
        value_field :scheme

        validates :host, field: { format: :string }, presence: false
        validates :http_headers, array: { kind_of: KubeDSL::DSL::V1::HTTPHeader }, presence: false
        validates :path, field: { format: :string }, presence: false
        validates :port, field: { format: :string }, presence: false
        validates :scheme, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:host] = host
            result[:httpHeaders] = http_headers.map(&:serialize)
            result[:path] = path
            result[:port] = port
            result[:scheme] = scheme
          end
        end

        def kind_sym
          :http_get_action
        end
      end
    end
  end
end