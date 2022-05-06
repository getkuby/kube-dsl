# typed: strict

module KubeDSL
  module DSL
    module Discovery
      module V1
        class Endpoint < ::KubeDSL::DSLObject
          value_field :addresses
          object_field(:conditions) { KubeDSL::DSL::Discovery::V1::EndpointConditions.new }
          key_value_field(:deprecated_topology, format: :string)
          object_field(:hints) { KubeDSL::DSL::Discovery::V1::EndpointHints.new }
          value_field :hostname
          value_field :node_name
          object_field(:target_ref) { KubeDSL::DSL::V1::ObjectReference.new }
          value_field :zone

          validates :addresses, field: { format: :string }, presence: false
          validates :conditions, object: { kind_of: KubeDSL::DSL::Discovery::V1::EndpointConditions }
          validates :deprecated_topology, kv: { value_format: :string }, presence: false
          validates :hints, object: { kind_of: KubeDSL::DSL::Discovery::V1::EndpointHints }
          validates :hostname, field: { format: :string }, presence: false
          validates :node_name, field: { format: :string }, presence: false
          validates :target_ref, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }
          validates :zone, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:addresses] = addresses
              result[:conditions] = conditions.serialize
              result[:deprecatedTopology] = deprecated_topology.serialize
              result[:hints] = hints.serialize
              result[:hostname] = hostname
              result[:nodeName] = node_name
              result[:targetRef] = target_ref.serialize
              result[:zone] = zone
            end
          end

          def kind_sym
            :endpoint
          end
        end
      end
    end
  end
end