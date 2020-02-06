require 'dry/inflector'
require 'singleton'

module KubeDSL
  class Inflector
    include Singleton

    class << self
      def pluralize(*args)
        instance.pluralize(*args)
      end

      def singularize(*args)
        instance.singularize(*args)
      end
    end

    def pluralize(*args)
      inflector.pluralize(*args)
    end

    def singularize(*args)
      inflector.singularize(*args)
    end

    private

    def inflector
      @inflector ||= Dry::Inflector.new
    end
  end
end
