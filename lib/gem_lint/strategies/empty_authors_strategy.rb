module GemLint
  module Strategies
    class EmptyAuthorsStrategy < AbstractStrategy

      def description
        "Authors field is empty"
      end

      def tag
        :"empty-authors"
      end

      def level
        :warning
      end

      def fail?
        yaml.authors.is_a?(Array) && yaml.authors.empty?
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
