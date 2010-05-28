require 'find'

module GemLint
  module Visitors
    class RequireMatchesGemnameVisitor < AbstractVisitor

      def self.description
        "Gem cannot be loaded by require 'gemname'"
      end

      def self.tag
        :"require-doesnt-match-gemname"
      end

      def pass?
        all_files.include?("lib/#{gemname}.rb")
      end

      def fail?
        !pass?
      end

      private

      def gemname
        m, name = *self.filename.match(/([a-zA-Z0-9\-]+?)-[0-9\.]+.gem/)
        name
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

