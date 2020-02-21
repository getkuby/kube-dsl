module KubeDSL::DSL::Meta::V1
  class StatusDetails
    extend ::KubeDSL::ValueFields

    value_fields :group, :kind, :name, :retry_after_seconds, :uid
    array_field(:cause) { KubeDSL::DSL::Meta::V1::StatusCause.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :status_details
    end
  end
end
