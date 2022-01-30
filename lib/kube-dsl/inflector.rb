# typed: true
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
      @inflector ||= Dry::Inflector.new do |inflections|
        inflections.plural('tls', 'tlses')
        inflections.singular('tls', 'tls')
      end
    end
  end
end
