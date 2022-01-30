# typed: true

module KubeDSL::DSL::Apps::V1
  class RollingUpdateDaemonSet < ::KubeDSL::DSLObject
    value_field :max_unavailable

    validates :max_unavailable, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:maxUnavailable] = max_unavailable
      end
    end

    def kind_sym
      :rolling_update_daemon_set
    end
  end
end
