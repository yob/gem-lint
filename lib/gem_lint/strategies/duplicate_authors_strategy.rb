module GemLint
  module Strategies
    class DuplicateAuthorsStrategy < AbstractStrategy

      def description
        "Authors field in spec should have no duplicate values"
      end

      def tag
        :"duplicate-authors"
      end

      def level
        :warning
      end

      def fail?
        yaml.authors.is_a?(Array) && yaml.authors.uniq.size != yaml.authors.size
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
