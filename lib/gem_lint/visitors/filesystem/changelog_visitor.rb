module GemLint
  module Visitors
    module Filesystem
      class ChangelogVisitor

        def initialize(path)
          @path = path
        end

        def self.description
          "Gem contains no changelog or history file"
        end

        def self.tag
          :"no-changelog-or-history"
        end

        def pass?
          root_files.each do |filename|
            dfile = filename.downcase
            if dfile.include?("changelog") || dfile.include?("history")
              return true 
            end
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
