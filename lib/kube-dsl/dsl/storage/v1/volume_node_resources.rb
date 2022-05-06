# typed: true

module KubeDSL
  module DSL
    module Storage
      module V1
        class VolumeNodeResources < ::KubeDSL::DSLObject
          value_field :count

          validates :count, field: { format: :integer }, presence: false

          def serialize
            {}.tap do |result|
              result[:count] = count
            end
          end

          def kind_sym
            :volume_node_resources
          end
        end
      end
    end
  end
end