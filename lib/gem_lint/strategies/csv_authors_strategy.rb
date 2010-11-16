module GemLint
  module Strategies
    class CsvAuthorsStrategy < AbstractStrategy

      def description
        "Authors field in spec uses CSV to specify multiple authors instead of an array"
      end

      def tag
        :"csv-authors"
      end

      def fail?
        yaml.authors.is_a?(String) && yaml.author.match(/.+,.+/)
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
