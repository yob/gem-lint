module GemLint
  module Strategies
    class CsvEmailStrategy < AbstractStrategy

      def description
        "Email field in spec uses CSV to specify multiple emails instead of an array"
      end

      def tag
        :"csv-email"
      end

      def level
        :error
      end

      def fail?
        (yaml.email.is_a?(String) && (yaml.email.include?(",") || yaml.email.include?(";"))) ||
          (yaml.email.is_a?(Array) && (yaml.email.first.to_s.include?(",") || yaml.email.first.to_s.include?(";")))
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
