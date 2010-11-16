require 'find'

module GemLint
  module Strategies
    class TestFilesInFilesAttributeStrategy < AbstractStrategy

      def description
        "Gem metadata includes test files in files attribute. Use test_files instead"
      end

      def tag
        :"test-files-in-files-attribute"
      end

      def fail?
        yaml.files.any? { |filename|
          filename[-8,8] == "_spec.rb" || filename[-8,8] == "_test.rb"
        }
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
