# typed: true
module KubeDSL
  module RbiHelpers
    include StringHelpers

    TYPE_MAP = {
      'boolean' => 'T::Boolean',
      'number' => 'Integer'
    }

    TYPE_MAP.freeze

    def rbi_type_for(type_str)
      TYPE_MAP.fetch(type_str) { capitalize(type_str) }
    end
  end
end
