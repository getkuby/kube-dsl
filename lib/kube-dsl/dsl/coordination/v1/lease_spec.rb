# typed: true

module KubeDSL::DSL::Coordination::V1
  class LeaseSpec < ::KubeDSL::DSLObject
    value_field :acquire_time
    value_field :holder_identity
    value_field :lease_duration_seconds
    value_field :lease_transitions
    value_field :renew_time

    validates :acquire_time, field: { format: :string }, presence: false
    validates :holder_identity, field: { format: :string }, presence: false
    validates :lease_duration_seconds, field: { format: :integer }, presence: false
    validates :lease_transitions, field: { format: :integer }, presence: false
    validates :renew_time, field: { format: :string }, presence: false

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
