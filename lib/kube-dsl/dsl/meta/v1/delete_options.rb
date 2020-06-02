module KubeDSL::DSL::Meta::V1
  class DeleteOptions < ::KubeDSL::DSLObject
    value_fields :api_version, :dry_run, :grace_period_seconds, :orphan_dependents, :propagation_policy
    object_field(:preconditions) { KubeDSL::DSL::Meta::V1::Preconditions.new }

    def serialize
      {}.tap do |result|
        result[:kind] = "DeleteOptions"
        result[:apiVersion] = api_version
        result[:dryRun] = dry_run
        result[:gracePeriodSeconds] = grace_period_seconds
        result[:orphanDependents] = orphan_dependents
        result[:propagationPolicy] = propagation_policy
        result[:preconditions] = preconditions.serialize
      end
    end

    def kind_sym
      :delete_options
    end
  end
end
