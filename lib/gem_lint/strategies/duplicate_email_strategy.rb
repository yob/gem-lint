module GemLint
  module Strategies
    class DuplicateEmailStrategy < AbstractStrategy

      def description
        "Email field in spec should have no duplicate values"
      end

      def tag
        :"csv-email"
      end

      def level
        :warning
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
