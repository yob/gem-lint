module GemLint
  module Strategies
    class RubyPlatformWithDllStrategy < AbstractStrategy

      def description
        "contains a DLL for windows, but platform is set to ruby"
      end

      def tag
        :"ruby-platform-with-dll"
      end

      def level
        :warning
      end

      def fail?
        contains_dll? && spec.platform == "ruby"
      end

      private

      def contains_dll?
        spec.files.any? { |file|
          file.downcase[-4,4] == ".dll"
        }
      end

      def spec
        @spec ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
