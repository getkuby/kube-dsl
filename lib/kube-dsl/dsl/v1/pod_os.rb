# typed: true

module KubeDSL
  module DSL
    module V1
      class PodOS < ::KubeDSL::DSLObject
        value_field :name

        validates :name, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:name] = name
          end
        end

        def kind_sym
          :pod_os
        end
      end
    end
  end
end