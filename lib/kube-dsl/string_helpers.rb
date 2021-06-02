module KubeDSL
  module StringHelpers
    RUBY_KEYWORDS = %w(
      BEGIN END alias and begin break case class def defined? do else elsif
      end ensure false for if in module next nil not or redo rescue retry
      return self super then true undef unless until when while yield
    )

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
