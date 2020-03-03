module KubeDSL::DSL::Flowcontrol::V1alpha1
  class GroupSubject < ::KubeDSL::DSLObject
    value_fields :name

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def kind
      :group_subject
    end
  end
end
