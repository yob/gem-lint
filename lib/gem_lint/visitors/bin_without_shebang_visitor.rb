module GemLint
  module Visitors
    class BinWithoutShebangVisitor < AbstractVisitor

      def self.description
        "A file in bin/ doesn't have a shebang on the first line"
      end

      def self.tag
        :"bin-without-shebang"
      end

      def pass?
        !self.fail?
      end

      def fail?
        bin_files.any? { |path|
          puts path
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
