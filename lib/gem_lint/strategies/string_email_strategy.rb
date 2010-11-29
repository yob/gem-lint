module GemLint
  module Strategies
    class StringEmailStrategy < AbstractStrategy

      def description
        "Email field in spec is a String instead of an Array"
      end

      def tag
        :"string-email"
      end

      def fail?
        yaml.email.is_a?(String)
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
