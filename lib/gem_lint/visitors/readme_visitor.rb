module GemLint
  module Visitors
    class ReadmeVisitor < AbstractVisitor

      def self.description
        "Gem contains no readme file"
      end

      def self.tag
        :"no-readme"
      end

      def pass?
        root_files.any? do |filename|
          filename.downcase.include?("readme")
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
