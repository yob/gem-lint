module GemLint
  module Strategies
    class ReadmeStrategy < AbstractStrategy

      def description
        "Gem contains no readme file"
      end

      def tag
        :"no-readme"
      end

      def fail?
        root_files.none? do |filename|
          filename.downcase.include?("readme")
        end
      end

      private

      def root_files
        Dir.entries(self.path)
      end

    end
  end
end
