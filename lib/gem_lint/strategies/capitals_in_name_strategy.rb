require 'find'

module GemLint
  module Strategies
    class CapitalsInNameStrategy < AbstractStrategy

      def description
        "It's strongly recommended that your gem name be all lower case"
      end

      def tag
        :"capitals-in-name"
      end

      def level
        :warning
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

