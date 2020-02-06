module KubeDSL::DSL::Meta
  class DeleteOptions
    extend ::KubeDSL::ValueFields
    value_fields :api_version, :grace_period_seconds, :orphan_dependents, :propagation_policy
    array_field :dry_run
    object_field(:preconditions) { KubeDSL::DSL::Meta::Preconditions.new }

    def serialize
      {}.tap do |result|
        result[:kind] = "DeleteOptions"
        result[:apiVersion] = api_version
        result[:gracePeriodSeconds] = grace_period_seconds
        result[:orphanDependents] = orphan_dependents
        result[:propagationPolicy] = propagation_policy
        result[:dryRun] = dry_runs
        result[:preconditions] = preconditions.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
