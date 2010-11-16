require 'find'

module GemLint
  module Strategies
    class RequireMatchesGemnameStrategy < AbstractStrategy

      def description
        "Gem cannot be loaded by require 'gemname'"
      end

      def tag
        :"require-doesnt-match-gemname"
      end

      def fail?
        !spec.files.include?(preferred_filename)
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

