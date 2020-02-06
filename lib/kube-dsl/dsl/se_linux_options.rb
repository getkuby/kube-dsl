module KubeDSL::DSL
  class SELinuxOptions
    extend ::KubeDSL::ValueFields
    value_fields :level, :role, :type, :user

    def serialize
      {}.tap do |result|
        result[:level] = level
        result[:role] = role
        result[:type] = type
        result[:user] = user
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
