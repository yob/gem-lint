module GemLint
  module Strategies
    class ChangelogStrategy < AbstractStrategy

      def self.description
        "Gem contains no changelog or history file"
      end

      def self.tag
        :"no-changelog-or-history"
      end

      def pass?
        root_files.any? do |filename|
          dfile = filename.downcase
          dfile.include?("changelog") || dfile.include?("history")
        end
      end

      def fail?
        !pass?
      end

      private

      def root_files
        Dir.entries(self.path)
      end

    end
  end
end
