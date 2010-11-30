module GemLint
  module Strategies
    class BinEndsWithRbStrategy < AbstractStrategy

      def description
        "A file in bin/ ends in .rb"
      end

      def tag
        :"bin-ends-with-rb"
      end

      def level
        :warning
      end

      def fail?
        bin_files.any? { |path| path[-3,3] == ".rb" }
      end

      private

      def bin_files
        all_files.select { |path|
          path[0,4] == "bin/" && File.file?(self.path + "/" + path)
        }
      end

      def all_files
        paths = []
        Find.find(self.path) { |path| paths << path }
        paths.map { |path|
          path.gsub(self.path + "/","")
        }
      end

    end
  end
end
