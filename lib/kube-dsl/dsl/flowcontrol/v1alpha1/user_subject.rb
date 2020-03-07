module KubeDSL::DSL::Flowcontrol::V1alpha1
  class UserSubject < ::KubeDSL::DSLObject
    value_fields :name

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def kind_sym
      :user_subject
    end
  end
end
