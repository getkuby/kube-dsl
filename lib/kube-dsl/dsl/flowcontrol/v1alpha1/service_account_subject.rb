module KubeDSL::DSL::Flowcontrol::V1alpha1
  class ServiceAccountSubject
    extend ::KubeDSL::ValueFields

    value_fields :name, :namespace

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :service_account_subject
    end
  end
end
