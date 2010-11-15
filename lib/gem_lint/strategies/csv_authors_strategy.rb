module GemLint
  module Strategies
    class CsvAuthorsStrategy < AbstractStrategy

      def self.description
        "Authors field in spec uses CSV to specify multiple authors instead of an array"
      end

      def self.tag
        :"csv-authors"
      end

      def pass?
        !fail?
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
