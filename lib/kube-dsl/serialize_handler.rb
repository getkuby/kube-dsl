# typed: true

module KubeDSL
  class SerializeHandler
    attr_reader :namespace, :version, :kind, :field, :block

    def initialize(namespace, version, kind, field, &block)
      @namespace = namespace
      @version = version
      @kind = kind
      @field = field
      @block = block
    end

    def matches?(ref, field)
      ref.namespace == namespace &&
        ref.version == version &&
        ref.kind == kind &&
        field == self.field
    end

    def handle(res, inflector)
      block.call(res, inflector)
    end
  end
end
