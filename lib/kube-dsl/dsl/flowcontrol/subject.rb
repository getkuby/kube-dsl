module KubeDSL::DSL::Flowcontrol
  class Subject
    extend ::KubeDSL::ValueFields

    value_fields :kind
    object_field(:group) { KubeDSL::DSL::Flowcontrol::GroupSubject.new }
    object_field(:service_account) { KubeDSL::DSL::Flowcontrol::ServiceAccountSubject.new }
    object_field(:user) { KubeDSL::DSL::Flowcontrol::UserSubject.new }

    def serialize
      {}.tap do |result|
        result[:kind] = kind
        result[:group] = group.serialize
        result[:serviceAccount] = service_account.serialize
        result[:user] = user.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :subject
    end
  end
end
