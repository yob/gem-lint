module GemLint
  module Strategies
    class CsvAuthorsStrategy < AbstractStrategy

      def description
        "Authors field in spec uses a comma or semicolon to specify multiple authors instead of an array"
      end

      def tag
        :"csv-authors"
      end

      def level
        :error
      end

      def fail?
        yaml.authors.is_a?(Array) &&
          (yaml.authors.first.to_s.include?(",") || yaml.authors.first.to_s.include?(";"))
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
