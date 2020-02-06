module KubeDSL::DSL::Certificates
  class CertificateSigningRequestCondition
    extend ::KubeDSL::ValueFields
    value_fields :last_update_time, :message, :reason, :type

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
  end
end
