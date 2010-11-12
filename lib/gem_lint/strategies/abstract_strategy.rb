# coding: utf-8

module GemLint
  module Strategies
    class AbstractStrategy
      attr_reader :filename, :path, :metadata_path

      def initialize(args = {})
        @filename = args[:filename]
        @path     = args[:data_path]
        @metadata_path = args[:metadata_path]

        raise ArgumentError, "#{@path} is not a directory" unless File.directory?(@path)
        raise ArgumentError, "#{@metadata_path} is not a file" unless File.file?(@metadata_path)
        raise ArgumentError, ":filename must be a filename ending in gem" unless @filename.to_s[-4,4] == ".gem"
      end

    end
  end
end
