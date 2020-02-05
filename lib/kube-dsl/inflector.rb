require 'dry/inflector'

module KubeDSL
  class Inflector
    include Singleton

    class << self
      def pluralize(*args)
        instance.pluralize(*args)
      end
    end

    def pluralize(*args)
      inflector.pluralize(*args)
    end

    private

    def inflector
      @inflector ||= Dry::Inflector.new
    end
  end
end
