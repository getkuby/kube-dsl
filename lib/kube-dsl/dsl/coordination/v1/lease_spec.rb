module KubeDSL::DSL::Coordination::V1
  class LeaseSpec < ::KubeDSL::DSLObject
    value_fields :acquire_time, :holder_identity, :lease_duration_seconds, :lease_transitions, :renew_time

    def serialize
      {}.tap do |result|
        result[:acquireTime] = acquire_time
        result[:holderIdentity] = holder_identity
        result[:leaseDurationSeconds] = lease_duration_seconds
        result[:leaseTransitions] = lease_transitions
        result[:renewTime] = renew_time
      end
    end

    def kind_sym
      :lease_spec
    end
  end
end
