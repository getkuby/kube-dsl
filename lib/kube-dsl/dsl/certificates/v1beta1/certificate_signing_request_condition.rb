module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestCondition
    extend ::KubeDSL::ValueFields

    value_fields :last_update_time, :message, :reason, :type

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:lastUpdateTime] = last_update_time
        result[:message] = message
        result[:reason] = reason
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :certificate_signing_request_condition
    end
  end
end
