require 'find'

module GemLint
  module Strategies
    class CapitalsInNameStrategy < AbstractStrategy

      def self.description
        "It's strongly recommended that your gem name be all lower case"
      end

      def self.tag
        :"capitals-in-name"
      end

      def pass?
        !self.fail?
      end

      def fail?
        spec.name.match(/[A-Z]/)
      end

      private

      def spec
        @spec ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end

