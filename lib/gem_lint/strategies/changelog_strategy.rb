module GemLint
  module Strategies
    class ChangelogStrategy < AbstractStrategy

      def description
        "Gem contains no changelog or history file"
      end

      def tag
        :"no-changelog-or-history"
      end

      def level
        :warning
      end

      def fail?
        root_files.none? do |filename|
          dfile = filename.downcase
          dfile.include?("changelog") || dfile.include?("history")
        end
      end

      private

      def root_files
        Dir.entries(self.path)
      end

    end
  end
end
