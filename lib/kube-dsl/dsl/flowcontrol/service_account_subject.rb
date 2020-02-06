module KubeDSL::DSL::Flowcontrol
  class ServiceAccountSubject
    extend ::KubeDSL::ValueFields
    value_fields :name, :namespace

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
