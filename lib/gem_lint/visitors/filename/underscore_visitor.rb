module GemLint
  module Visitors
    module Filename
      class UnderscoreVisitor

        def initialize(filename)
          @filename = filename
        end

        def self.description
          "Gem contains no underscores in it's name"
        end

        def self.tag
          :"name-contains-underscore"
        end

        def pass?
          !fail?
        end

        def fail?
          @filename.include?("_")
        end

        private

        def root_files
          Dir.entries(@path)
        end

      end
    end
  end
end
