module KubeDSL
  class ExternalRef < Ref
    def meta
      @meta ||= ExternalResourceMeta.new(self)
    end

    def document
      {}
    end

    # assume external refs are always object fields
    def object?
      true
    end
  end
end
