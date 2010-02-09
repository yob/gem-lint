module GemLint
  module Visitors
    module Filesystem
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
          root_files.each do |filename|
            return true if filename.downcase.include?("readme")
          end
          false
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
end
