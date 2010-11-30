module GemLint
  module Strategies
    class ContainsGemFileStrategy < AbstractStrategy

      def description
        "Gem contains at least 1 other gem file"
      end

      def tag
        :"contains-gem-file"
      end

      def level
        :warning
      end

      def fail?
        spec.files.any? { |filename|
          filename.match(/\A.*\.gem\Z/)
        }
      end

      private

      def spec
        @spec ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
