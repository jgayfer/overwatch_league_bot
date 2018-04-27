module OWLBot
  module Localize
    def self.call(key, locale = :en)
      locales = YAML.load_file(
        File.join(File.dirname(__FILE__), "../../locales/#{locale}.yml")
      )
      locales[key]
    end
  end
end
