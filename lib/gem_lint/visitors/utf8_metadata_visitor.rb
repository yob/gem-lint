module GemLint
  module Visitors
    class Utf8MetadataVisitor < AbstractVisitor

      def self.description
        "Ensure the gem metadata is all utf8 encoded"
      end

      def self.tag
        :"utf8-metadata"
      end

      def pass?
        !self.fail?
      end

      def fail?
        File.read(@metadata_path).unpack("U*")
        false
      rescue
        true
      end

    end
  end
end
