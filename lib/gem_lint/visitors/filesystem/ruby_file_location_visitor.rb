require 'find'

module GemLint
  module Visitors
    module Filesystem
      class RubyFileLocationVisitor

        def initialize(path)
          @path = path
        end

        def self.description
          "Gem contains ruby files outside of lib, test and spec"
        end

        def self.tag
          :"ruby-files-outside-lib-test-spec"
        end

        def pass?
          !pass?
        end

        def fail?
          all_files.any? do |filename|
            filename[0,3] != "lib" && filename[0,4] != "spec" && 
              filename[0,4] != "test" && filename[-3,3] == ".rb"
          end
        end

        private

        def all_files
          paths = []
          Find.find(@path) { |path| paths << path }
          paths.map { |path|
            path.gsub(@path + "/","")
          }
        end

      end
    end
  end
end
