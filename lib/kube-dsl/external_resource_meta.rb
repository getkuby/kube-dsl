# typed: true
module KubeDSL
  class ExternalResourceMeta
    attr_reader :ref

    def initialize(ref)
      @ref = ref
    end

    def external?
      true
    end
  end
end
