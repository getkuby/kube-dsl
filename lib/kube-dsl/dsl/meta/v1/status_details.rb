module KubeDSL::DSL::Meta::V1
  class StatusDetails < ::KubeDSL::DSLObject
    value_fields :group, :kind, :name, :retry_after_seconds, :uid
    array_field(:cause) { KubeDSL::DSL::Meta::V1::StatusCause.new }

    def serialize
      {}.tap do |result|
        result[:group] = group
        result[:kind] = kind
        result[:name] = name
        result[:retryAfterSeconds] = retry_after_seconds
        result[:uid] = uid
        result[:causes] = causes.map(&:serialize)
      end
    end

    def kind_sym
      :status_details
    end
  end
end
