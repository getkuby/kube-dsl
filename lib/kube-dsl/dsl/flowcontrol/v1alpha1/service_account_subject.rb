module KubeDSL::DSL::Flowcontrol::V1alpha1
  class ServiceAccountSubject < ::KubeDSL::DSLObject
    value_fields :name, :namespace

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
      end
    end

    def kind_sym
      :service_account_subject
    end
  end
end
