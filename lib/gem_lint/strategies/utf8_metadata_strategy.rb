module GemLint
  module Strategies
    class Utf8MetadataStrategy < AbstractStrategy

      def description
        "Ensure the gem metadata is all utf8 encoded"
      end

      def tag
        :"utf8-metadata"
      end

      def level
        :error
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
