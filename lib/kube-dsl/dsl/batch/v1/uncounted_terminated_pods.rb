# typed: true

module KubeDSL::DSL::Batch::V1
  class UncountedTerminatedPods < ::KubeDSL::DSLObject
    value_field :failed
    value_field :succeeded

    validates :failed, field: { format: :string }, presence: false
    validates :succeeded, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:failed] = failed
        result[:succeeded] = succeeded
      end
    end

    def kind_sym
      :uncounted_terminated_pods
    end
  end
end
