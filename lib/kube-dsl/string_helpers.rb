module KubeDSL
  module StringHelpers
    RUBY_KEYWORDS = RubyToken::TokenDefinitions
      .select { |definition| definition[1] == RubyToken::TkId }
      .map { |definition| definition[2] }
      .compact
      .freeze

    def capitalize(str)
      str.sub(/\A(.)/) { $1.upcase }
    end

    def underscore(str)
      str
        .gsub(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .gsub('-', '_')
        .downcase
    end

    def unkeywordify(str)
      if RUBY_KEYWORDS.include?(str)
        "#{str}_field"
      else
        str
      end
    end
  end

  StringHelpers.extend(StringHelpers)
end
