module KubeDSL::DSL::Apps::V1
  class RollingUpdateDaemonSet < ::KubeDSL::DSLObject
    value_field :max_surge
    value_field :max_unavailable

    validates :max_surge, field: { format: :string }, presence: false
    validates :max_unavailable, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:maxSurge] = max_surge
        result[:maxUnavailable] = max_unavailable
      end
    end

    def kind_sym
      :rolling_update_daemon_set
    end
  end
end
