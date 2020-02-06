module KubeDSL::DSL::Flowcontrol
  class UserSubject
    extend ::KubeDSL::ValueFields
    value_fields :name

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
