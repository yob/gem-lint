module GemLint
  module Strategies
    class ValidEmailStrategy < AbstractStrategy

      def self.description
        "Ensure gem metadata has valid email details"
      end

      def self.tag
        :"valid-email"
      end

      def pass?
        yaml.email.is_a?(String) || yaml.email.is_a?(Array)
      end

      def fail?
        !self.pass?
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
