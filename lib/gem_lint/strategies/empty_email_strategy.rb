module GemLint
  module Strategies
    class EmptyEmailStrategy < AbstractStrategy

      def description
        "Email field in spec is empty"
      end

      def tag
        :"empty-email"
      end

      def level
        :error
      end

      def fail?
        yaml.email.is_a?(Array) && yaml.email.empty?
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
