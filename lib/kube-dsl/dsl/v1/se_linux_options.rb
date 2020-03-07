module KubeDSL::DSL::V1
  class SELinuxOptions < ::KubeDSL::DSLObject
    value_fields :level, :role, :type, :user

    def serialize
      {}.tap do |result|
        result[:level] = level
        result[:role] = role
        result[:type] = type
        result[:user] = user
      end
    end

    def kind_sym
      :se_linux_options
    end
  end
end
