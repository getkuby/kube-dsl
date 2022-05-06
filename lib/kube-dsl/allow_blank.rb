# typed: true
module KubeDSL
  class AllowBlank
    attr_reader :value

    def initialize(value)
      @value = value
    end
  end
end