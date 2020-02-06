module KubeDSL::DSL::Meta
  class StatusDetails
    extend ::KubeDSL::ValueFields
    value_fields :group, :kind, :name, :retry_after_seconds, :uid
    array_field(:cause) { KubeDSL::DSL::Meta::StatusCause.new }

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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
