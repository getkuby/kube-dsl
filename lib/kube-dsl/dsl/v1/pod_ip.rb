module KubeDSL::DSL::V1
  class PodIP < ::KubeDSL::DSLObject
    value_fields :ip

    def serialize
      {}.tap do |result|
        result[:ip] = ip
      end
    end

    def kind_sym
      :pod_ip
    end
  end
end
