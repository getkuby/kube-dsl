module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestCondition < ::KubeDSL::DSLObject
    value_fields :last_update_time, :message, :reason, :type

    def serialize
      {}.tap do |result|
        result[:lastUpdateTime] = last_update_time
        result[:message] = message
        result[:reason] = reason
        result[:type] = type
      end
    end

    def kind
      :certificate_signing_request_condition
    end
  end
end
