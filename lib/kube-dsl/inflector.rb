require 'dry/inflector'
require 'singleton'

module KubeDSL
  class Inflector
    include Singleton

    class << self
      def pluralize(*args)
        instance.inflector.pluralize(*args)
      end

      def singularize(*args)
        instance.inflector.singularize(*args)
      end
    end

    def inflector
      @inflector ||= Dry::Inflector.new
    end
  end
end
