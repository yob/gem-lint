module GemLint
  module Strategies
    class MissingLicenseStrategy < AbstractStrategy

      def description
        "Gem appears to contain a license file, but no license is specified in the spec"
      end

      def tag
        :"missing-license"
      end

      def level
        :warning
      end

      def fail?
        has_license_file? && blank_license_field?
      end

      private

      def spec
        @spec ||= YAML.load(File.read(@metadata_path))
      end

      def blank_license_field?
        [spec.licenses].flatten.compact.empty?
      end

      def has_license_file?
        spec.files.map { |filename| 
          filename.downcase
        }.any? { |filename|
          ["license","copying","mit-license"].include?(filename)
        }
      end

    end
  end
end
