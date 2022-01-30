# typed: true

module KubeDSL::DSL::Meta::V1
  class DeleteOptions < ::KubeDSL::DSLObject
    value_field :api_version
    value_field :dry_run
    value_field :grace_period_seconds
    value_field :orphan_dependents
    object_field(:preconditions) { KubeDSL::DSL::Meta::V1::Preconditions.new }
    value_field :propagation_policy

    validates :api_version, field: { format: :string }, presence: false
    validates :dry_run, field: { format: :string }, presence: false
    validates :grace_period_seconds, field: { format: :integer }, presence: false
    validates :orphan_dependents, field: { format: :boolean }, presence: false
    validates :preconditions, object: { kind_of: KubeDSL::DSL::Meta::V1::Preconditions }
    validates :propagation_policy, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:dryRun] = dry_run
        result[:gracePeriodSeconds] = grace_period_seconds
        result[:kind] = "DeleteOptions"
        result[:orphanDependents] = orphan_dependents
        result[:preconditions] = preconditions.serialize
        result[:propagationPolicy] = propagation_policy
      end
    end

    def kind_sym
      :delete_options
    end
  end
end
