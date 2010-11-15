module GemLint
  module Strategies
    class ContainsGemFileStrategy < AbstractStrategy

      def self.description
        "Gem contains at least 1 other gem file"
      end

      def self.tag
        :"contains-gem-file"
      end

      def pass?
        !self.fail?
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
