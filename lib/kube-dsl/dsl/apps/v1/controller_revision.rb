# typed: true

module KubeDSL
  module DSL
    module Apps
      module V1
        class ControllerRevision < ::KubeDSL::DSLObject
          value_field :data
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          value_field :revision

          validates :data, field: { format: :string }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :revision, field: { format: :integer }, presence: false

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "apps/v1"
              result[:data] = data
              result[:kind] = "ControllerRevision"
              result[:metadata] = metadata.serialize
              result[:revision] = revision
            end
          end

          def kind_sym
            :controller_revision
          end
        end
      end
    end
  end
end