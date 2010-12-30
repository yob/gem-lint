module GemLint
  module Strategies
    class JewelerDependencyStrategy < AbstractStrategy

      def description
        "Jeweler should probably be a development dependency insted of runtime"
      end

      def tag
        :"jeweler-dependency"
      end

      def level
        :warning
      end

      def fail?
        yaml.dependencies.select { |dep|
          dep.type == :runtime
        }.any? { |dep|
          dep.name == "jeweler"
        }
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
