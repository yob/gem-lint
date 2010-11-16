require 'find'

module GemLint
  module Strategies
    class RequireMatchesGemnameStrategy < AbstractStrategy

      def self.description
        "Gem cannot be loaded by require 'gemname'"
      end

      def self.tag
        :"require-doesnt-match-gemname"
      end

      def pass?
        spec.files.include?(preferred_filename)
      end

      def fail?
        !pass?
      end

      private

      def preferred_filename
        "lib/" + spec.name.tr("-","/") + ".rb"
      end

      def spec
        @spec ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end

