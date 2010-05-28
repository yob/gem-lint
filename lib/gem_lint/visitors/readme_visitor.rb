module GemLint
  module Visitors
    class ReadmeVisitor

      def initialize(path)
        @path = path
      end

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
        Dir.entries(@path)
      end

    end
  end
end
