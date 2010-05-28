# coding: utf-8

module GemLint
  module Visitors
    class AbstractVisitor
      attr_reader :path, :filename

      def initialize(args = {})
        @path     = args[:path]
        @filename = args[:filename]

        raise ArgumentError, "#{@path} is not a directory" unless File.directory?(@path)
        raise ArgumentError, ":filename must be a filename ending in gem" unless @filename.to_s[-4,4] == ".gem"
      end

    end
  end
end
