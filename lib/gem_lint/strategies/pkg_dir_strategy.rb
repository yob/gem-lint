module GemLint
  module Strategies
    class PkgDirStrategy < AbstractStrategy

      def description
        "Gem contains a directory in the root called pkg"
      end

      def tag
        :"pkg-dir"
      end

      def fail?
        root_files.any? { |filename|
          filename.match(/pkg.*/)
        }
      end

      private

      def root_files
        Dir.entries(self.path)
      end

    end
  end
end
