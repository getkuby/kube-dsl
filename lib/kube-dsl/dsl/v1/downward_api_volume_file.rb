# typed: strict

module KubeDSL
  module DSL
    module V1
      class DownwardAPIVolumeFile < ::KubeDSL::DSLObject
        object_field(:field_ref) { KubeDSL::DSL::V1::ObjectFieldSelector.new }
        value_field :mode
        value_field :path
        object_field(:resource_field_ref) { KubeDSL::DSL::V1::ResourceFieldSelector.new }

        validates :field_ref, object: { kind_of: KubeDSL::DSL::V1::ObjectFieldSelector }
        validates :mode, field: { format: :integer }, presence: false
        validates :path, field: { format: :string }, presence: false
        validates :resource_field_ref, object: { kind_of: KubeDSL::DSL::V1::ResourceFieldSelector }

        def serialize
          {}.tap do |result|
            result[:fieldRef] = field_ref.serialize
            result[:mode] = mode
            result[:path] = path
            result[:resourceFieldRef] = resource_field_ref.serialize
          end
        end

        def kind_sym
          :downward_api_volume_file
        end
      end
    end
  end
end