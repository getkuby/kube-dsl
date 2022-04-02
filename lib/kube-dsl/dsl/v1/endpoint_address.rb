# typed: true

module KubeDSL
  module DSL
    module V1
      class EndpointAddress < ::KubeDSL::DSLObject
        value_field :hostname
        value_field :ip
        value_field :node_name
        object_field(:target_ref) { KubeDSL::DSL::V1::ObjectReference.new }

        validates :hostname, field: { format: :string }, presence: false
        validates :ip, field: { format: :string }, presence: false
        validates :node_name, field: { format: :string }, presence: false
        validates :target_ref, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }

        def serialize
          {}.tap do |result|
            result[:hostname] = hostname
            result[:ip] = ip
            result[:nodeName] = node_name
            result[:targetRef] = target_ref.serialize
          end
        end

        def kind_sym
          :endpoint_address
        end
      end
    end
  end
end