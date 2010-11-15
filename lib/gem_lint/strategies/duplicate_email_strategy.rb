module GemLint
  module Strategies
    class DuplicateEmailStrategy < AbstractStrategy

      def self.description
        "Email field in spec should have no duplicate values"
      end

      def self.tag
        :"csv-email"
      end

      def pass?
        !fail?
      end

      def fail?
        yaml.email.is_a?(Array) && yaml.email.uniq.size != yaml.email.size
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
