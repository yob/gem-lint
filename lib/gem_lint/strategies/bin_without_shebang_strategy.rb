module GemLint
  module Strategies
    class BinWithoutShebangStrategy < AbstractStrategy

      def description
        "A file in bin/ doesn't have a shebang on the first line"
      end

      def tag
        :"bin-without-shebang"
      end

      def fail?
        bin_files.any? { |path|
          data = File.open(self.path + "/" + path) { |f| f.read }
          first_line = data.split("\n")[0]
          !first_line.to_s.include?("env ruby")
        }
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
