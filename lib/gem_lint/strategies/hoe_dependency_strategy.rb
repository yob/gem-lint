module GemLint
  module Strategies
    class HoeDependencyStrategy < AbstractStrategy

      def description
        "Hoe should probably be a development dependency insted of runtime"
      end

      def tag
        :"hoe-dependency"
      end

      def level
        :warning
      end

      def fail?
        yaml.dependencies.select { |dep|
          dep.type == :runtime
        }.any? { |dep|
          dep.name == "hoe"
        }
      end

      private

      def yaml
        @yaml ||= YAML.load(File.read(@metadata_path))
      end

    end
  end
end
