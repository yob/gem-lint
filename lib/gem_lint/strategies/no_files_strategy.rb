module GemLint
  module Strategies
    class NoFilesStrategy < AbstractStrategy

      def description
        "Gem containts no files"
      end

      def tag
        :"no-files"
      end

      def level
        :warning
      end

      def fail?
        yaml.files.empty?
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
