# typed: true

module KubeDSL
  module DSL
    module V1
      class ContainerStatus < ::KubeDSL::DSLObject
        value_field :container_id
        value_field :image
        value_field :image_id
        object_field(:last_state) { KubeDSL::DSL::V1::ContainerState.new }
        value_field :name
        value_field :ready
        value_field :restart_count
        value_field :started
        object_field(:state) { KubeDSL::DSL::V1::ContainerState.new }

        validates :container_id, field: { format: :string }, presence: false
        validates :image, field: { format: :string }, presence: false
        validates :image_id, field: { format: :string }, presence: false
        validates :last_state, object: { kind_of: KubeDSL::DSL::V1::ContainerState }
        validates :name, field: { format: :string }, presence: false
        validates :ready, field: { format: :boolean }, presence: false
        validates :restart_count, field: { format: :integer }, presence: false
        validates :started, field: { format: :boolean }, presence: false
        validates :state, object: { kind_of: KubeDSL::DSL::V1::ContainerState }

        def serialize
          {}.tap do |result|
            result[:containerID] = container_id
            result[:image] = image
            result[:imageID] = image_id
            result[:lastState] = last_state.serialize
            result[:name] = name
            result[:ready] = ready
            result[:restartCount] = restart_count
            result[:started] = started
            result[:state] = state.serialize
          end
        end

        def kind_sym
          :container_status
        end
      end
    end
  end
end